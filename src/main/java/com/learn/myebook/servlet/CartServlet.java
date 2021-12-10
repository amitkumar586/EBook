
package com.learn.myebook.servlet;

import com.learn.myebook.daoimpl.BookDaoImpl;
import com.learn.myebook.daoimpl.CartDaoImpl;
import com.learn.myebook.entities.BookDetails;
import com.learn.myebook.entities.Cart;
import com.learn.myebook.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            try
    {
       int bookid = Integer.parseInt(request.getParameter("bookid"));
       int userid = Integer.parseInt(request.getParameter("userid"));
       
        BookDaoImpl dao = new BookDaoImpl(ConnectionProvider.getConnetaion()); 
        BookDetails b = dao.getBookById(bookid);
        
        Cart c = new Cart();
        c.setBookid(bookid);
        c.setUserid(userid);
        c.setBook_name(b.getBook_name());
        c.setAuthor(b.getAuthor_name());
        c.setPrice(Integer.parseInt(b.getPrice()));
        c.setTotal_price(Integer.parseInt(b.getPrice()));
        
        CartDaoImpl dao1 = new CartDaoImpl(ConnectionProvider.getConnetaion());
        boolean  f = dao1.addCart(c);
        
        HttpSession session = request.getSession(); 
        
        if(f)
        {
            session.setAttribute("addcart" , "Book Added To Cart");
         //   response.sendRedirect("shownewbook.jsp");
        }
        else
        {
            session.setAttribute("failed" , "Something went wrong on server...");
         //   response.sendRedirect("shownewbook.jsp");
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
