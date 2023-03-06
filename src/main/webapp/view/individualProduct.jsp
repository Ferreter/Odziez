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
                <div class="row">
                    <div class =" col-md-6">
                        <img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
                    </div>
                    <div class =" col-md-6">
                        <img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
                    </div>
                    <div class =" col-md-6" style="margin-top: 20px">
                        <img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
                    </div>
                    <div class =" col-md-6" style="margin-top: 20px">
                        <img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
                    </div>


                </div>

            </div>
            <div class="col-md-5">
                <div class="small mb-1">Broken Planet Market</div>
                <h1 class="display-5 fw-bolder">Product Name</h1>
                <div class="fs-5 mb-5">
                    <span>$400.00</span>
                </div>
                <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. 
                    Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea 
                    iste laborum vero?</p>
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
                    <br>
                    <button style="margin-left: 20px;width:50%" class="btn btn-outline-dark btn-light" type="button">
                        Add to cart
                    </button>
                    <button style="margin-left: 20px;" class="btn btn-outline-dark btn-light" type="button">
                        Wishlist
                    </button>
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
</section>

<jsp:include page="../view/footer.jsp" /> 