<%@page import="com.coder.entites.User"%>
<%
     User user1=(User)session.getAttribute("current-user");
    %>



    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
    <div class="container">
       
    <a class="navbar-brand" href="index.jsp">MyCart</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Laptops</a></li>
            <li><a class="dropdown-item" href="#">Mobiles</a></li>
            <li><a class="dropdown-item" href="#">Clothes</a></li>
            <li><a class="dropdown-item" href="#">Electronic's</a></li>
            <li><hr class="dropdown-divider"></li>
        
          </ul>
        </li>
        
      </ul>
      
        <ul class="navbar-nav ml-auto">
            
            <li class="nav-item ">
                <a class="nav-link active" aria-current="page" href="#!" data-bs-toggle="modal" data-bs-target="#cart"><span class="fa fa-cart-plus text-primary cart-items" style="font-size: 25px;">(0) </span> </a>
        </li>
        
            <% 
            if(user1==null){
            
                    %>
                    
                    <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Login.jsp">Login</a>
        </li>
        
            <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Register.jsp">Register</a>
        </li>
        
                    
                    <%
                }else{
                %>
                
                <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<%= user1.getUserType().equals("admin")?"Admin.jsp":"normal.jsp"%>"><%= user1.getUserName()%></a>
        </li>
        
            <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Logout">Logout</a>
        </li>
        
                
                <%
                
                }
            %>
            
            
        </ul>
    </div>
  </div>
        
    </div>
</nav>