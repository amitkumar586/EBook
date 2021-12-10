
package com.learn.myebook.daoimpl;

import com.learn.myebook.dao.CartDao;
import com.learn.myebook.entities.BookDetails;
import com.learn.myebook.entities.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl implements CartDao
{
    private Connection con;
    
    public CartDaoImpl(Connection con)
    {
        this.con = con;
    }
    
    @Override
    public boolean addCart(Cart c) 
    {
        boolean f = false;
        try 
        {
            String query ="insert into cart(bookid , userid , book_name , author , price , total_price ) values(? , ? , ? , ? , ? , ? )";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,c.getBookid());
            ps.setInt(2,c.getUserid());
            ps.setString(3, c.getBook_name());
            ps.setString(4, c.getAuthor());
            ps.setInt(5, c.getPrice());
            ps.setInt(6, c.getTotal_price());
            
            int  i = ps.executeUpdate();
            if(i == 1)
            {
                f = true ; 
            }
        } 
        catch (Exception e)
        {
            e.printStackTrace();
        }
       return f;
    }

    @Override
    public List<Cart> getBookByUser(int userId) {
        List<Cart> list = new ArrayList<Cart>();
        Cart c = null;
        int totalprice = 0;
        try
        {
         String query = "select * from cart where userid = ?";   
         PreparedStatement ps = con.prepareStatement(query);
         ps.setInt(1, userId);
         
         ResultSet rs = ps.executeQuery();
         
         while(rs.next())
         {
             c = new Cart();
             c.setCartid(rs.getInt(1));
             c.setBookid(rs.getInt(2));
             c.setUserid(rs.getInt(3));
             c.setBook_name(rs.getString(4));
             c.setAuthor(rs.getString(5));
             c.setPrice(rs.getInt(6));
             
             totalprice = totalprice + rs.getInt(7);
             c.setTotal_price(totalprice);
             list.add(c);
         }
            
        } catch (Exception e) 
        {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean deletebook(int bookid,int userid,int cartid) 
    {
        boolean f = false;
        try {
            
        String query = "delete from cart where bookid=? and userid=? and cartid=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, bookid);
        ps.setInt(2, userid);
        ps.setInt(3, cartid);
        int i = ps.executeUpdate();
        
        if(i==1)
        {
            f=true;
        }
        } catch (Exception e) 
        {
            e.printStackTrace();
        }
       return f;
    }
}