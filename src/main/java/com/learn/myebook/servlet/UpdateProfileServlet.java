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

public class UpdateProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                int userid = Integer.parseInt(request.getParameter("userid"));
                String name = request.getParameter("username");
                String email = request.getParameter("useremail");
                String phone = request.getParameter("userphone");
                String password = request.getParameter("userpassword");

                User us = new User();
                us.setUid(userid);
                us.setName(name);
                us.setEmail(email);
                us.setPhone(phone);

                UserDaoImpl dao = new UserDaoImpl(ConnectionProvider.getConnetaion());
                HttpSession session = request.getSession();
                boolean f = dao.checkpassword(userid, password);
                if (f) {
                    boolean f2 = dao.updateuserprofile(us);

                    if (f2) {
                        session.setAttribute("message", "User Successfully Updated");
                        response.sendRedirect("edit_profile.jsp");
                        return;
                    } else {
                        session.setAttribute("message", "Something went wrong");
                        response.sendRedirect("edit_profile.jsp");
                    }
                } else {
                    session.setAttribute("message", "Incorrect Password");
                    response.sendRedirect("edit_profile.jsp");
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
