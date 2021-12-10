package com.learn.myebook.servlet;

import com.learn.myebook.daoimpl.BookDaoImpl;
import com.learn.myebook.entities.BookDetails;
import com.learn.myebook.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditBooksServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                int bookid = Integer.parseInt(request.getParameter("bookid"));
                String bookname = request.getParameter("bookname");
                String authorName = request.getParameter("authorname");
                String price = request.getParameter("price");
                String bookStatus = request.getParameter("bookstatus");

                BookDetails b = new BookDetails();
                b.setBookid(bookid);
                b.setBook_name(bookname);
                b.setAuthor_name(authorName);
                b.setPrice(price);
                b.setStatus(bookStatus);

                BookDaoImpl dao = new BookDaoImpl(ConnectionProvider.getConnetaion());
                boolean f = dao.updateEditBook(b);

                if (f) {
                    
               
                      HttpSession session = request.getSession();
                      session.setAttribute("message", "Boook Updated SuccessFully...!!");
                      response.sendRedirect("allbooks.jsp");
                } else {
                      HttpSession session = request.getSession();
                      session.setAttribute("message", "Something went wrong...!!");
                      response.sendRedirect("allbooks.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
