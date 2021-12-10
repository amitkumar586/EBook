
package com.learn.myebook.servlet;

import com.learn.myebook.daoimpl.BookDaoImpl;
import com.learn.myebook.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DeleteOldBook extends HttpServlet
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try 
            {
                String useremail = request.getParameter("useremail"); 
                int bookid = Integer.parseInt(request.getParameter("bookid"));
                
                BookDaoImpl dao = new BookDaoImpl(ConnectionProvider.getConnetaion());
                
                boolean f = dao.oldboookDelete(useremail , "old" , bookid);
                
                HttpSession session = request.getSession();
                if(f)
               {
                 session.setAttribute("message","Old Book Deleted Successfully");
                 response.sendRedirect("oldbook.jsp");
               }
               else
               {
                 session.setAttribute("message" , "Something went wrong....");
                 response.sendRedirect("oldbook.jsp");
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
    public String getServletInfo()
    {
        return "Short description";
    }

}
