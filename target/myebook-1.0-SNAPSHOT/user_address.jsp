
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Address</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        
        <div class="container">
            <div class="row p-3">
                <div class="col-md-6 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                         
                            <form action="" >
                                <h3 class="text-center text-success">Add Address</h3>
                                    
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Address</label>
                                        <input type="text" class="form-control" id="inputEmail4" placeholder="Name"  readonly="readonly">
                                    </div>
                                    
                                     <div class="form-group col-md-6">
                                        <label for="inputEmail4">Landmark</label>
                                        <input type="text" class="form-control" id="inputEmail4" placeholder="Landmark"  readonly="readonly">
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">City</label>
                                        <input type="text" class="form-control" id="inputEmail4" placeholder="city"  readonly="readonly">
                                    </div>
                                    
                                    <div class="form-group col-md-3">
                                        <label for="inputEmail4">State</label>
                                        <input type="text" class="form-control" id="inputEmail4" placeholder="state"  readonly="readonly">
                                    </div>
                                    
                                    <div class="form-group col-md-3">
                                        <label for="inputEmail4">Zip</label>
                                        <input type="text" class="form-control" id="inputEmail4" placeholder="zip"  readonly="readonly">
                                    </div>
                                  
                                </div>
                                    
                                 <div class="text-center">
                                        <button class="btn btn-warning">Add Address</button>
                                    </div> 
                                
                            </form>
                        
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
