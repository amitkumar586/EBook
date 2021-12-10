
package com.learn.myebook.dao;

import com.learn.myebook.entities.BookOrder;
import java.util.List;

public interface BookOrderDao 
{
    public boolean saveOrder(List<BookOrder> booklist);
    
    public List<BookOrder> getbook(String email);
    
    public List<BookOrder> getAllOrder();
    
}
