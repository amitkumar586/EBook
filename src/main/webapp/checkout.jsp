
<%@page import="java.util.List"%>
<%@page import="com.learn.myebook.entities.Cart"%>
<%@page import="com.learn.myebook.daoimpl.CartDaoImpl"%>
<%@page import="com.learn.myebook.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cart page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>

    <body style="background-color: #f0f1f2">
        <%@include file="components/navbar.jsp"%>
        <%@include file="components/message.jsp"%>
        <%       
            User user = (User) session.getAttribute("currentUser");
            if (user == null)
            {
                session.setAttribute("message", "You are not logged in !! Login first");
                response.sendRedirect("login.jsp");
                return;
            }
        %>
           <div class="container">
            <div class="row p-2">

                <div class="col-md-6">
                    <div class="card bg-white">
                        <div class="card-body">

                            <h3 class="text-center text-success">Your Selected Item</h3>
                            <!--table-->
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Book Name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price </th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                          
                                    <% 
                                        CartDaoImpl dao = new CartDaoImpl(ConnectionProvider.getConnetaion());
                                        List<Cart> cart = dao.getBookByUser(user.getUid());
                                        int totalprice = 0; 
                                        for(Cart c : cart)
                                        {
                                          totalprice= c.getTotal_price();
                                        %>
                                    <tr>
                                        <th scope="row"><%=c.getBook_name()%></th>
                                        <td><%=c.getAuthor()%></td>
                                        <td> <%=c.getPrice()%> </td>
                                        <td>
                                            <a href="RemoveBook?bookid=<%=c.getBookid() %>&&userid=<%=c.getUserid()%>&&cartid=<%=c.getCartid()%> " class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                    </tr>
                                        <%
                                        }
                                        %>
                                    <tr>
                                        <td> Total Price </td>
                                        <td></td>
                                        <td></td>
                                        <td> <%=totalprice %> </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">

                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details for Order</h3>

                            <form action="OrderServlet" method="post">
                                <input name="uid" type="hidden" value="<%=user.getUid()%>" >
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name</label>
                                        <input name="username" type="text" class="form-control" id="inputEmail4" placeholder="Name" value="<%=user.getName() %>" readonly="readonly" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Email</label>
                                        <input name="useremail" type="email" class="form-control" id="inputPassword4" placeholder="Email" value="<%=user.getEmail()%>" readonly="readonly" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Phone No</label>
                                        <input name="userphone" type="number" class="form-control" id="inputEmail4" placeholder="Mobile No" value="<%=user.getPhone() %>" readonly="readonly" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input name="address" type="text" class="form-control" id="inputPassword4" placeholder="Address" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Landmark</label>
                                        <input name="landmark" type="text" class="form-control" id="inputEmail4" placeholder="Landmark" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">City</label>
                                        <input name="city" type="text" class="form-control" id="inputPassword4" placeholder="City" required>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">State</label>
                                        <input name="state" type="text" class="form-control" id="inputEmail4" placeholder="State" required>
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Zip</label>
                                        <input name="zip" type="text" class="form-control" id="inputPassword4" placeholder="Zip" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Payment Mode</label>
                                    <select name="payment" class="form-control" required>
                                        <option>--Select--</option>
                                        <option>Cash On Delivery</option>
                                    </select>
                                </div>

                                <div class="text-center">
                                    <button class="btn btn-warning">Order Now</button>
                                    <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                                </div>

                            </form>

                        </div>

                    </div>
                </div>

            </div>
        </div>

    </body>
</html>
