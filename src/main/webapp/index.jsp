<%@page import="com.learn.myebook.entities.BookDetails"%>
<%@page import="com.learn.myebook.daoimpl.BookDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myebook.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="components/common_css_js.jsp"%> 
        <style type="text/css">
            .back-img
            {
                background: url("img/book.jpg");
                height: 40vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }
            
            .crd-ho:hover
            {
                background-color: #f5bca9;
            }
        </style>

    </head>
    <body style="background-color:#c9c6c5;">
        
        <%
            User u = (User)session.getAttribute("currentUser");
        %>

        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid back-img">
            <h2 class="text-center text-primary">E-Book Management System</h2>
        </div>

        <!--start recent book-->

        <div class="container">

            <h3 class="text-center">Recent Book</h3>

            <div class="row">

                <%  
                    BookDaoImpl dao1 = new BookDaoImpl(ConnectionProvider.getConnetaion());
                    List<BookDetails> list1 = dao1.getRecentBook();
                    for (BookDetails b1 : list1) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="img/<%=b1.getPhoto()%>" style="width:150px;height:200px" class="img-thumblin"> 
                            <p><%=b1.getBook_name()%></p>
                            <p><%=b1.getAuthor_name()%> </p>
                            <p> 

                                <%
                                    if (b1.getBookcategory().equals("old")) {
                                %>
                                Categories:<%=b1.getBookcategory()%></p>
                            <div class="row text-center">
                                <a href="viewbook.jsp?bookid=<%=b1.getBookid() %>" class="btn btn-success btn-sm ml-5">View Details </a>
                                <a href="" class="btn btn-danger btn-sm ml-0"><%=b1.getPrice()%></a>
                            </div>
                            <%

                            } else {

                            %>
                            Categories:<%=b1.getBookcategory()%></p>
                            <div class="row text-center">
                                
                              <%
                                  if(u == null)
                                  {
                                      %>
                                      
                                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-arrow-down"></i>Add Cart </a>
                                      
                                      <%
                                  }
                                  else
                                  {
                                    %>
                                    <a href="CartServlet?bookid=<%=b1.getBookid() %>&&userid=<%=u.getUid()%>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-arrow-down"></i>Add Cart </a>
                                    <%
                                    }
                                  
                                  %>  
                                
                                
                                <a href="viewbook.jsp?bookid=<%=b1.getBookid() %>" class="btn btn-success btn-sm ml-1">View Details </a>
                                <a href="" class="btn btn-danger btn-sm ml-0"><%=b1.getPrice()%></a>
                            </div>

                            <%
                             }
                            %>
                        </div>
                    </div>  
                </div>

                <%
                    }
                %>
            </div>
            <div class="container text-center mb-2 mt-2">
                <a href="showrecentbook.jsp" class="btn btn-primary "> View All</a> 
            </div>
        </div>
        <hr>
        <!--end recent book-->
        
        <!--start New book-->
        
        <div class="container">

            <h3 class="text-center">New Book</h3>

            <div class="row">
                
                <%
                    BookDaoImpl dao2 = new BookDaoImpl(ConnectionProvider.getConnetaion());
                    List<BookDetails> list2 = dao2.getNewBook();
                    for (BookDetails b2 : list2)
                    {
                %>

                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img alt="" src="img/<%=b2.getPhoto()%>" style="width:150px;height:200px" class="img-thumblin"> 
                            <p> <%=b2.getBook_name()%></p>
                            <p><%=b2.getAuthor_name()%></p>
                            <p><%=b2.getBookcategory()%></p>
                            <div class="row">
                                
                                <% 
                                    if(u==null)
                                    {
                                        %>
                                         <a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-arrow-down"></i>Add Cart </a>
                                        <%
                                    }
                                    else
                                    {
                                    %>
                                    <a href="CartServlet?bookid=<%=b2.getBookid() %>&&userid=<%=u.getUid()%>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-arrow-down"></i>Add Cart </a>
                                    <%
                                     }
                                    %>
                                <a href="viewbook.jsp?bookid=<%=b2.getBookid() %>" class="btn btn-success btn-sm ml-1">View Details </a>
                                <a href="" class="btn btn-danger btn-sm ml-0"><%=b2.getPrice()%></a>
                            </div>
                        </div>  
                    </div>  
                </div>
                <%
                    }
                %>


            </div>
            <div class="container text-center mb-2 mt-2">
                <a href="shownewbook.jsp" class="btn btn-primary "> View All</a> 
            </div>
        </div>
        <hr>
        
        <!--end New book-->

        <!--start old book-->
        
        <div class="container">

            <h3 class="text-center">Old Book</h3>

            <div class="row">

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
            <div class="container text-center mb-2 mt-2">
                <a href="showoldbook.jsp" class="btn btn-primary "> View All</a> 
            </div>
        </div>
                
        <!--end old book-->

    </body>
</html>
 