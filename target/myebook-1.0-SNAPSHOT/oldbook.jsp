
<%@page import="com.learn.myebook.entities.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myebook.helper.ConnectionProvider"%>
<%@page import="com.learn.myebook.daoimpl.BookDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>old book</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <%@include file="components/message.jsp"%>
        <div class="container p-5">
            
            <table class="table table-striped">
                <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  
<tbody>
    
    <%
        User user = (User) session.getAttribute("currentUser");
        String useremail = user.getEmail();
        BookDaoImpl dao = new BookDaoImpl(ConnectionProvider.getConnetaion());
        List<BookDetails> list1 = dao.getBookByOld(useremail, "old");
        
        for(BookDetails b:list1)
        {
            %>
              <tr>
              <td><%=b.getBook_name() %></td>
              <td><%=b.getAuthor_name() %></td>
              <td><%=b.getPrice() %></td>
              <td><%=b.getBookcategory() %></td>
              <td><a href="DeleteOldBook?useremail=<%=useremail%>&&bookid=<%=b.getBookid()%>" class="btn btn-sm btn-danger">Delete</a></td>
              </tr>
    
            <%
        }
    %>
</tbody>

</table>
        </div>
        
    </body>
</html>
