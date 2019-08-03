package com.xx.edu.service;

import com.xx.edu.model.Book;
import com.xx.edu.model.Category;
import com.xx.edu.model.Request;
import com.xx.edu.service.base.IBaseService;

import java.util.List;

public interface IBookService extends IBaseService<Book> {
    public List<Category> getAllCategories();
    public Category findCategoryByName(String name);
    public List<Book> getBooksByUserId(int userId);
    public List<Book> getAllBooks();
    public void newRequest(Request request);
    public List<Request> getRequestByUserId(int userId);
}
