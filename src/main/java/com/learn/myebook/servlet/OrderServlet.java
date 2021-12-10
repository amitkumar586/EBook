package com.learn.myebook.servlet;

import com.learn.myebook.daoimpl.BookOrderDaoImpl;
import com.learn.myebook.daoimpl.CartDaoImpl;
import com.learn.myebook.entities.BookOrder;
import com.learn.myebook.entities.Cart;
import com.learn.myebook.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                HttpSession session = request.getSession();
                String name = request.getParameter("username");
                String email = request.getParameter("useremail");
                String phone = request.getParameter("userphone");
                String address = request.getParameter("address");
                String landmark = request.getParameter("landmark");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String pincode = request.getParameter("zip");
                String paymentType = request.getParameter("payment");

                int uid = Integer.parseInt(request.getParameter("uid"));

                String fulladdress = address + " ," + landmark + " , " + city + "," + state + "," + pincode;

                CartDaoImpl dao = new CartDaoImpl(ConnectionProvider.getConnetaion());

                List<Cart> booklist = dao.getBookByUser(uid);

                if (booklist.isEmpty()) {
                    session.setAttribute("message", "Please Add Items");
                    response.sendRedirect("checkout.jsp");
                } else {

                    BookOrderDaoImpl dao1 = new BookOrderDaoImpl(ConnectionProvider.getConnetaion());

                    BookOrder bookOrder = null;

                    ArrayList<BookOrder> orderlist = new ArrayList<BookOrder>();

                    Random r = new Random();
                    for (Cart c : booklist) {
                        bookOrder = new BookOrder();
                        bookOrder.setOrder_id("BOOK-ORD-00" + r.nextInt(1000));
                        bookOrder.setUser_name(name);
                        bookOrder.setEmail(email);
                        bookOrder.setAddress(fulladdress);
                        bookOrder.setPhone(phone);
                        bookOrder.setBook_name(c.getBook_name());
                        bookOrder.setAuthor(c.getAuthor());
                        bookOrder.setPrice(c.getPrice() + "");
                        bookOrder.setPayment(paymentType);
                        orderlist.add(bookOrder);
                    }

                    if ("noselect".equals(paymentType)) {
                        session.setAttribute("message", "Please Choose Payment Method");
                        response.sendRedirect("checkout.jsp");
                    } else {
                        boolean f = dao1.saveOrder(orderlist);

                        if (f) {
                            session.setAttribute("message", "Success");
                            response.sendRedirect("order_success.jsp");
                        } else {
                            session.setAttribute("message", "Please Choose Payment Method");
                            response.sendRedirect("order_success.jsp");
                        }
                    }
                }
            }
            catch (Exception e) {
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
