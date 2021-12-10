package com.learn.myebook.servlet;

import com.learn.myebook.daoimpl.UserDaoImpl;
import com.learn.myebook.entities.User;
import com.learn.myebook.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RegisterServlet extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
          HttpSession session = request.getSession();
             String check = request.getParameter("check");
             if(check == null)
             {
                 session.setAttribute("message" , "please check terms & condition");
                 response.sendRedirect("register.jsp");
                // out.println("please check terms & condition");  
             }
             else 
             {
                 String name = request.getParameter("uname");
                 String email = request.getParameter("uemail");
                 String phone = request.getParameter("uphone");
                 String password = request.getParameter("upassword");
                 String address = request.getParameter("uaddress");
                 
                 //create user obj
                 User user = new User(name, email, phone, password, address, "normal", "default.png");                            
                 
                //create user daoImpl obj
                UserDaoImpl udao = new UserDaoImpl(ConnectionProvider.getConnetaion());
                boolean f2 = udao.checkUser(email);
                
                if(f2)
                {
                    
                if(udao.saveUser(user))
                {
                    
                     
                     session.setAttribute("message", "data successfully loaded....");
                     response.sendRedirect("register.jsp");
                     
                     // out.println("data successfully loaded....");
                }
                else
                {
                    session.setAttribute("message" , "server error........");
                    response.sendRedirect("register.jsp");
                   // out.println("server error........ ");
                }
                    
                }
                
                else
                {
                    session.setAttribute("message" , "User Already Exist Try Anither email id");
                    response.sendRedirect("register.jsp");
                   
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