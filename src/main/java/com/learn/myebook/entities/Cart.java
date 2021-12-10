package com.learn.myebook.entities;

public class Cart {

    private int cartid;
    private int bookid;
    private int userid;
    private String book_name;
    private String author;
    private int price;
    private int total_price;

    public Cart() {
    }

    public Cart(int bookid, int userid, String book_name, String author, int price, int total_price) {
        this.bookid = bookid;
        this.userid = userid;
        this.book_name = book_name;
        this.author = author;
        this.price = price;
        this.total_price = total_price;
    }

    public Cart(int cartid, int bookid, int userid, String book_name, String author, int price, int total_price) {
        this.cartid = cartid;
        this.bookid = bookid;
        this.userid = userid;
        this.book_name = book_name;
        this.author = author;
        this.price = price;
        this.total_price = total_price;
    }

    public int getCartid() {
        return cartid;
    }

    public void setCartid(int cartid) {
        this.cartid = cartid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartid=" + cartid + ", bookid=" + bookid + ", userid=" + userid + ", book_name=" + book_name + ", author=" + author + ", price=" + price + ", total_price=" + total_price + '}';
    }

}
