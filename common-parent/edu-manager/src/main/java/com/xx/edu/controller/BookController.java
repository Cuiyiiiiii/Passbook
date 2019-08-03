package com.xx.edu.controller;

import com.xx.edu.model.*;
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
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller("BookController")
@RequestMapping("book")
public class BookController {

    @Autowired
    private BookServiceImpl bookService;
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("bookManage")
    public String bookMange(Model model) {
        List<Category> categories = bookService.getAllCategories();
        model.addAttribute("categories", categories);
        return "/Book/BookManage";
    }

    @RequestMapping("bookBrowsing")
    public String bookBrowsing(HttpServletResponse httpServletResponse, HttpServletRequest httpServletRequest, Model model) {

        User currentUser = (User) httpServletRequest.getSession().getAttribute("currentUser");
        List<Book> books = bookService.getAllBooks();
        String bookId = httpServletRequest.getParameter("bookId");
        String categoryId = httpServletRequest.getParameter("categoryId");
// || category != books.get(i).getCategoryId()
        if (currentUser != null) {
            for (int i = 0; i < books.size(); i++) {
                if (currentUser.getUserId() == Integer.parseInt(books.get(i).getOwners())) {
                    books.remove(books.get(i));
                    i--;
                }
            }
        }

        for(int i = 0;i<books.size();i++)
        {
            if(books.get(i).getState().equals("私人"))
            {
                books.remove(books.get(i));
                i--;
            }
        }
        model.addAttribute("books", books);
        return "/Book/BookBrowsing";
    }

    @RequestMapping("bookUpload")
    public String bookUpload(Model model) {
        List<Category> categories = bookService.getAllCategories();
        model.addAttribute("categories", categories);
        return "/Book/UploadBook";
    }

    @RequestMapping("bookAlter")
    public String bookAlter(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Model model) {
        String bookId = httpServletRequest.getParameter("bookId");
        Book book = bookService.findById(Integer.parseInt(bookId));
        List<Category> categories = bookService.getAllCategories();
        model.addAttribute("categories", categories);
        model.addAttribute("book", book);
        return "/Book/AlterBook";
    }

    @RequestMapping("bookInfo")
    public String bookInfo(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,Model model) {
        String bookId = httpServletRequest.getParameter("bookId");
        Book book = bookService.findById(Integer.parseInt(bookId));
        List<Comment> comments = userService.getCommentsByBookId(Integer.parseInt(bookId));
        model.addAttribute("comments",comments);
        model.addAttribute("book",book);
        return "/Book/BookInfo";
    }

    @RequestMapping("checkUpload")
    public String checkUpload(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Model model) throws IOException {
        User user = (User) httpServletRequest.getSession().getAttribute("currentUser");
        PrintWriter out = httpServletResponse.getWriter();

        List<Book> books = bookService.getBooksByUserId(user.getUserId());
        model.addAttribute("books", books);

        return "/Book/CheckUpload";
    }

    @RequestMapping("upload")
    public void upload(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        User user = (User) httpServletRequest.getSession().getAttribute("currentUser");
        PrintWriter out = httpServletResponse.getWriter();

        Book book = new Book();

        if (ServletFileUpload.isMultipartContent(httpServletRequest)) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
            List<FileItem> items = servletFileUpload.parseRequest(httpServletRequest);

            //遍历取出字段
            for (FileItem item : items) {
                String itemName = item.getFieldName();
                if (item.isFormField()) {
                    switch (itemName) {
                        case "bookName":
                            book.setBookName(item.getString("utf-8"));
                            break;
                        case "category":
                            book.setCategoryId(Integer.parseInt(item.getString("utf-8")));
                            break;
                        case "description":
                            book.setDescription(item.getString("utf-8"));
                            break;
                        default:

                            break;
                    }
                } else {
                    String fileName = item.getName();
                    if (!fileName.equals("")) {
                        String path = "D:\\Workspaces\\Java Workspace\\passbook\\bookPhotos";
                        File file = new File(path, fileName);
                        item.write(file);
                        book.setPhoto(fileName);
                    }
                }
            }
            book.setOwners(String.valueOf(user.getUserId()));
            book.setState("新发布");
            bookService.insert(book);
        }
        out.write("<script language='javascript'>");
        out.write("alert('发布成功！');");
        out.write("history.back(-1)");
        out.write("</script>");
    }

    @RequestMapping("updateBook")
    public void updateBook(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        Book currentBook = bookService.findById(Integer.parseInt(httpServletRequest.getParameter("bookId")));
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
                        case "bookName":
                            currentBook.setBookName(item.getString("utf-8"));
                            break;
                        case "categoryName":
                            currentBook.setCategoryId(Integer.parseInt(item.getString("utf-8")));
                            break;
                        case "description":
                            currentBook.setDescription(item.getString("utf-8"));
                            break;
                        default:

                            break;
                    }
                } else {
                    String fileName = item.getName();
                    if (!fileName.equals("")) {
                        String path = "D:\\Workspaces\\Java Workspace\\passbook\\bookPhotos";
                        File file = new File(path, fileName);
                        item.write(file);
                        currentBook.setPhoto(fileName);
                        System.out.println("heiqiu~");
                    }
                }
            }
            bookService.update(currentBook);
        }
        out.write("<script language='javascript'>");
        out.write("alert('修改成功！');");
        out.write("history.back(-1)");
        out.write("</script>");
    }

    @RequestMapping("want")
    public void want(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
        User user = (User) httpServletRequest.getSession().getAttribute("currentUser");
        PrintWriter out = httpServletResponse.getWriter();
        int bookId = Integer.parseInt(httpServletRequest.getParameter("bookId"));
        Book book = bookService.findById(bookId);

        Request newRequest = new Request();
        newRequest.setRequesterId(user.getUserId());
        newRequest.setOwnerId(Integer.parseInt(book.getOwners()));
        newRequest.setBookName(book.getBookName());
        newRequest.setState("未同意");

        bookService.newRequest(newRequest);

        out.write("<script language='javascript'>");
        out.write("alert('已通知书主！');");
        out.write("history.back(-1)");
        out.write("</script>");
    }
}
