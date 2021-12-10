
<%@page import="com.learn.myebook.entities.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myebook.daoimpl.BookOrderDaoImpl"%>
<%@page import="com.learn.myebook.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <%@include file="components/common_css_js.jsp"%>

    </head>
    <body> 
        <%@include file="components/navbar.jsp"%>
        <%@include file="components/message.jsp"%>
        <%
        
        User user = (User) session.getAttribute("currentUser");
        if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
        }
        %>
       
        
        <div class="container p-1">
          <h3 class="text-center text-primary">Your Order</h3>
          <table class="table table-striped mt-3">
              <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
      
      <%
        User user4 = (User)session.getAttribute("currentUser");
        BookOrderDaoImpl bdao1 = new BookOrderDaoImpl(ConnectionProvider.getConnetaion());
        List<BookOrder> blist = bdao1.getbook(user4.getEmail());
        for(BookOrder b: blist)
        {
           %>
           
           <tr>
               <th scope="row"><%=b.getOrder_id()%></th>
               <td><%=b.getUser_name() %></td>
               <td><%=b.getBook_name() %></td>
               <td><%=b.getAuthor() %></td>
               <td><%=b.getPrice() %></td>
               <td><%=b.getPayment() %></td>
           </tr>

           <%
        }
      %>
      
    
   
  </tbody>
</table>  
        </div>
       
    </body>
</html>
