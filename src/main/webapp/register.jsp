
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Book Register</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="components/navbar.jsp"%>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-4 offset-md-4">

                    <div class="card">

                        <%@include file="components/message.jsp"%>

                        <div class="card-body">


                            <h3 class="text-center">Registration</h3>

                            <form action="RegisterServlet" method="post">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Enter Name</label>
                                    <input name="uname" type="text" class="form-control" id="name" required="required">
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="form-label">Email address</label>
                                    <input name ="uemail" type="email" class="form-control" id="email" aria-describedby="emailHelp" required="required">

                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Enter Phone</label>
                                    <input name="uphone" type="number" class="form-control" id="phone" required="required">  
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Enter Password</label>
                                    <input name="upassword" type="password" class="form-control" id="password" required="required">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="address" class="form-label">Enter Your Address</label>
                                    <input name="uaddress" type="password" class="form-control" id="address" required="required">
                                </div>

                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms & Condition </label>
                                </div >
                                
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary ">Submit</button><br>
                                    <a href="login.jsp">If Already Account Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
