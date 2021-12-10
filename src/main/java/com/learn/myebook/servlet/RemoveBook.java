
package com.learn.myebook.servlet;

import com.learn.myebook.daoimpl.CartDaoImpl;
import com.learn.myebook.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RemoveBook extends HttpServlet {
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            try 
            {
               int bookid =Integer.parseInt(request.getParameter("bookid"));
               int userid =Integer.parseInt(request.getParameter("userid"));
               int cartid =Integer.parseInt(request.getParameter("cartid"));
               CartDaoImpl cdao = new CartDaoImpl(ConnectionProvider.getConnetaion()); 
               boolean f = cdao.deletebook(bookid,userid,cartid);
               HttpSession session = request.getSession();
            
               if(f)
               {
                 session.setAttribute("message" , "Book Romov from cart");
                 response.sendRedirect("checkout.jsp");
               }
               else
               {
                 session.setAttribute("message" , "Something went wrong....");
                 response.sendRedirect("checkout.jsp");
                
               }
                
            } catch (Exception e) 
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
