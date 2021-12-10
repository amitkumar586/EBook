<%@page import="com.learn.myebook.daoimpl.BookDaoImpl"%>
<%@page import="com.learn.myebook.entities.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myebook.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
            User u = (User)session.getAttribute("currentUser");
        %>

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
            <div class="row p-3">
            
                
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
        </div>
    </body>
</html>