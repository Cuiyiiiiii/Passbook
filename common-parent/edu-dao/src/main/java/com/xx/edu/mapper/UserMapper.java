package com.xx.edu.mapper;

import com.xx.edu.mapper.base.IBaseMapper;
import com.xx.edu.model.Comment;
import com.xx.edu.model.Request;
import com.xx.edu.model.User;

import java.util.List;


public interface UserMapper extends IBaseMapper<User> {
    public void agree(Request request);
    public Request findRequestById(int requestId);
    public void comment(Comment comment);
    public List<Comment> getCommentsByBookId(int bookId);
}
