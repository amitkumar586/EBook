
package com.learn.myebook.dao;

import com.learn.myebook.entities.BookDetails;
import com.learn.myebook.entities.Cart;
import java.util.List;

public interface CartDao 
{
    public boolean addCart(Cart c);
    public List<Cart> getBookByUser(int userId);
    public boolean deletebook(int bookid,int userid,int cartid);
    
}
