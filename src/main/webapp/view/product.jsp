<%-- 
    Document   : product
    Created on : 24 Feb, 2023, 2:51:30 AM
    Author     : hkhat
--%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
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
<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 20px">Odziez.com/products
</p>


<!-- Banner -->
<div style="margin: 20px; margin-bottom:100px; margin-top: 50px;">
    <a href="../view/productsView.jsp" color="text-decoration-none" style="color:white">
        <div class="jumbotron jumbotron-fluid bg-cover text-decoration-none" style="background-image: url(../media/banner2.jpg); background-position: right; height: 100%;">
            <div class="container text-decoration-none" style="padding-top:200px; padding-bottom: 100px;" >
                <h2 class="display-4 text-right " style="color:white">Balenciage Collection</h2>
                <p class="lead text-right" style="color:white">Check out the latest styles in our collection</p>
            </div>
        </div>
    </a>
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
                    <div class="zoom-effect">
                        <img src="../media/products/<%=product.getProductId()%>3.jpg" alt="hoodie" class="product-categorie img-responsive" width="100%" height="450"/>
                    </div>
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


<div class="container-fluid" style="border-top:5px solid white; ">
    <div class="row" style="margin-top:25px;">
        <div class="col" style=""> 
            <a href="../view/productsView.jsp" style="color:white;">
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

<!-- Products u might like -->


<div class="container-fluid" style="margin-bottom: 50px;padding-top:20px; border-top: 2px solid white" >
    <p class="lead text-center">Products that we know you love</p>
    <div class="row">
        <%
            if (prods != null && !prods.isEmpty()) {
                // Shuffle the products list
                Collections.shuffle(prods);

                // Loop to print out four random products
                for (int i = 0; i < 8; i++) {
                    products Products = prods.get(i);
        %>
        <!-- Code to display the product -->

        <div class="col-lg-3 col-md-3 col-xs-12 col-sm-12">
            <a href="../view/individualProduct.jsp?ID=<%=Products.getProductId()%>" style="color:white;">
                <div class=" p-3">
                    <div class="zoom-effect">
                        <img src="../media/products/<%=Products.getProductId()%>2.jpg" alt="hoodie" class="product-categorie img-responsive" width="100%" height="450"/>
                    </div>
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

<div class="container-fluid" style="margin-bottom: 50px; padding-top: 20px; border-top: 2px solid white;">
    <p class="lead text-center">Discover stylish magazine covers worth exploring!</p>
    <div class="row">
        <div class="col-md-4 col-xs-12">
            <a href=" https://www.vogue.com/" style="display: block; margin-bottom: 20px;">
                <div class="p-3">
                    <div class="zoom-effect">
                        <img src="http://covers.condenast.co.uk/api/v1/vg/latest/image/" alt="Magazine Cover" class="cover-image img-responsive" style="max-width: 600px; height: 600px;" />
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4 col-xs-12">
            <a href="https://www.tatler.com/" style="display: block; margin-bottom: 20px;">
                <div class="p-3">
                    <div class="zoom-effect">
                        <img src="http://covers.condenast.co.uk/api/v1/ta/current/image/" alt="Magazine Cover" class="cover-image img-responsive" style="max-width: 600px; height: 600px;" />
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4 col-xs-12">
            <a href=" https://www.gq.com/" style="display: block; margin-bottom: 20px;">
                <div class="p-3">
                    <div class="zoom-effect">
                        <img src="http://covers.condenast.co.uk/api/v1/gq/latest/image/" alt="Magazine Cover" class="cover-image img-responsive" style="max-width: 600px; height: 600px;" />
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>


<jsp:include page="../view/footer.jsp" /> 
