<%-- 
    Document   : Register
    Created on : May 2, 2023, 1:28:11 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <%@include file="components/common.jsp"%>
    </head>
    <body style="background: skyblue;" >
        <%@include file="navbar.jsp"%>
        <div class="container-fluid">
             <div class="row mt-5" >
            <div class="col-md-4 offset-md-4">
                <div class="card bg-light" >
                    
                     <%@include file="components/message.jsp"%>
                    <div class="card-body px-5 ">
                        <div class="container text-center">
                            <img src="img/add-user.png" style="max-width:100px;" class="img-fluid ml-auto"  alt="alt"/>
                            
                        </div>
                       
                        <h3 class="text-center my-3" style="color: #2196F3; "> Sign Up!!</h3>
                        <form action="Register" method="post" style="color: black;">
                    <div class="mb-3">
    <label for="name" class="form-label">User Name</label>
    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter your name here" aria-describedby="emailHelp">
    </div> 
                    <div class="mb-3">
    <label for="email" class="form-label">User Email</label>
    <input name="user_email" type="email" class="form-control" id="email" placeholder="Enter your Email here" aria-describedby="emailHelp">
    </div> 
                    <div class="mb-3">
    <label for="password" class="form-label">User Password</label>
    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter your Passwword here" aria-describedby="emailHelp">
    </div> 
                    <div class="mb-3">
    <label for="phone" class="form-label">User Phone</label>
    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter your phone where" aria-describedby="emailHelp">
    </div> 
                    
                    <div class="mb-3">
    <label for="phone" class="form-label">User Address</label>
    <textarea name="user_address" style="height: 200px;" class="form-control" placeholder="Enter your Address here">      
    </textarea>
   
    </div> 
                            
                            
                    
                    <div class="container text-center">
                    <button type="submit" class="btn btn-outline-success">Register</button>                   
                    <a href="Login.jsp" <button class="btn btn-outline-warning">Login</button></a>                   
                    </div>
                </form>
           
                        
                    </div>
                </div>     
            </div>
            
        </div>
            
            
        </div>
    </body>
</html>
