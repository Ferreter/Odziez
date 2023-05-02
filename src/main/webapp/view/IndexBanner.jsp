<%-- 
    Document   : IndexBanner
    Created on : 26 Jan, 2023, 11:48:20 PM
    Author     : hkhat
--%>


<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Collections"%>
<%@page import="DTO.products"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProductsDaoInterface"%>
<%@page import="DAO.ProductsDao"%>
<%@page import="DAO.ProductsDao"%>
<%@page import="DTO.user"%>
<%ProductsDao pdao = new ProductsDao("clothes_shop");%>
<% ProductsDaoInterface productdao = new ProductsDao("clothes_shop");%>
<%List<products> prods = productdao.ListAllProducts();%>
<div style="margin: 20px; margin-bottom:100px;">
    <h5 style="margin-bottom:30px;">Odziez, Clothing Made simpler and better</h5>

    <!-- Banner -->
    <div class="jumbotron jumbotron-fluid bg-cover" style="background-image: url(../media/banner1.jpg); background-position: right; height: 100%;">
        <div class="container" style="padding-top:100px; padding-bottom: 100px;">
            <h1 class="display-4 text-left">New Arrivals</h1>
            <p class="lead text-left">Check out the latest styles in our collection</p>
            <a href="../view/productsView.jsp" class="btn btn-light text-left">Shop Now</a>
        </div>
    </div>
</div>

<!-- SOme Brands you might like -->

<div class="container-fluid" style="margin-bottom: 50px;padding-top:20px; border-top: 2px solid white">
    <p class="lead text-center">Some Brands you might like</p>
    <div class="row">
        <%
            if (prods != null && !prods.isEmpty()) {
                // Shuffle the products list
                Collections.shuffle(prods);
                // HashSet to keep track of brands already displayed
                Set<String> displayedBrands = new HashSet<String>();

                // Loop to print out four products from different brands
                int numProductsDisplayed = 0;
                for (int i = 0; i < prods.size() && numProductsDisplayed < 4; i++) {
                    products product = prods.get(i);
                    // Check if brand has already been displayed
                    if (!displayedBrands.contains(product.getBrand())) {
                        // Add brand to displayed brands HashSet
                        displayedBrands.add(product.getBrand());
                        // Display product
        %>
        <div class="col-lg-3 col-md-3 col-xs-12 col-sm-12">
            <a href="../view/individualProduct.jsp?ID=<%=product.getProductId()%>" style="color:white;">
                <div class="text-center p-3">
                    <img src="../media/products/<%=product.getProductId()%>3.jpg" alt="hoodie" class="product-categorie img-responsive" width="100%" height="450"/>
                    <p style="padding-top: 5px; font-size: 28px;">
                        <b><%= product.getBrand()%></b>

                    </p>
                </div>
            </a>
        </div>
        <%
                        numProductsDisplayed++;
                    }
                }
            }
        %>
    </div>
</div>
    
    
    <div class="container-fluid pb-8" style="border-top:5px solid white; ">
    <div class="row" style="margin-top:25px;">
        <div class="col" style=""> 
            <a href="#" style="color:white;">
                <img src="../media/banner3.jpg" alt="alt"  />
            </a>
        </div>
        <div class="col" style="">
            <a href="../view/productsView.jsp" style="color:white; padding-top: 50px;" class="text-decoration-none">
                <h3> The Showspace </h3>
                <h4>A notion of transformation extends to the space of the Deposito of the Fondazione Prada, where a moving ceiling 
                    - a reiteration of the décor of the January menswear show - reengineers dimensions, alternatively amplifying 
                    and reducing the room. The process uncovers floral decoration, previously concealed within the industrial form
                    - their revelation prompts another reconsideration of both space and the figures that move within, a new point of view.</h4>

                <div class="container text-decoration-none" style="padding-top:200px; padding-bottom: 100px;" >
                    <h2 class="display-4 text-right " style="color:white">Prada</h2>
                    <p class="lead text-right" style="color:white">Check out some products <br> handpicked by the designers</p>
                </div>
            </a>
        </div>
    </div>
