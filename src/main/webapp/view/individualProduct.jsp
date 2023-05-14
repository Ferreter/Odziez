<%-- 
    Document   : individualProduct
    Created on : 4 Mar, 2023, 1:39:49 PM
    Author     : hkhat
--%>

<%@page import="DTO.stock"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.StockDaoInterface"%>
<%@page import="DAO.StockDao"%>
<%@page import="java.util.Collections"%>
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
<%List<products> prods = productdao.ListAllProducts();%>
<%StockDao sdao = new StockDao("clothes_shop");%>
<% StockDaoInterface StockDao = new StockDao("clothes_shop");%>
<%List<stock> Stocks = sdao.ListAllStockForProductId(p);%>
<% user uLog = (user) session.getAttribute("user"); %>
<!-- Product section-->
<section class="py-5">
    <div class="container-fluid px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-7">
                <div class="row">
                    <div class="col-md-6">
                        <a href="#" data-toggle="modal" data-target="#exampleModal1">
                            <img class="card-img-top mb-5 mb-md-0" src="../media/products/<%=p.getProductId()%>1.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-md-6">
                        <a href="#" data-toggle="modal" data-target="#exampleModal2">
                            <img class="card-img-top mb-5 mb-md-0" src="../media/products/<%=p.getProductId()%>2.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-md-6" style="margin-top: 20px">
                        <a href="#" data-toggle="modal" data-target="#exampleModal3">
                            <img class="card-img-top mb-5 mb-md-0" src="../media/products/<%=p.getProductId()%>3.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-md-6" style="margin-top: 20px">
                        <a href="#" data-toggle="modal" data-target="#exampleModal4">
                            <img class="card-img-top mb-5 mb-md-0" src="../media/products/<%=p.getProductId()%>4.jpg" alt="..." />
                        </a>
                    </div>
                </div>

                <!-- Modal -->
                <!-- Modal 1 -->
                <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="border:none">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <img src="../media/products/<%=p.getProductId()%>1.jpg" class="img-fluid">
                            </div>
                            <div class="modal-footer justify-content-center">
                                <button type="button" class="btn btn-secondary prev" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal4"><</button>
                                <button type="button" class="btn btn-secondary next" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal2">></button>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal 2 -->
                <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="border:none">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <img  src="../media/products/<%=p.getProductId()%>2.jpg" class="img-fluid">
                            </div>
                            <div class="modal-footer justify-content-center">
                                <button type="button" class="btn btn-secondary prev" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal1"><</button>
                                <button type="button" class="btn btn-secondary next" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal3">></button>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal 3 -->
                <div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="border:none">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>

                            </div>
                            <div class="modal-body">
                                <img  src="../media/products/<%=p.getProductId()%>3.jpg" class="img-fluid">
                            </div>
                            <div class="modal-footer justify-content-center">
                                <button type="button" class="btn btn-secondary prev" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal2"><</button>
                                <button type="button" class="btn btn-secondary next" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal4">></button>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal 4 -->
                <div class="modal fade" id="exampleModal4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header" style="border:none">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <img  src="../media/products/<%=p.getProductId()%>4.jpg" class="img-fluid">
                            </div>
                            <div class="modal-footer justify-content-center">
                                <button type="button" class="btn btn-secondary prev" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal3"><</button>
                                <button type="button" class="btn btn-secondary next" data-dismiss="modal" data-toggle="modal" data-target="#exampleModal1">></button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="col-md-5">
                <div class="small mb-1"><%= p.getBrand()%></div>
                <h1 class="display-5 fw-bolder"><%=p.getName()%></h1>
                <div class="fs-5 mb-5">
                   € <span><%=p.getCP()%></span>
                </div>
                <p class="lead"><%=p.getDescription()%></p>
                <p class="lead"><%= p.getProductId()%></p>



                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ">
                            <div class="d-flex justify-content-start">
                                <button id="showFormButton" class="btn btn-outline-dark btn-light mb-3">Enter Measurements</button>
                            </div>

                            <form id="measurementsForm" action="../Controller" method="POST" style="display: none;">
                                <h5 class="mb-3">Enter Your Measurements:</h5>

                                <div class="row mb-3">
                                    <div class="col-sm-6">
                                        <label for="chest" class="form-label">Chest:</label>
                                        <input type="number" class="form-control form-control-sm" min="1" max="200" step="0.01" id="chest" name="chest" required>
                                    </div>

                                    <div class="col-sm-6">
                                        <label for="waist" class="form-label">Waist:</label>
                                        <input type="number" class="form-control form-control-sm" min="1" max="200" step="0.01" id="waist" name="waist" required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-sm-6">
                                        <label for="hip" class="form-label">Hip:</label>
                                        <input type="number" class="form-control form-control-sm" min="1" max="200" step="0.01" id="hip" name="hip" required>
                                    </div>

                                    <div class="col-sm-6">
                                        <label for="inseam" class="form-label">Inseam:</label>
                                        <input type="number" class="form-control form-control-sm" min="1" max="200" step="0.01" id="inseam" name="inseam" required>
                                    </div>
                                </div>

                                <input type="hidden" name="ProductId" value="<%= p.getProductId()%>">

                                <button class="btn btn-outline-dark btn-light" type="submit" name="action" value="calculateSize">Calculate Size</button>
                            </form>
                        </div>
                    </div>
                </div>

                <%String size = (String) session.getAttribute("Size");%>

                <script>
                    document.getElementById("showFormButton").addEventListener("click", function () {
                        var form = document.getElementById("measurementsForm");
                        if (form.style.display === "none") {
                            form.style.display = "block";
                        } else {
                            form.style.display = "none";
                        }
                    });

                    // Show/hide the calculated size heading
                    var calculatedSize = "<%= size%>";
                    var sizeHeading = document.getElementById("calculatedSizeHeading");
                    if (calculatedSize && calculatedSize.trim() !== "") {
                        sizeHeading.style.display = "block";
                    } else {
                        sizeHeading.style.display = "none";
                    }
                </script>


                <h3 id="calculatedSizeHeading" style="<%= (size != null && !size.trim().isEmpty()) ? "display: block;" : "display: none;"%>">Calculated Size: <%= size%></h3>


                <div class="">
                    <form action="../Controller?id=<%=p.getProductId()%>" method="post">

                        <div style="margin-bottom: 20px;">
                            <br>
                            <input type="radio" name="Size" value="XS" id="size-xs" checked>
                            <label for="size-xs" title="In Stock=<%=Stocks.get(0).getXS()%>">XS</label>

                            <input type="radio" name="Size" value="S" id="size-s">
                            <label for="size-s" title="In Stock=<%=Stocks.get(0).getS()%>">S</label>

                            <input type="radio" name="Size" value="M" id="size-m">
                            <label for="size-m" title="In Stock=<%=Stocks.get(0).getM()%>">M</label>

                            <input type="radio" name="Size" value="L" id="size-l">
                            <label for="size-l" title="In Stock=<%=Stocks.get(0).getL()%>">L</label>

                            <input type="radio" name="Size" value="XL" id="size-xl">
                            <label for="size-xl" title="In Stock=<%=Stocks.get(0).getXL()%>">XL</label>
                        </div>

                        <br>
                        <input type="hidden" name="ProductId" value="<%= p.getProductId()%>">
                        <input type="number" name="quantity" min="1" value="1">
                                                <%
                            
                            if (uLog != null) {
                        %>
                        <input style="margin-left: 20px;width:50%" class="btn btn-outline-dark btn-light" type="submit" name="action" value="Cart">
                        <%
                        } else {
                        %>
                        <button style="margin-left: 20px;" class="btn btn-outline-dark btn-light" type="button">Login or Signup to Review the Product</button>
                        <%
                            }
                        %>
                        
                        
                    </form>

                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid" style="margin-bottom: 50px;padding-top:20px; border-top: 2px solid white">
    <p class="lead text-center">You Also Might Like</p>
    <div class="row">
        <% 
            if (prods != null && !prods.isEmpty()) {
                Collections.shuffle(prods);

                List<products> matchingProds = new ArrayList<products>(); 
                String[] pTags = p.getTags().split(",");
                
                // Filter products with similar tags and not equal to p.getProductId()
                for (products prod : prods) {
                    if (!prod.getProductId().equals(p.getProductId())) { // Exclude current product
                        boolean hasMatchingTag = false;
                        String[] prodTags = prod.getTags().split(",");
                        
                        for (String tag : prodTags) {
                            for (String pTag : pTags) {
                                if (tag.trim().equals(pTag.trim())) {
                                    hasMatchingTag = true;
                                    break;
                                }
                            }
                        }
                        
                        if (hasMatchingTag) {
                            matchingProds.add(prod);
                        }
                    }
                }
                
                // Display random product if matching products are less than 4
                int displayCount = Math.min(matchingProds.size(), 4);
                
                for (int i = 0; i < displayCount; i++) {
                    products Products = matchingProds.get(i);
        %>
        <!-- Code to display the product -->
        <div class="col-lg-3 col-md-3 col-xs-12 col-sm-12">
            <a href="../view/individualProduct.jsp?ID=<%= Products.getProductId() %>" style="color:white;">
                <div class="p-3">
                    <div class="zoom-effect">
                        <img src="../media/products/<%= Products.getProductId() %>2.jpg" alt="hoodie" class="product-categorie img-responsive" width="100%" height="450" />
                    </div>
                    <p style="padding-top: 5px; font-size: 22px;">
                        <%= Products.getName() %>
                        <br>
                        <small>
                           € <%= Products.getCP() %>
                            <span style='float:right;'> <%= Products.getBrand() %> </span>
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
                                != null && !reviews.isEmpty()) {
                            // Loop to print out all of the rows
                            for (review r : reviews) {

                                int userid = r.getUserId();
                                int rating = r.getRating();
                                user u = userdao.findUserById(userid);
                    %>
                    <div class="card border-0 shadow mb-3 " style="color:black">
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold mb-3"><%= u.getUsername()%></h5>
                            <p class="card-text"><%= r.getReview()%></p>
                            <div class="stars">
                                <% for (int i = 0; i < rating; i++) { %>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                                <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                                </svg>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="card-text">no reviews for this product yet</p>
                    <%
                        }

                    %>
                </div>
            </div>
        </div>
    </div>

    <!-- People who viewed this also saw
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
    -->
</div>
</section>

<jsp:include page="../view/footer.jsp" /> 
