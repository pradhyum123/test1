<%-- 
    Document   : Login
    Created on : May 4, 2023, 7:50:33 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User LOgin</title>
         <%@include file="components/common.jsp"%>
    </head>
    <body style="background-color: skyblue;">
         <%@include file="navbar.jsp"%>
        <div class="container">
            <div class="row">
                
                <div class="col-md-6 offset-md-3">
                    <div class ="card mt-4">
                        <%@include file="components/message.jsp" %>
                        
                        <div class="card-header" style="background-color: purple;">
                             <img src="img/user.png" Style="max-width:100px;" class="img-fluid ml-auto"  alt="alt"/>
                      
                            <h3 style= "color: whitesmoke;" margin-bottom: 5px;margin-top: 5px;">Login Here!!!</h3>
                             </div>
                        <div class="card-body">
                            <form action="Login" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="email"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text"></div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
  </div>
                                
 <div class="container text-center">
  <button type="submit" class="btn btn-outline-primary ">Submit</button>
  <button type="reset" class="btn btn-outline-primary ">Reset</button>
 </div>
                                <div class="contain text-center mt-2">
                                <a href="Register.jsp">If You Are Not Registered Please Click Here.</a>
                                </div>
                            </form>
                        
                    </div>
                    
                        <div class="card-footer">
                            
                        </div>
                    
                </div>
            </div>
            
            
            
            
        </div>
        
        
        
        
    </body>
</html>
