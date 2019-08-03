package com.xx.edu.service;

import com.xx.edu.model.Comment;
import com.xx.edu.model.Request;
import com.xx.edu.model.User;
import com.xx.edu.service.base.IBaseService;

import java.util.List;


public interface IUserService extends IBaseService<User> {

    public void agree(Request request);
    public Request findRequestById(int requestId);
    public void comment(Comment comment);
    public List<Comment> getCommentsByBookId(int bookId);
}
