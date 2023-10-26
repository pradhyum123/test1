<% 


    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!!Please Login first to access Checkout page");
        response.sendRedirect("Login.jsp");
        return;
    }
   
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3">Your Selected Items</h3>
                            <div class="cart-body">
                        
                    </div>
                    
                            
                        </div>
                    </div>
                    
                </div>
                <div class="col-md-6">
                    
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3">Your details for order</h3>
                            <<form action="#!">
                                
                                 <div class="from-group mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
                                 <div class="from-group mb-3">
    <label for="name" class="form-label">Enter your name</label>
    <input value="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp">
    
  </div>
                                 <div class="from-group my-3">
    <label for="exampleFormControlTextarea1"> Your Shipping address</label>
    <textarea value="<%=user.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your address" ></textarea>
    
    
  </div>
                                <div class="container text-center">
                                    <button class="btn-outline-success">Order Now</button>
                                    <button class="btn-outline-primary">Continue  Shopping</button>
                                </div>
                                
                            </form>
                    
                            
                        </div>
                    </div>
                    
                    
                </div>
            </div>  
            
            
            
        </div>
        <%@include file="components/commonmodal.jsp" %>
    </body>
</html>
