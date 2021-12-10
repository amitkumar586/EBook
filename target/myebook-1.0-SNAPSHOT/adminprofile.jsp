<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUsertype().equals("normal")) {
            session.setAttribute("message", "You are not admin !! Do not access ");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%@page import="com.learn.myebook.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Profile</title>
        <%@include file="components/common_css_js.jsp"%>

    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container">
            <div class="row">

                <div class="col-md-4 mt-2">
                    <a href="addbook.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-plus-square fa-3x text-danger"></i><br>
                                <h4>Add Book</h4>
                                ............................
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-2">
                    <a href="allbooks.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book-open fa-3x text-primary"></i><br>
                                <h4>All Books</h4>
                                .............................. 
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-2">
                    <a href="address.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
                                <h4>Order</h4>
                                ............................... 
                            </div>
                        </div>
                    </a> 
                </div>

            </div>
        </div>

    </body>
</html>
