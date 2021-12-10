
package com.learn.myebook.servlet;

import com.learn.myebook.daoimpl.BookDaoImpl;
import com.learn.myebook.entities.BookDetails;
import com.learn.myebook.helper.ConnectionProvider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddOldBook extends HttpServlet
{ 
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try 
            {
                String bookname = request.getParameter("bookname");
                String authorName = request.getParameter("authorname");
                String price = request.getParameter("price");
                String bookCategory = "old";
                String bookStatus = "Active";
                Part part = request.getPart("fileupload");
                String photoupload = part.getSubmittedFileName();
                String useremail=request.getParameter("user");

                BookDetails bd = new BookDetails(bookname, authorName, price, bookCategory, bookStatus, photoupload, useremail);

                BookDaoImpl bdi = new BookDaoImpl(ConnectionProvider.getConnetaion());

                String path = getServletContext().getRealPath("")+"img";
                
                File file = new File(path);
                part.write(path + File.separator + photoupload);
                System.out.println(path);

                boolean f = bdi.saveBooks(bd);
            
            if(f)
            {
                HttpSession session = request.getSession();
                session .setAttribute("message", "Boook Added SuccessFully..!!");
                response.sendRedirect("sell_book.jsp");
            }
            else
            {
                HttpSession session = request.getSession();
                session.setAttribute("message","Server Error try again..!!");
                response.sendRedirect("sell_book.jsp");
            }
            } catch (Exception e) {
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
