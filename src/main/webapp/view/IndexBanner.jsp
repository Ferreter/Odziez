<%-- 
    Document   : IndexBanner
    Created on : 26 Jan, 2023, 11:48:20 PM
    Author     : hkhat
--%>


<%@page import="DTO.user"%>
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


<!-- Product Category Carousel -->

<div class="container" >
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

                    <%
                        user u = (user) session.getAttribute("user");
                        if (u == null)
                        {
                    %>
                    <%} else
                    {
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

