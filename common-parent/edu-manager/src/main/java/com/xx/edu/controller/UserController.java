package com.xx.edu.controller;

import java.io.File;

import com.xx.edu.model.Book;
import com.xx.edu.model.Comment;
import com.xx.edu.model.Request;
import com.xx.edu.model.User;
import com.xx.edu.service.impl.BookServiceImpl;
import com.xx.edu.service.impl.UserServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Random;

@Controller("UserController")
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private BookServiceImpl bookService;

    @RequestMapping("defaultpage")
    public String showDefaultPage() {
        return "/Default";
    }

    @RequestMapping("RegisterPage")
    public String RegisterPage() {
        return "/User/RegisterPage";
    }

    @RequestMapping("loginPage")
    public String loginPage() {
        return "/User/LoginPage";
    }

    @RequestMapping("changePassword")
    public String changePassword() {
        return "/User/ChangePassword";
    }

    @RequestMapping("userBaseInfo")
    public String userBaseInfo() {
        return "/User/UserBaseInfo";
    }

    @RequestMapping("userCollection")
    public String userCollection() {
        return "/User/UserCollection";
    }

    @RequestMapping("userLockBook")
    public String userLockBook(HttpServletResponse httpServletResponse, HttpServletRequest httpServletRequest,Model model) {
        User currentUser = (User) httpServletRequest.getSession().getAttribute("currentUser");
        List<Book> books = bookService.getBooksByUserId(currentUser.getUserId());
        for (int i = 0; i < books.size(); i++) {
            if (!books.get(i).getState().equals("私人")) {
                books.remove(books.get(i));
                i--;
            }
        }
        model.addAttribute("books",books);

        return "/Book/LockBook";
    }

    @RequestMapping("userMain")
    public String userMain(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
//        if(httpServletRequest.getSession().getAttribute("currentUser") == null){
//            return "/User/LoginPage";
//        }
        return "/User/UserMain";
    }

    @RequestMapping("ownerAgreement")
    public String ownerAgreement(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,Model model)
    {
        int userId = Integer.parseInt(httpServletRequest.getParameter("userId"));
        List<Request> requests= bookService.getRequestByUserId(userId);
        model.addAttribute("requests",requests);
        return "/User/OwnerAgreement";
    }

    @RequestMapping("login")
    public String login(HttpServletResponse httpServletResponse, HttpServletRequest httpServletRequest, Model model) throws UnsupportedEncodingException {
//        可以通过账号或用户名进行登陆
        String userName = httpServletRequest.getParameter("userName");
        String password = httpServletRequest.getParameter("password");
        User user = (User) userService.findByUUId(userName);

        if (user != null) {
            if (user.getPassword().equals(password)) {
                HttpSession httpSession = httpServletRequest.getSession();
                httpSession.setAttribute("currentUser", user);
                System.out.println("login success");
                return "/Default";
            } else if (!user.getPassword().equals(password)) {
                System.out.println("login fail");
                return "/User/LoginPage";
            }
        }
        return "/User/LoginPage";
    }

    @RequestMapping("logout")
    public String logout(HttpServletResponse httpServletResponse, HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().invalidate();
        return "/Default";
    }

    @RequestMapping("register")
    public void register(HttpServletResponse httpServletResponse, HttpServletRequest httpServletRequest) throws IOException {
        String password = httpServletRequest.getParameter("password");
        String alignPassword = httpServletRequest.getParameter("alignPassword");
        PrintWriter out = httpServletResponse.getWriter();

        //密码不匹配，注册失败
        if (!password.equals(alignPassword)) {
            System.out.println("password is not align.");
            out.write("<script language='javascript'>");
            out.write("alert('密码不匹配！');");
            out.write("history.back(-1)");
            out.write("</script>");
//            return "/User/LoginOrRegister";
        } else {
            //生成一个数据库没有的随机userId
            User user = new User();
            String randomUserId = null;
            while (user != null) {
                randomUserId = generateUserId(8);
                user = (User) userService.findByUUId(randomUserId);
            }

            user = new User();
            user.setUserId(Integer.parseInt(randomUserId));
            user.setUserName(httpServletRequest.getParameter("userName"));
            user.setPassword(httpServletRequest.getParameter("password"));
            user.setEmail(httpServletRequest.getParameter("email"));
            user.setTel(httpServletRequest.getParameter("tel"));
            user.setProfilePhoto("userimg.png");

            userService.insert(user);

            //返回生成的账号
            out.write("<script language='javascript'>");
            out.write("alert(\"账号:" + randomUserId + "\");");
            out.write("history.back(-1)");
            out.write("</script>");
//            httpServletResponse.sendRedirect("loginPage.do");
//        return "/Default";
        }
    }

    @RequestMapping("updatePassword")
    public void updatePassword(HttpServletResponse httpServletResponse, HttpServletRequest httpServletRequest) throws IOException {
        String oldPassword = httpServletRequest.getParameter("oldPassword");
        String newPassword = httpServletRequest.getParameter("newPassword");
        String alignNewPassword = httpServletRequest.getParameter("alignNewPassword");
        PrintWriter out = httpServletResponse.getWriter();

        //从数据库获取原密码，看是否匹配
        User currentUser = (User) httpServletRequest.getSession().getAttribute("currentUser");

        if (currentUser.getPassword().equals(oldPassword)) {
            if (!newPassword.equals(alignNewPassword)) {
                System.out.println("password is not align.");
                out.write("<script language='javascript'>");
                out.write("alert('密码不匹配');");
                out.write("history.back(-1)");
                out.write("</script>");
            } else {
                //修改密码，更新数据库
                currentUser.setPassword(newPassword);
                userService.update(currentUser);
                out.write("<script language='javascript'>");
                out.write("alert('修改成功！');");
                out.write("history.back(-1)");
                out.write("</script>");
            }
        } else {
            out.write("<script language='javascript'>");
            out.write("alert('原密码错误！');");
            out.write("history.back(-1)");
            out.write("</script>");
        }

    }

    @RequestMapping("updateUserInfo")
    public void updateUserInfo(HttpServletResponse httpServletResponse, HttpServletRequest httpServletRequest) throws Exception {
        User user = (User) httpServletRequest.getSession().getAttribute("currentUser");
        PrintWriter out = httpServletResponse.getWriter();

        if (ServletFileUpload.isMultipartContent(httpServletRequest)) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
            List<FileItem> items = servletFileUpload.parseRequest(httpServletRequest);

            //遍历取出字段
            for (FileItem item : items) {
                String itemName = item.getFieldName();
                if (item.isFormField()) {
                    switch (itemName) {
                        case "userId":
                            user.setUserId(Integer.parseInt(item.getString()));
                            break;
                        case "userName":
                            user.setUserName(item.getString("utf-8"));
                            break;
                        case "email":
                            user.setEmail(item.getString());
                            break;
                        case "tel":
                            user.setTel(item.getString());
                            break;
                        default:

                            break;
                    }
                } else {
                    String fileName = item.getName();
//                    String path = httpServletRequest.getSession().getServletContext().getRealPath("upload");
                    if (!fileName.equals("")) {
                        String path = "D:\\Workspaces\\Java Workspace\\passbook\\profilePhotos";
                        File file = new File(path,fileName);
                        item.write(file);
                        user.setProfilePhoto(fileName);
                    }
                }
            }
            userService.update(user);
        }
        out.write("<script language='javascript'>");
        out.write("alert('修改成功！');");
        out.write("history.back(-1)");
        out.write("</script>");
    }

    private static String generateUserId(int count) {
        StringBuffer sb = new StringBuffer();
        String str = "0123456789";
        Random r = new Random();
        for (int i = 0; i < count; i++) {
            int num = r.nextInt(str.length());
            sb.append(str.charAt(num));
            str = str.replace((str.charAt(num) + ""), "");
        }
        return sb.toString();
    }

    @RequestMapping("agree")
    public void agree(HttpServletResponse httpServletResponse, HttpServletRequest httpServletRequest) throws IOException {
        int requestId = Integer.parseInt(httpServletRequest.getParameter("requestId"));
        String bookName = httpServletRequest.getParameter("bookName");
        Request request = userService.findRequestById(requestId);
        User user = userService.findById(request.getRequesterId());
        Book book = bookService.findByName(bookName);
        book.setState("私人");
        book.setOwners(String.valueOf(user.getUserId()));
        request.setState("已赠出");
        userService.agree(request);
        bookService.update(book);
        PrintWriter out = httpServletResponse.getWriter();

        out.write("<script language='javascript'>");
        out.write("alert('已赠出！');");
        out.write("history.back(-1)");
        out.write("</script>");
    }

    @RequestMapping("comment")
    public void comment(HttpServletResponse httpServletResponse, HttpServletRequest httpServletRequest) throws IOException {
        User user = (User) httpServletRequest.getSession().getAttribute("currentUser");
        PrintWriter out = httpServletResponse.getWriter();
        String content = httpServletRequest.getParameter("message");
        int bookId = Integer.parseInt(httpServletRequest.getParameter("bookId"));

        Comment newComment = new Comment();
        newComment.setContent(content);
        newComment.setBookId(bookId);
        newComment.setUserId(user.getUserId());
        newComment.setUserName(user.getUserName());

        userService.comment(newComment);
        out.write("<script language='javascript'>");
        out.write("alert('留言成功！');");
        out.write("history.back(-1)");
        out.write("</script>");
    }
}
