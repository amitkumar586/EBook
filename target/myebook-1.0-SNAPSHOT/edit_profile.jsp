<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    
    User user3 = (User)session.getAttribute("currentUser");
                
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit profile</title>
        <%@include file="components/common_css_js.jsp"%>

    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="components/navbar.jsp"%>
        
        <div class="container">

            <div class="row">
            
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">

                            <h5 class="text-center text-primary p-2">Edit Profile</h5>
                            <%@include file="components/message.jsp"%>
                            <form action="UpdateProfileServlet" method="post"> 
                                <input name="userid" type="hidden" value="<%=user3.getUid()%>">
                                <div class="mb-3 form-group">
                                    <label for="bookname" class="form-label">Name</label>
                                    <input name="username" type="text" class="form-control" id="bookname" value="<%=user3.getName()%>" >
                                </div>
                                <div class="mb-3 form-group">
                                    <label for="authorname" class="form-label">Email </label>
                                    <input name="useremail" type="email" class="form-control" id="email" value="<%=user3.getEmail()%>" >
                                </div>
                                <div class="mb-3 form-group">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input name="userphone" type="number" class="form-control" id="phone" value="<%=user3.getPhone()%>" >
                                </div>

                                <div class="mb-3 form-group">
                                    <label for="password" class="form-label">Password</label>
                                    <input name="userpassword" type="password" class="form-control" id="password" required="required">
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
