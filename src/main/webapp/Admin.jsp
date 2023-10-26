<%@page import="java.util.Map"%>
<%@page import="com.coder.helper.Helper"%>
<%@page import="com.coder.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.coder.entites.Category"%>
<%@page import="com.coderdao.Categorydao"%>

<%@page import="com.coder.entites.User"%>


 <%                  Categorydao cd = new Categorydao(FactoryProvider.getFactory());
                                List<Category> list = cd.getCategories();
                                

                               Map<String,Long>m= Helper.getcount(FactoryProvider.getFactory());
                               
                            %>




<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!!Please Login first");
        response.sendRedirect("Login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not Admin!!");
            response.sendRedirect("Login.jsp");
            return;
        }

    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common.jsp" %>
    </head>
    <body style="background-color: saddlebrown">
        <%@include file="navbar.jsp"%>
        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp"%>
            </div>



            <div class="row mt-4">

                <div class="col-md-4">
                    <div class="card" style="background-color: skyblue">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/team.png" alt="alt"/>

                            </div>
                            <h1><%=m.get("usercount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>

                        </div>


                    </div>
                </div>

                <div class="col-md-4">

                    <div class="card" style="background-color: skyblue">
                        <div class="card-body text-center">
                            <div class="container">

                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/list.png" alt="alt"/>
                            </div>
                            <h1><%=list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>

                        </div>


                    </div>



                </div>

                <div class="col-md-4">

                    <div class="card " style="background-color: skyblue; " >
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="alt"/>
                            </div>
                            <h1><%=m.get("productcount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>

                        </div>


                    </div>



                </div>




            </div>



            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card" style="background-color: skyblue;" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/keys.png" alt="alt"/>
                            </div>
                            <p class="mt-2" >Click here to a add a new categories</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>

                        </div>


                    </div>

                </div>


                <div class="col-md-6">


                    <div class="card" style="background-color: skyblue;" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/plus.png" alt="alt"/>
                            </div>
                            <p class="mt-2" >Click here to add a new products</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>

                        </div>


                    </div>

                </div>



            </div>



        </div>

        <!-- <Modal start -->
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content bg-primary text-white">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperation" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="from-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required>
                            </div>

                            <div class="from-group">
                                <textarea   name="catDescription" class="form-control" placeholder="Enter category description" required style="height: 300px;"/></textarea>
                            </div>
                            <div class="container text-center text-white">
                                <button class="btn btn-primary">Add Category</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>


        <!--<!-- odal2 -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content bg-primary text-white">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperation" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                            <div class="from-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Product Title" required>
                            </div>

                            <div class="from-group">
                                <textarea   name="pDesc" class="form-control" placeholder="Enter Product Description" required style="height: 150px;"/></textarea>
                            </div>

                            <div class="from-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required>
                            </div>
                            <div class="from-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required>
                            </div>

                            <div class="from-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required>
                            </div>
                            
                            
                            
                            

                           




                            <div class="from-group">
                                <select name="catId" class="form-control" >

                                    <%
                                        for (Category c : list) {

                                    %>
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

                                    <% }%>
                                </select>

                            </div>

                            <div class="from-group">
                                <label id="pPid" >Select Picture of Product</label>
                                <br>
                                <input type="file" class="form-control" id="pPid" name="pPic"  required>
                            </div>







                            <div class="container text-center text-white">
                                <button class="btn btn-primary">Add Product</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

                                    <%@include file="components/commonmodal.jsp" %>

    </body>
</html>
