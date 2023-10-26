
<%@page import="com.coder.helper.FactoryProvider"%>
<%@page import="com.coder.helper.Helper"%>
<%@page import="com.coder.entites.Category"%>
<%@page import="com.coderdao.Categorydao"%>
<%@page import="java.util.List"%>
<%@page import="com.coder.entites.Product"%>
<%@page import="com.coderdao.ProductDao"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart</title>
        <%@include file="components/common.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="row mt-3 mx-2">

            <%                
                String str=request.getParameter("category");
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
              List<Product> list= null;
              
              
                if(str==null || str.trim().equals("all")){
                list=dao.getAllProduct();
                
                }else
                {
               int cid =Integer.parseInt(str.trim());
               list=dao.getAllProductId(cid);
                }
                
               
                

                Categorydao d = new Categorydao(FactoryProvider.getFactory());
                List<Category> cat = d.getCategories();
            
            
            %>

            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active bg-dark border-dark" aria-current="true">
                        All Products
                    </a>





                    <%
                        for (Category c : cat) {

                    %>
                    <a href="index.jsp?category<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

                    <%
                        }
                    %>

                </div>
            </div>



            <!--SHOW PRODUCt--!><!-- comment --> 
            <div class="col-md-10">


                <div class="row mt-4 ">

                    <div class="row row-cols-3 row-cols-md-4">




                        <%
                            for (Product p : list) {


                        %>


                        <div class="col">

                            <div class="card">
                                <img src="img/product/<%=p.getpPhoto()%>" style="max-height: 270px; max-width:100%;  width: auto; s" class="card-img-top m-2 " alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%=p.getpName()%></h5>
                                    <p class="card-text"><%=Helper.getby10words(p.getpDesc())%>  </div>
                            </div>

                            <div class="card-footer text-center">
                                <button  class="bg-dark text-white" onclick="add_tO_cart(<%=p.getpId()%>, '<%=p.getpName()%>',<%=p.getapplydiscount()%>)" >Add to Cart</button> 
                                <button  class="btn-success">&#8377; <%=p.getapplydiscount()%>/-  <span clas="text-secondary discount-label"> &#8377; <%=p.getpPrice()%> , <%=p.getpDiscount() %>%off</span></button> 

                            </div>


                        </div>












                        <%
                            if(list.size()==0){
                            out.println("<h1>No item found this Category</h1>");
                            }
                            }
                        %>
                    </div>


                </div>

            </div>

        </div>






                        <%@include file="components/commonmodal.jsp" %>
    </body>
</html>
