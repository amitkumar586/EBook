<%@page import="com.learn.myebook.daoimpl.BookDaoImpl"%>
<%@page import="com.learn.myebook.entities.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myebook.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Books</title>
        <%@include file="components/common_css_js.jsp"%>
        <style type="text/css">
            .crd-ho:hover
            {
                background-color: #f5bca9;
            }
        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row p-2">

               <%  
                    BookDaoImpl dao3 = new BookDaoImpl(ConnectionProvider.getConnetaion());
                    List<BookDetails> list3 = dao3.getOldBooks();
                    for(BookDetails b3 : list3) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="img/<%=b3.getPhoto()%>" style="width:150px;height:200px" class="img-thumblin"> 
                            <p><%=b3.getBook_name()%></p>
                            <p><%=b3.getAuthor_name()%> </p>
                            <p><%=b3.getBookcategory()%></p>
                            <div class="row">
                                <a href="viewbook.jsp?bookid=<%=b3.getBookid() %>" class="btn btn-success btn-sm ml-5">View Details </a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b3.getPrice()%></a>
                            </div>
                        </div>
                    </div>  
                </div>

                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>