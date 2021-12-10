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
            <div class="row p-3">
                <%   
                    User user =(User)session.getAttribute("currentUser");
                    String ch =request.getParameter("ch");
                    BookDaoImpl dao2 = new BookDaoImpl(ConnectionProvider.getConnetaion());
                    List<BookDetails> list2 = dao2.getBookBySearch(ch);
                    for (BookDetails b2 : list2) {
                %>
                <div class="col-md-3 text-center">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">
                            <img alt="" src="img/<%=b2.getPhoto()%>" style="width:130px;height:170px" class="img-thumblin"> 
                            <p> <%=b2.getBook_name()%></p>
                            <p><%=b2.getAuthor_name()%></p>
                            <p><%=b2.getBookcategory()%></p>
                            <div class="row">
                                
                                  <%
                                  if(user == null)
                                  {
                                      %>
                                      
                                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-arrow-down"></i>Add Cart </a>
                                      
                                      <%
                                  }
                                  else
                                  {
                                    %>
                                    <a href="CartServlet?bookid=<%=b2.getBookid() %>&&userid=<%=user.getUid()%>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-arrow-down"></i>Add Cart </a>
                                    <%
                                    }
                                    %>
                                
                                <a href="viewbook.jsp" class="btn btn-success btn-sm ml-1">View Details </a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b2.getPrice()%></a>
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