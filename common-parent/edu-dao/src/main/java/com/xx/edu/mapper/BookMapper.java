package com.xx.edu.mapper;

import com.xx.edu.mapper.base.IBaseMapper;
import com.xx.edu.model.Book;
import com.xx.edu.model.Category;
import com.xx.edu.model.Request;

import java.util.List;

public interface BookMapper extends IBaseMapper<Book> {
    public List<Category> getAllCategories();
    public Category findCategoryByName(String name);
    public List<Book> getBooksByUserId(int userId);
    public List<Book> getAllBooks();
    public void newRequest(Request request);
    public List<Request> getRequestByUserId(int UserId);
}
