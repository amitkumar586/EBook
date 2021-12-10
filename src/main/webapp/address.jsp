
<%@page import="com.learn.myebook.entities.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myebook.daoimpl.BookOrderDaoImpl"%>
<%@page import="com.learn.myebook.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Orders</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>

    <body>
        <%@include file="components/navbar.jsp"%>    
        <h1>All Books</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email </th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>
            </thead>

            <%         
                BookOrderDaoImpl dao = new BookOrderDaoImpl(ConnectionProvider.getConnetaion());
                List<BookOrder> border = dao.getAllOrder();
                for (BookOrder b : border) {
            %>

            <tbody>
                <tr>
                    <th scope="row"><%=b.getOrder_id()%></th>
                    <td><%=b.getUser_name()%></td>
                    <td><%=b.getEmail()%></td>
                    <td><%=b.getAddress()%></td>
                    <td><%=b.getPhone()%></td>
                    <td><%=b.getBook_name()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getPayment()%></td>
                </tr>
            </tbody>
            <%
                }
            %>
        </table>
    </body>
</html>