</div>
<!-- Product Category Carousel 

<div class="container"  >
    <p class="lead text-center">Categories recommended by us</p>
    <div class="row">

        <div class="col-lg-2 col-xs-4 categories">
            <div class="text-center p-3">
                <img src="../media/categories/hoodie.png" alt="hoodie" class="product-categorie img-responsive"/>
                <p>Hoodies</p>

            </div>
        </div>
        <div class="col-lg-2 col-xs-4 categories">
            <div class=" text-center p-3">
                <img src="../media/categories/t-shirt.png" alt="hoodie" class="product-categorie img-responsive"/>
                <p>T-Shirts</p>
            </div>
        </div>
        <div class="col-lg-2 col-xs-4 .col-sm-12 categories">
            <div class=" text-center p-3">
                <img src="../media/categories/puffer.png" alt="hoodie" class="product-categorie img-responsive"/>
                <p>Puffers</p>
            </div>
        </div>
        <div class="col-lg-2 col-xs-6 categories">
            <div class=" text-center p-3">
                <img src="../media/categories/sweatshirt.png" alt="hoodie" class="product-categorie img-responsive"/>
                <p>Sweatshirt</p>
            </div>
        </div>

        <div class="col-lg-2 col-xs-6 .col-sm-6 categories">
            <div class=" text-center p-3">
                <img src="../media/categories/suit.png" alt="hoodie" class="product-categorie img-responsive"/>
                <p>Formal</p>
            </div>
        </div>

    </div>
</div>
-->
<!-- Products u might like -->
<!-- Q banner --> 

<div style="margin: 20px; margin-bottom:100px;">

    <!-- Banner -->
    <div class="jumbotron jumbotron-fluid bg-cover" style="background-color:whitesmoke; background-position: right; height: 100%;">
        <div class="container" >
            <h3 class="text-left text-dark">Black and White creates a dreamscape that color never can</h4>
                <h4 class=" text-right text-dark">-Jack Antonoff</h6>

                    </div>
                    </div>
                    </div>

                    <!-- Products u might like -->


                    <div class="container-fluid" style="margin-bottom: 50px;padding-top:20px; border-top: 2px solid white" >
                        <p class="lead text-center">Products that we know you love</p>
                        <div class="row">
                            <%
                                if (prods != null && !prods.isEmpty()) {
                                    // Shuffle the products list
                                    Collections.shuffle(prods);

                                    // Loop to print out four random products
                                    for (int i = 0; i < 4; i++) {
                                        products Products = prods.get(i);
                            %>
                            <!-- Code to display the product -->

                            <div class="col-lg-3 col-md-3 col-xs-12 col-sm-12">
                                <a href="../view/individualProduct.jsp?ID=<%=Products.getProductId()%>" style="color:white;">
                                    <div class=" p-3">
                                        <img src="../media/products/<%=Products.getProductId()%>2.jpg" alt="hoodie" class="product-categorie img-responsive" width="100%" height="450"/>
                                        <p style="padding-top: 5px;  font-size: 22px; " ><%= Products.getName()%> 
                                            <br> <small>

                                                <%=Products.getCP()%>
                                                <span style='float:right;'><%=Products.getBrand()%></span>
                                            </small>
                                        </p>
                                    </div>
                                </a>
                            </div>
                            <%
                                    }
                                }
                            %>

                        </div>
                    </div>

                    <%
                        user u = (user) session.getAttribute("user");
                        if (u == null) {
                    %>
                    <%} else {
                    %>
                    <div class="container">
                        <h2>Subscribe to Our Newsletter, Never Miss out on New Drops</h2>
                        <form>
                            <div class="form-group">
                                <label for="email">Email address:</label>
                                <input type="email" class="form-control" id="email">
                            </div>
                            <button type="submit" class="btn btn-dark">Subscribe</button>
                        </form>
                    </div>

                    <%
                        }
                    %>

