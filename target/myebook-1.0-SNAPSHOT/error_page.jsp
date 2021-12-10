
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error page</title>
        <%@include file="components/common_css_js.jsp" %> 
    </head>
    <body>
        <div class="container-fluid text-center">
            
            <img src ="img/warning.png" class="img-fluid">
            <h3>Sorry Something went wrong......</h3>
            <%= exception%>
            <a href="index.jsp" class="btn bg-custom btn-lg text-white mt-3"> Home</a>
        </div>
        
        
    </body>
</html>
