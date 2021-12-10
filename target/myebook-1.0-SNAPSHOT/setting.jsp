
<%@page import="com.learn.myebook.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>setting page</title>
        <%@include file="components/common_css_js.jsp"%>
        <style type="text/css">
            a{
                text-decoration: none;
                color:black;
            }

            a:hover{
                text-decoration: none;
            }
        </style>

    </head>
    <body style="background-color: #f7f7f7;">
        <%@include file="components/navbar.jsp"%>
        <div class="container ">

            <%          
                User user = (User) session.getAttribute("currentUser");
                if (user == null) {
                    session.setAttribute("message", "You are not logged in !! Login first");
                    response.sendRedirect("login.jsp");
                    return;
                } else {

            %>
            <h3 class="text-center">Welcome <%=user.getName()%></h3>
            <%
                }
            %>
            <div class="row p-5">
                <div class="col-md-4">
                    <a href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary"><i class="fas fa-book-open fa-3x"></i></div>
                                <h3>Sell Old Book</h3>
                            </div>
                        </div>
                    </a>
                </div>
                
                 <div class="col-md-4">
                    <a href="oldbook.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary"><i class="fas fa-book-open fa-3x"></i></div>
                                <h3>Old Book</h3>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary"><i class="fas fa-user-edit fa-3x "></i></div>
                                <h3>Login & Security(Edit Profile)</h3>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-3">
                    <a href="user_address.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-warning"><i class="fas fa-map-marker-alt fa-3x"></i></div>
                                <h3>Your Address</h3>
                                <p>Edit Your Address</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-3">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-danger"><i class="fas fa-box-open fa-3x"></i></div>
                                <h3>My Order</h3>
                                <p>Track Our Order</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-3">
                    <a href="helpline.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-phone fa-3x"></i></div>
                                <h3>Help Center</h3>
                                <p>24x7 Service</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

    </body>
</html>



