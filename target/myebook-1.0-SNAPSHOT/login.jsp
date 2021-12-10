
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Book Login</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="components/navbar.jsp"%>
        
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">

                    <div class="card">
                        
                        <%@include file="components/message.jsp"%>
                        
                        <div class="card-body">
                            <h3 class="text-center">Login</h3>

                            <form action="LoginServlet" method="post">

                                <div class="mb-3">
                                    <label for="email" class="form-label">Email address</label>
                                    <input name ="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" required="required">

                                </div>

                                <div class="mb-3 text-center">
                                    <label for="password" class="form-label">Enter Password</label>
                                    <input name="password" type="password" class="form-control" id="password" required="required">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary ">Submit</button><br>
                                    <a href="register.jsp">Create Account</a>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
