package com.xx.edu.model;

public class Request {
    private int requestId;
    private int requesterId;
    private int ownerId;
    private String bookName;
    private String state;

    @Override
    public String toString() {
        return "Request{" +
                "requestId=" + requestId +
                ", requesterId=" + requesterId +
                ", ownerId=" + ownerId +
                ", bookName='" + bookName + '\'' +
                ", state='" + state + '\'' +
                '}';
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public int getRequesterId() {
        return requesterId;
    }

    public void setRequesterId(int requesterId) {
        this.requesterId = requesterId;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
