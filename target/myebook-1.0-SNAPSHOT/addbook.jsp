<%@page import="com.learn.myebook.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Book</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body style="background-color: #f0f2f2;">
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card"> 
                        <%@include file="components/message.jsp"%>
                        <div class="card-body">
                            <h3 class="text-center">Add Books</h3>

                            <form action="BooksAdd" method="post" enctype="multipart/form-data"> 

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

                                <div class=" form-group mb-3 ">
                                    <label for="inputstate" >Book Categories</label>
                                    <select id="bookcategory" name="bookcategory" class="form-control">
                                        <option selected>--Select--</option>
                                        <option value ="New">New Book</option>
                                    </select>
                                </div>
                                <div class=" form-group mb-3 ">
                                    <label for="inputstate" >Book Status</label>
                                    <select id="bookstatus" name="bookstatus" class="form-control">
                                        <option selected>--Select--</option>
                                        <option value ="Active"> Active</option>
                                        <option value ="Inactive"> Inactive</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="fileupload" >Upload File</label>
                                    <input name="fileupload" type="file" class="form-control-file" id="fileupload" required="required">

                                </div>

                                <div class="form text-center">
                                    <button type="submit" class="btn btn-primary ">Add</button><br>
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
