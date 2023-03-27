<%-- 
    Document   : individualProduct
    Created on : 4 Mar, 2023, 1:39:49 PM
    Author     : hkhat
--%>

<%@page import="DAO.UserDaoInterface"%>
<%@page import="DAO.UserDao"%>
<%@page import="DTO.user"%>
<%@page import="DTO.review"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<%@page import="DTO.products"%>
<%@page import="DAO.ProductsDao"%>
<%@page import="DAO.ProductsDaoInterface"%>


<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 20px">Odziez.com/allproducts
</p>

<%ProductsDao pdao = new ProductsDao("clothes_shop");%>
<% ProductsDaoInterface productdao = new ProductsDao("clothes_shop");%>
<% products p = productdao.searchbyId(request.getParameter("ID"));%>
<%session.setAttribute("product", p);%>
<%UserDao udao = new UserDao("clothes_shop");%>
<%UserDaoInterface userdao = new UserDao("clothes_shop");%>

<!-- Product section-->
<section class="py-5">
    <div class="container-fluid px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-7">


                <div class="row">
                    <div class =" col-md-6">
                        <img class="card-img-top mb-5 mb-md-0" src="../media/products/<%=p.getProductId()%>1.jpg"" alt="..." />
                    </div>
                    <div class =" col-md-6">
                        <img class="card-img-top mb-5 mb-md-0" src="../media/products/<%=p.getProductId()%>2.jpg"" alt="..." />
                    </div>
                    <div class =" col-md-6" style="margin-top: 20px">
                        <img class="card-img-top mb-5 mb-md-0" src="../media/products/<%=p.getProductId()%>3.jpg"" alt="..." />
                    </div>
                    <div class =" col-md-6" style="margin-top: 20px">
                        <img class="card-img-top mb-5 mb-md-0" src="../media/products/<%=p.getProductId()%>4.jpg"" alt="..." />
                    </div>


                </div>

            </div>

            <div class="col-md-5">
                <div class="small mb-1"><%= p.getBrand()%></div>
                <h1 class="display-5 fw-bolder"><%=p.getName()%></h1>
                <div class="fs-5 mb-5">
                    <span>$<%=p.getCP()%></span>
                </div>
                <p class="lead"><%=p.getDescription()%></p>
                <p class="lead"><%= p.getProductId()%></p>

                <div style="margin-bottom: 20px;">
                    <br>
                    <button name="Size" style="margin-left: 20px;" class="btn btn-light" type="button">
                        XS
                    </button>
                    <button name="Size" style="margin-left: 20px;" class="btn btn-light" type="button">
                        S
                    </button>
                    <button name="Size" style="margin-left: 20px;" class="btn btn-light" type="button">
                        M
                    </button>
                    <button  name="Size"style="margin-left: 20px;" class="btn btn-light" type="button">
                        L
                    </button>
                    <button  name="Size" style="margin-left: 20px;" class="btn btn-light" type="button">
                        XL
                    </button>

                </div>

                <div class="">

                    <form action="../Controller?id=<%=p.getProductId()%>" method="post">
                        <br>
                        <input type="hidden" name="ProductId" value="<%= p.getProductId()%>">
                        <input type="number" name="quantity" min="1" value="1">
                        <input style="margin-left: 20px;width:50%" class="btn btn-outline-dark btn-light" type="submit" name="action" value="Cart">


                        <button style="margin-left: 20px;" class="btn btn-outline-dark btn-light" type="button">
                            Wishlist

                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid" style="margin-bottom: 50px;padding-top:20px; border-top: 2px solid white" >
        <p class="lead text-center">Coustomer Favourite Brands</p>
        <div class="row">
            <div class="col-lg-3 col-md-3 col-xs-12 ">
                <a href="#" style="color:white;">
                    <div class="text-center p-3">
                        <img src="../media/products/hmimg.jpg" alt="hoodie" class="product-categorie img-responsive" width="264px" height="396px"/>
                        <p style="padding-top: 5px;  font-size: 22px;" >Palm Angels </p>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-12  ">
                <a href="#" style="color:white;">
                    <div class=" text-center p-3">
                        <img src="../media/products/hmimg3.jpg" alt="hoodie" class="product-categorie img-responsive"/>
                        <p style="padding-top: 5px;  font-size: 22px;" >Balenciaga </p>
                    </div>
                </a>
            </div>

            <div class="col-lg-3 col-md-3 col-xs-12 ">
                <div class="text-center p-3">
                    <a href="#" style="color:white;">
                        <img src="../media/products/hmimg2.jpg" alt="hoodie" class="product-categorie img-responsive"/>
                        <p style="padding-top: 5px;  font-size: 22px;" >Broken Planet </p>
                </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-12 ">
                <div class="text-center p-3">
                    <a href="#" style="color:white;">
                        <img src="../media/products/hmimg2.jpg" alt="hoodie" class="product-categorie img-responsive"/>
                        <p style="padding-top: 5px;  font-size: 22px;" >Prada </p>
                </div>
                </a>
            </div>
        </div>
    </div>
    <!-- Review Section -->

    <div class="container-fluid" style="margin-bottom: 50px;padding-top:20px; border-top: 2px solid white" >
        <div class="container py-5">
            <div class="row">
                <div class="col-md-6 mb-4">
                    <h2 class="text-center mb-4">Product Reviews</h2>
                    <form action="../Controller" method="post">
                        <div class="form-group">
                            <label for="review-rating">Rating</label>
                            <select class="form-control" id="review-rating" name="rating">
                                <option value="5">5 Stars</option>
                                <option value="4">4 Stars</option>
                                <option value="3">3 Stars</option>
                                <option value="2">2 Stars</option>
                                <option value="1">1 Star</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="review-text">Review</label>
                            <textarea class="form-control" id="review-text" name="review" rows="3"></textarea>
                        </div>
                        <%
                            user uLog = (user) session.getAttribute("user");
                            if (uLog != null) {
                        %>
                        <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="EnterReview">
                        <%
                            } else {
                        %>
                        <h5 class="text-center mb-4">Login or Signup to Review the Product</h5>
                        <%
                            }
                        %>
                    </form>
                </div>
                <div class="col-md-6 mb-4">

                    <%
                        List<review> reviews = productdao.getReviewsByProductId(p.getProductId());

                    %>

                    <h2 class="text-center mb-4">Previous Reviews</h2>
                    <%    if (reviews

                        != null && !reviews.isEmpty () 
                            ) {
                            // Loop to print out all of the rows
                            for (review r : reviews) {

                                int userid = r.getUserId();

                                user u = userdao.findUserById(userid);
                    %>
                    <div class="card border-0 shadow mb-3 " style="color:black">
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold mb-3"><%= u.getUsername()%></h5>
                            <p class="card-text"><%= r.getReview()%></p>
                            <p class="card-text font-italic"><%= r.getRating()%></p>
                        </div>
                    </div>
                    <%
                            }
                        }

                        
                        
                    else {
                    %>
                    <p class="card-text">no reviews for this product yet</p>
                    <%
                        }

                    %>
                </div>
            </div>
        </div>
    </div>

    <!-- People who viewed this also saw-->
    <div class="container-fluid" style="margin-bottom: 50px;padding-top:20px; border-top: 2px solid white" >
        <p class="lead text-center">People who viewed this also viewed </p>
        <div class="row">
            <div class="col-lg-3 col-md-3 col-xs-12 ">
                <a href="#" style="color:white;">
                    <div class="text-center p-3">
                        <img src="../media/products/hmimg.jpg" alt="hoodie" class="product-categorie img-responsive" width="264px" height="396px"/>
                        <p style="padding-top: 5px;  font-size: 22px;" >Palm Angels </p>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-12  ">
                <a href="#" style="color:white;">
                    <div class=" text-center p-3">
                        <img src="../media/products/hmimg3.jpg" alt="hoodie" class="product-categorie img-responsive"/>
                        <p style="padding-top: 5px;  font-size: 22px;" >Balenciaga </p>
                    </div>
                </a>
            </div>

            <div class="col-lg-3 col-md-3 col-xs-12 ">
                <div class="text-center p-3">
                    <a href="#" style="color:white;">
                        <img src="../media/products/hmimg2.jpg" alt="hoodie" class="product-categorie img-responsive"/>
                        <p style="padding-top: 5px;  font-size: 22px;" >Broken Planet </p>
                </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-12 ">
                <div class="text-center p-3">
                    <a href="#" style="color:white;">
                        <img src="../media/products/hmimg2.jpg" alt="hoodie" class="product-categorie img-responsive"/>
                        <p style="padding-top: 5px;  font-size: 22px;" >Prada </p>
                </div>
                </a>
            </div>
        </div>
    </div>

</div>
</section>

<jsp:include page="../view/footer.jsp" /> 
