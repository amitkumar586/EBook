
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    User user = (User) session.getAttribute("currentUser");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sell book</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="components/navbar.jsp"%>

        <div class="container ">
            <%@include file="components/message.jsp"%>
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center text-primary p-2">Sell Old Book</h5>
                            <form action="AddOldBook" method="post" enctype="multipart/form-data"> 
                                <input type="hidden" value="<%=user.getEmail()%>" name="user">
                                <div class="mb-3 form-group">
                                    <label for="bookname" class="form-label">Book Name</label>
                                    <input name="bookname" type="text" class="form-control" id="bookname" required="required">
                                </div>
                                <div class="mb-3 form-group">
                                    <label for="authorname" class="form-label">Author Name</label>
                                    <input name="authorname" type="text" class="form-control" id="authorname" required="required">
                                </div>
                                <div class="mb-3 form-group">
                                    <label for="price" class="form-label">Price</label>
                                    <input name="price" type="number" class="form-control" id="price" required="required">
                                </div>

                                <div class="form-group">
                                    <label for="fileupload" >Upload File</label>
                                    <input name="fileupload" type="file" class="form-control-file" id="fileupload" required="required">

                                </div>

                                <div class="form text-center">
                                    <button type="submit" class="btn btn-primary ">Sell</button><br>
                                </div>
                            </form>

                        </div>
                    </div>

                </div>  

            </div>
        </div>

    </body>
</html>
