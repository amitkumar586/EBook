
<%@page import="com.learn.myebook.entities.BookDetails"%>
<%@page import="com.learn.myebook.daoimpl.BookDaoImpl"%>
<%@page import="com.learn.myebook.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Books</title>
        <%@include file="components/common_css_js.jsp"%> 
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="components/navbar.jsp"%>

        <%  int bookid = Integer.parseInt(request.getParameter("bookid"));
            BookDaoImpl dao = new BookDaoImpl(ConnectionProvider.getConnetaion());
            BookDetails b = dao.getBookById(bookid);

        %>

        <div class="container p-3">
            <div class="row">

                <div class="col-md-6 text-center p-5 border  bg-white">
                    <img src="img/<%=b.getPhoto()%>" style="height:185px; width:130px"><br>
                    <h4 class="mt-3"> Book Name: <span class="text-success"> <%=b.getBook_name()%> </span></h4>
                    <h4> Author Name: <span class="text-success"> <%=b.getAuthor_name()%></span> </h4>
                    <h4> Category: <span class="text-success"><%=b.getBookcategory()%></span></h4>
                </div>

                <div class="col-md-6 text-center p-5 border bg-white ">
                    <h2><%=b.getBook_name()%></h2>  

                    <%
                        if ("old".equals(b.getBookcategory())) {
                    %>
                    <h5 class="text-primary">Contact To Seller</h5>
                    <h5 class="text-primary"><i class="fas fa-envelope-square"></i>Email: <%=b.getUseremail()%></h5>
                    <%
                        }
                    %>

                    <div class="row mt-2">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-undo-alt fa-2x"></i>
                            <p>Return Available </p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-truck-moving fa-2x"></i>
                            <p>Free Delivery</p>
                        </div>

                        <%
                            if ("old".equals(b.getBookcategory())) {
                        %>

                        <div class="text-center p-3">
                            <a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>Continue Shopping</a>
                            <a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>     
                        </div>
                        <%
                        }
                        else 
                        {
                        %>

                        <div class="text-center p-3">
                            
                            <%
                                User u = (User)session.getAttribute("currentUser");
                                
                                if(u== null)
                                {
                                    %>
                                        <a href="login.jsp" class="btn btn-primary"><i class="fas fa-cart-plus"></i>Add Cart</a>
                                    <%
                                }
                                else
                                {
                                    %>
                                 
                                    <a href="CartServlet?bookid=<%=b.getBookid() %>&&userid=<%=u.getUid()%>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-arrow-down"></i>Add Cart </a>
                                   
                                    <%   
                                }
                            %>
                            
                            <a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>     
                        </div>

                        <%                              
                            }
                        %>

                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
