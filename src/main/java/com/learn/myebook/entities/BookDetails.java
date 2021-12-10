
package com.learn.myebook.entities;

public class BookDetails
{
  private int bookid;
  private String book_name;
  private String author_name;
  private String price;
  private String bookcategory;
  private String status;
  private String photo;
  private String useremail;

    public BookDetails() {
    }

    public BookDetails(String book_name, String author_name, String price, String bookcategory, String status, String photo, String useremail) {
        this.book_name = book_name;
        this.author_name = author_name;
        this.price = price;
        this.bookcategory = bookcategory;
        this.status = status;
        this.photo = photo;
        this.useremail = useremail;
    }
    
    public BookDetails(int bookid, String book_name, String author_name, String price, String bookcategory, String status, String photo, String useremail) {
        this.bookid = bookid;
        this.book_name = book_name;
        this.author_name = author_name;
        this.price = price;
        this.bookcategory = bookcategory;
        this.status = status;
        this.photo = photo;
        this.useremail = useremail;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getBookcategory() {
        return bookcategory;
    }

    public void setBookcategory(String bookcategory) {
        this.bookcategory = bookcategory;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    @Override
    public String toString() {
        return "BookDetails{" + "bookid=" + bookid + ", book_name=" + book_name + ", author_name=" + author_name + ", price=" + price + ", bookcategory=" + bookcategory + ", status=" + status + ", photo=" + photo + ", useremail=" + useremail + '}';
    }   
}
