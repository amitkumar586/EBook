package com.learn.myebook.daoimpl;

import com.learn.myebook.dao.BookOrderDao;
import com.learn.myebook.entities.BookOrder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookOrderDaoImpl implements BookOrderDao {

    private Connection con;

    public BookOrderDaoImpl(Connection con) {
        this.con = con;
    }

    

    public boolean saveOrder(List<BookOrder> booklist) {
        boolean f = false;
        try {
            String query = "insert into book_order(order_id , user_name , email , address , phone , book_name , author , price ,payment) values(?,?,?,?,?,?,?,?,?)";
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement(query);

            for (BookOrder b : booklist) {
                ps.setString(1, b.getOrder_id());
                ps.setString(2, b.getUser_name());
                ps.setString(3, b.getEmail());
                ps.setString(4, b.getAddress());
                ps.setString(5, b.getPhone());
                ps.setString(6, b.getBook_name());
                ps.setString(7, b.getAuthor());
                ps.setString(8, b.getPrice());
                ps.setString(9, b.getPayment());
                ps.addBatch();
            }
                
            int[]count = ps.executeBatch();
            con.commit();
            f=true;
            con.setAutoCommit(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<BookOrder> getbook(String email)
    {
        List<BookOrder>list=new ArrayList<BookOrder>();
        BookOrder order =null;
        
        try 
        {
            String query ="select * from book_order where email=?";
            
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                order = new BookOrder();
                order.setId(rs.getInt(1));
                order.setOrder_id(rs.getString(2));
                order.setUser_name(rs.getString(3));
                order.setEmail(rs.getString(4));
                order.setAddress(rs.getString(5));
                order.setPhone(rs.getString(6));
                order.setBook_name(rs.getString(7));
                order.setAuthor(rs.getString(8));
                order.setPrice(rs.getString(9));
                order.setPayment(rs.getString(10));
                list.add(order);
                
            }
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        }
     return list;   
    }
    
    public List<BookOrder> getAllOrder()
    {
        List<BookOrder>list=new ArrayList<BookOrder>();
        BookOrder order =null;
        
        try 
        {
            String query ="select * from book_order";     
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                order = new BookOrder();
                order.setId(rs.getInt(1));
                order.setOrder_id(rs.getString(2));
                order.setUser_name(rs.getString(3));
                order.setEmail(rs.getString(4));
                order.setAddress(rs.getString(5));
                order.setPhone(rs.getString(6));
                order.setBook_name(rs.getString(7));
                order.setAuthor(rs.getString(8));
                order.setPrice(rs.getString(9));
                order.setPayment(rs.getString(10));
                list.add(order);
            }
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
}
