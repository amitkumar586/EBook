
<%@page import="com.learn.myebook.entities.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myebook.helper.ConnectionProvider"%>
<%@page import="com.learn.myebook.daoimpl.BookDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Books</title>

        <%@include file="components/common_css_js.jsp"%>
        <%@include file="components/message.jsp"%>
    </head>

    <body>
        <%@include file="components/navbar.jsp"%>    
        <h1>All Books</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Book Id</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author </th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>

                <%                    BookDaoImpl dao = new BookDaoImpl(ConnectionProvider.getConnetaion());
                    List<BookDetails> booklist = dao.getAllBooks();
                    for (BookDetails b : booklist) {
                %>

                <tr>

                    <td> <%=b.getBookid()%> </td>
                    <td><img src="img/<%=b.getPhoto()%>" style="width: 55px; height: 70px"/></td>
                    <td><%=b.getBook_name()%></td>
                    <td><%=b.getAuthor_name()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getBookcategory()%></td>
                    <td><%=b.getStatus()%></td>
                    <td><a href="editbooks.jsp?bookid=<%=b.getBookid()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a>
                        <a href="BookDeleteServlet?bookid=<%=b.getBookid()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>

            </tbody>
        </table>
    </body>
</html>
