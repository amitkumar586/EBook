
package com.learn.myebook.dao;

import com.learn.myebook.entities.BookDetails;
import java.util.List;

public interface BookDao
{
   public boolean saveBooks(BookDetails  bd); 
   
   public List<BookDetails> getAllBooks();
   
   public BookDetails getBookById(int id);
   
   public boolean updateEditBook( BookDetails b); 
   
   public boolean deleteBooks(int bookid); 
   
   public List<BookDetails> getNewBook();
   
   public List<BookDetails> getRecentBook();
   
   public List<BookDetails> getOldBooks();
   
   public List<BookDetails>getAllRecentBooks();
   
   public List<BookDetails>getAllNewBooks();
   
   public List<BookDetails>getAllOldBooks();
   
   public List<BookDetails>getBookByOld(String useremail,String bookcategory);
   
   public boolean oldboookDelete(String useremail ,String bookcategory ,int bookid);

   public List<BookDetails> getBookBySearch(String ch);

}
