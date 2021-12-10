
<%@page import="com.learn.myebook.entities.BookDetails"%>
<%@page import="com.learn.myebook.helper.ConnectionProvider"%>
<%@page import="com.learn.myebook.daoimpl.BookDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Books</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">

                    <div class="card"> 
                        
                        <div class="card-body">
                            <h3 class="text-center">Edit Books</h3>

                            <%  
                                int bookid = Integer.parseInt(request.getParameter("bookid"));
                                BookDaoImpl dao = new BookDaoImpl(ConnectionProvider.getConnetaion());
                                BookDetails b = dao.getBookById(bookid);
                            %>

                            <form action="EditBooksServlet" method="post"> 

                                <input type="hidden" name="bookid" class="form-control" id="bookid" value="<%=b.getBookid()%>">

                                <div class="mb-3 form-group">
                                    <label for="bookname" class="form-label">Book Name</label>
                                    <input name="bookname" type="text" class="form-control" id="bookname" value="<%=b.getBook_name()%>">
                                </div>
                                <div class="mb-3 form-group">
                                    <label for="authorname" class="form-label">Author Name</label>
                                    <input name="authorname" type="text" class="form-control" id="authorname" value="<%=b.getAuthor_name()%>">
                                </div>
                                <div class="mb-3 form-group">
                                    <label for="price" class="form-label">Price</label>
                                    <input name="price" type="number" class="form-control" id="price" value="<%=b.getPrice()%>">
                                </div>
                                <div class=" form-group mb-3 ">
                                    <label for="inputstate" >Book Status</label>
                                    <select id="bookstatus" name="bookstatus" class="form-control">

                                        <%
                                            if ("Active".equals(b.getStatus())) {
                                        %>
                                        <option value ="Active"> Active</option>
                                        <option value ="Inactive"> Inactive</option>

                                        <%
                                        } else {
                                        %>
                                        <option value ="Inactive"> Inactive</option>
                                        <option value ="Active"> Active</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="form text-center">
                                    <button type="submit" class="btn btn-primary ">Update</button><br>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
