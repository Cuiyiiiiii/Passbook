package com.xx.edu.service.impl;

import com.xx.edu.model.Comment;
import com.xx.edu.model.Request;
import com.xx.edu.model.User;
import com.xx.edu.service.IUserService;
import com.xx.edu.service.base.IBaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("UserService")
@Transactional
public class UserServiceImpl extends IBaseServiceImpl<User> implements IUserService {

    @Override
    public void insert(User user) {
        userMapper.insert(user);
    }

    @Override
    public void deleteById(Integer id) {

    }

    @Override
    public void deleteByUUId(String id) {

    }

    @Override
    public void update(User user) {
        userMapper.update(user);
    }

    @Override
    public User findById(Integer id) {
        return userMapper.findById(id);
    }

    @Override
    public User findByUUId(String id) {
        return userMapper.findByUUId(id);
    }

    @Override
    public User findByName(String name) {
        return userMapper.findByName(name);
    }

    @Override
    public void agree(Request request) {
        userMapper.agree(request);
    }

    @Override
    public Request findRequestById(int requestId) {
        return userMapper.findRequestById(requestId);
    }

    @Override
    public void comment(Comment comment) {
        userMapper.comment(comment);
    }

    @Override
    public List<Comment> getCommentsByBookId(int bookId) {
        return userMapper.getCommentsByBookId(bookId);
    }

}
