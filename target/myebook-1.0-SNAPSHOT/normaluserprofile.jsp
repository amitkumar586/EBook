<%@page import="com.learn.myebook.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUsertype().equals("admin")) {
            session.setAttribute("message", "Do not access !!");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Profile</title>
        <%@include file="components/common_css_js.jsp"%>

    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <%=user.getName()%>
        <br>
        <%=user.getEmail()%>
        <br>
        <%=user.getPhone()%>
        <br>
        <%=user.getPassword()%>
    </body>
</html>
