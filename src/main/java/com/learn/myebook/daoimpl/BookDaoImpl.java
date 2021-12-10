package com.learn.myebook.daoimpl;

import com.learn.myebook.dao.BookDao;
import com.learn.myebook.entities.BookDetails;
import com.learn.myebook.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDaoImpl implements BookDao {
    
    private Connection con;
    
    public BookDaoImpl(Connection con) {
        this.con = con;
    }
    
    public boolean saveBooks(BookDetails bd) {
        boolean f = false;
        try {
            String query = "insert into book_details( book_name , author_name , price , bookcategory , status , photo , useremail) values (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, bd.getBook_name());
            ps.setString(2, bd.getAuthor_name());
            ps.setString(3, bd.getPrice());
            ps.setString(4, bd.getBookcategory());
            ps.setString(5, bd.getStatus());
            ps.setString(6, bd.getPhoto());
            ps.setString(7, bd.getUseremail());
            
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    @Override
    public List<BookDetails> getAllBooks() {
        List<BookDetails> booklist = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String query = "select * from book_details";
            PreparedStatement ps = con.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetails();
                b.setBookid(rs.getInt(1));
                b.setBook_name(rs.getString(2));
                b.setAuthor_name(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
                booklist.add(b);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return booklist;
    }
    
    @Override
    public BookDetails getBookById(int id) {
        BookDetails b = null;
        try {
            String query = "select * from book_details where bookid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDetails();
                b.setBookid(rs.getInt(1));
                b.setBook_name(rs.getString(2));
                b.setAuthor_name(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
    
    @Override
    public boolean updateEditBook(BookDetails b) {
        
        boolean f = false;
        
        try {
            String query = " update book_details set book_name=? , author_name=? , price=? , status=? where bookid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, b.getBook_name());
            ps.setString(2, b.getAuthor_name());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookid());
            
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    @Override
    public boolean deleteBooks(int bookid) {
        boolean f = false;
        try {
            String query = "delete from book_details where bookid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, bookid);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    @Override
    public List<BookDetails> getNewBook() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String query = " select * from book_details where bookcategory=? and status=? order by bookid DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDetails();
                b.setBookid(rs.getInt(1));
                b.setBook_name(rs.getString(2));
                b.setAuthor_name(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
                list.add(b);
                i++;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public List<BookDetails> getRecentBook() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String query = " select * from book_details where status=? order by bookid DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDetails();
                b.setBookid(rs.getInt(1));
                b.setBook_name(rs.getString(2));
                b.setAuthor_name(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
                list.add(b);
                i++;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<BookDetails> getOldBooks() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String query = " select * from book_details where bookcategory=? and status=? order by bookid DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDetails();
                b.setBookid(rs.getInt(1));
                b.setBook_name(rs.getString(2));
                b.setAuthor_name(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
                list.add(b);
                i++;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public List<BookDetails> getAllRecentBooks() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String query = " select * from book_details where status=? order by bookid DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "Active");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                b = new BookDetails();
                b.setBookid(rs.getInt(1));
                b.setBook_name(rs.getString(2));
                b.setAuthor_name(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
                list.add(b);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public List<BookDetails> getAllNewBooks() {
        
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String query = " select * from book_details where bookcategory=? and status=? order by bookid DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "New");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                b = new BookDetails();
                b.setBookid(rs.getInt(1));
                b.setBook_name(rs.getString(2));
                b.setAuthor_name(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
                list.add(b);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public List<BookDetails> getAllOldBooks() {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        try {
            String query = " select * from book_details where bookcategory=? and status=? order by bookid DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "old");
            ps.setString(2, "Active");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                b = new BookDetails();
                b.setBookid(rs.getInt(1));
                b.setBook_name(rs.getString(2));
                b.setAuthor_name(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
                list.add(b);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public List<BookDetails> getBookByOld(String useremail, String bookcategory) {
        List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        
        try {
            String query = "select * from book_details where bookcategory=? and useremail=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, bookcategory);
            ps.setString(2, useremail);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                b = new BookDetails();
                b.setBookid(rs.getInt(1));
                b.setBook_name(rs.getString(2));
                b.setAuthor_name(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean oldboookDelete(String useremail, String bookcategory, int bookid) {
        boolean f = false;
        
        try {
            String query = "delete from book_details where bookcategory=? and useremail=? and bookid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, bookcategory);
            ps.setString(2, useremail);
            ps.setInt(3, bookid);
            
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public List<BookDetails> getBookBySearch(String ch)
    {
       List<BookDetails> list = new ArrayList<BookDetails>();
        BookDetails b = null;
        
        try {
            String query = "select * from book_details where book_name like ? or author_name like ? or bookcategory like ? and status=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, "%"+ch+"%");
            ps.setString(2, "%"+ch+"%");
            ps.setString(3, "%"+ch+"%");
            ps.setString(4, "Active");
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                b = new BookDetails();
                b.setBookid(rs.getInt(1));
                b.setBook_name(rs.getString(2));
                b.setAuthor_name(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhoto(rs.getString(7));
                b.setUseremail(rs.getString(8));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list; 
    }
}
