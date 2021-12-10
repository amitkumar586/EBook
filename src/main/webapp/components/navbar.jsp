<%@page import="com.learn.myebook.entities.User"%>
<%
User user1 = (User) session.getAttribute("currentUser");
 %>            

<div class="container-fluid " style="height: 10px ; background-color: #303f9f;" ></div>

<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3">
            <h1>E-Book</h1>
        </div>  

        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
                <input name="ch" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>  
        </div>  

        <div class="col-md-3">

            <%  
              if (user1 == null) 
              {
             %>   

            <a href="login.jsp" class="btn btn-success">Login</a>
            <a href="register.jsp" class="btn btn-primary">Register</a>

            <%                
            }
            else
            {
              %> 
             <!--cart-->
            <a href="checkout.jsp" > <i class="fas fa-cart-plus fa-1x text-danger"></i> </a>

            <a class="container-fluid" href="#!" data-toggle="modal" data-target="#profile"><span> <%=user1.getName()%> </span></a>

            <a href="LogoutServlet" class="btn btn-primary">Logout</a>

            <!--start model-->

            <!-- Modal -->
            <div class="modal fade" id="profile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-custom text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Welcome To E-Book</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="container text-center">

                                <img src="img/pics/<%=user1.getUserpic()%>" class="img-fluid" style="border-radius:50%; max-height:80px ; max-width:100 ">
                                <br>

                                <h5 class="modal-title" id="exampleModalLabel"><%=user1.getName()%></h5>  

                                <!--details start--> 

                                <table class="table">
                                   
                                    <tbody>
                                        <tr>
                                            <th scope="row">Id :</th>
                                            <td><%= user1.getUid() %></td>
                                            
                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%=user1.getEmail() %></td>
                                           
                                        </tr>
                                        <tr>
                                            <th scope="row">Phone Number :</th>
                                            <td><%=user1.getPhone() %></td>
                                            
                                        </tr>

                                    </tbody>
                                </table>

                                <!--details end-->

                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Edit</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--end model-->

            <%

                }

            %>

        </div>

    </div>

</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#">E-Book</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link active" href="index.jsp"> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="showrecentbook.jsp"><i class="fa-solid fa-house-chimney"></i> Recent Book</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="shownewbook.jsp">New Book</a>
            </li>

            <li class="nav-item">
                <a class="nav-link active" href="showoldbook.jsp">Old Book</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
           
            <a href="setting.jsp" class="btn btn-light my-2 my-sm-0 " type="submit">Setting </a>
            <button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">Contact Us</button>
        </form>
    </div>
</nav>