<%-- 
    Document   : individualProduct
    Created on : 4 Mar, 2023, 1:39:49 PM
    Author     : hkhat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<%@page import="DTO.products"%>
<%@page import="DAO.ProductsDao"%>
<%@page import="DAO.ProductsDaoInterface"%>
<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 20px">Odziez.com/allproducts
</p>


<!-- Product section-->
<section class="py-5">
    <div class="container-fluid px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-7">
                <%ProductsDao pdao = new ProductsDao("clothes_shop");%>
                <% ProductsDaoInterface productdao = new ProductsDao("clothes_shop");%>
                <% products p = productdao.searchbyname(request.getParameter("Name"));%>

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
                <div class="small mb-1"><%= p.getBrand() %></div>
                <h1 class="display-5 fw-bolder"><%=p.getName()%></h1>
                <div class="fs-5 mb-5">
                    <span>$<%=p.getCP()%></span>
                </div>
                <p class="lead"><%=p.getDescription()%></p>
                <p class="lead">Product ID</p>

                <div style="margin-bottom: 20px;">
                    <br>
                    <button style="margin-left: 20px;" class="btn btn-light" type="button">
                        XS
                    </button>
                    <button style="margin-left: 20px;" class="btn btn-light" type="button">
                        S
                    </button>
                    <button style="margin-left: 20px;" class="btn btn-light" type="button">
                        M
                    </button>
                    <button style="margin-left: 20px;" class="btn btn-light" type="button">
                        L
                    </button>
                    <button style="margin-left: 20px;" class="btn btn-light" type="button">
                        XL
                    </button>

                </div>

                <div class="">
                    <form action="../Controller" method="post">
                        <br>
                        <input type="hidden" name="ProductId" value="<%= p.getProductId()%>">
                        <input style="margin-left: 20px;width:50%" class="btn btn-outline-dark btn-light" type="submit" name="action" value="Cart">


                        <button style="margin-left: 20px;" class="btn btn-outline-dark btn-light" type="button">
                            Wishlist
                        </button>
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
                    <form>
                        <div class="form-group">
                            <label for="review-rating">Rating</label>
                            <select class="form-control" id="review-rating">
                                <option value="5">5 Stars</option>
                                <option value="4">4 Stars</option>
                                <option value="3">3 Stars</option>
                                <option value="2">2 Stars</option>
                                <option value="1">1 Star</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="review-text">Review</label>
                            <textarea class="form-control" id="review-text" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <div class="col-md-6 mb-4">
                    <h2 class="text-center mb-4">Previous Reviews</h2>
                    <div class="card border-0 shadow mb-3 " style="color:black">
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold mb-3">Jane Doe</h5>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae tellus sit amet mauris tincidunt bibendum. Aliquam vel nibh id lectus ullamcorper gravida.</p>
                            <p class="card-text font-italic">5 Stars</p>
                        </div>
                    </div>
                    <div class="card border-0 shadow mb-3" style="color:black">
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold mb-3">John Smith</h5>
                            <p class="card-text">Pellentesque aliquet velit quis eros tincidunt volutpat. Nam sed magna eu nibh hendrerit consectetur ut sit amet tellus.</p>
                            <p class="card-text font-italic">4 Stars</p>
                        </div>
                    </div>
                    <div class="card border-0 shadow mb-3" style="color:black">
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold mb-3">Sarah Johnson</h5>
                            <p class="card-text">Vivamus vitae arcu nulla. Sed ac nisi quis urna volutpat semper. Donec non tincidunt velit.</p>
                            <p class="card-text font-italic">3 Stars</p>
                        </div>
                    </div>
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