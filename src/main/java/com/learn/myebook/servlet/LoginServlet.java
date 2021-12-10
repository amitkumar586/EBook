
package com.learn.myebook.servlet;

import com.learn.myebook.daoimpl.UserDaoImpl;
import com.learn.myebook.entities.User;
import com.learn.myebook.helper.ConnectionProvider;
import com.learn.myebook.message.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
            HttpSession session = request.getSession();
            
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");
            
            //validation
            
            
            UserDaoImpl udaoimpl = new UserDaoImpl(ConnectionProvider.getConnetaion());
           
            User user  = udaoimpl.getUserByEmailAndPassowrd(userEmail, userPassword);
            
            System.out.println(user);
            
            if(user == null)
            {
              // login error  
             // out.println("Invalid details Please try again !!");
                
                session.setAttribute("message","Invalid details Please try with another...!!");
                response.sendRedirect("login.jsp");
                return;
                
            }
            else
            {
               //login
                session.setAttribute("currentUser",user);
                
                if(user.getUsertype().equals("admin"))
                {
                    //admin login
                    session.setAttribute("message","Welcome "+ user.getName());
                    response.sendRedirect("adminprofile.jsp");
                    return;
                }
                else if(user.getUsertype().equals("normal"))
                {
                     //normal user login
                    session.setAttribute("message","Welcome "+ user.getName());
                    response.sendRedirect("normaluserprofile.jsp");
                    return;
                }
                else
                {
                    session.setAttribute("message","we have not identified user...!!");
                    response.sendRedirect("login.jsp");
                    return;
                   
                }
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
