package com.xx.edu.service.impl;

import com.xx.edu.model.Book;
import com.xx.edu.model.Category;
import com.xx.edu.model.Comment;
import com.xx.edu.model.Request;
import com.xx.edu.service.IBookService;
import com.xx.edu.service.base.IBaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("BookService")
@Transactional
public class BookServiceImpl extends IBaseServiceImpl<Book> implements IBookService {

    @Override
    public void insert(Book book) {
        bookMapper.insert(book);
    }

    @Override
    public void deleteById(Integer id) {

    }

    @Override
    public void deleteByUUId(String id) {

    }

    @Override
    public void update(Book book) {
        bookMapper.update(book);
    }

    @Override
    public Book findById(Integer id) {
        return bookMapper.findById(id);
    }

    @Override
    public Book findByUUId(String id) {
        return bookMapper.findByUUId(id);
    }

    @Override
    public Book findByName(String name) {
        return bookMapper.findByName(name);
    }

    public List<Category> getAllCategories(){
        return bookMapper.getAllCategories();
    }

    @Override
    public Category findCategoryByName(String name) {
        return bookMapper.findCategoryByName(name);
    }

    @Override
        public List<Book> getBooksByUserId(int userId) {
        return bookMapper.getBooksByUserId(userId);
    }

    @Override
    public List<Book> getAllBooks() {
        return bookMapper.getAllBooks();
    }

    @Override
    public void newRequest(Request request) {
        bookMapper.newRequest(request);
    }

    @Override
    public List<Request> getRequestByUserId(int userId) {
        return bookMapper.getRequestByUserId(userId);
    }
}
