<%-- 
    Document   : productsView
    Created on : 26 Feb, 2023, 11:47:37 PM
    Author     : hkhat
--%>

<%@page import="DAO.UserDaoInterface"%>
<%@page import="DAO.UserDao"%>
<%@page import="DTO.user"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : product
    Created on : 24 Feb, 2023, 2:51:30 AM
    Author     : hkhat
--%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<%@page import="DTO.products"%>
<%@page import="DAO.ProductsDao"%>
<%@page import="DAO.ProductsDaoInterface"%>


<%

    ProductsDao pdao = new ProductsDao("clothes_shop");
    ProductsDaoInterface productdao = new ProductsDao("clothes_shop");
    UserDao udao = new UserDao("clothes_shop");
    UserDaoInterface userdao = new UserDao("clothes_shop");
    user u = (user) session.getAttribute("user");
    List<products> p = (List<products>) session.getAttribute("products");
    List<products> products = productdao.ListAllProducts();
    // If there is a Products list returned (and it's not empty)

    // Carrying out this check avoids the page breaking when the session times out
%>


<!-- Filter -->


<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 20px">Odziez.com/allproducts
</p>


<div class="pos-f-t" style="margin-bottom: 20px;">

    <nav class="navbar navbar-dark bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
            Filter <span class="navbar-toggler-icon"></span>
        </button>
        <form class="form-inline my-2 my-lg-0" action="../Controller" method="post">
            <input class="form-control mr-sm-2" type="text" name="product"  placeholder="Search" aria-label="Search" placeholder="Search by Name">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action" value="SearchProduct">Search</button>
        </form>
    </nav>
    <div class="collapse" id="navbarToggleExternalContent" >
        <form class="form-inline my-2 my-lg-0" action="../Controller" method="post">
        <div class="container-fluid bg-dark p-4">
            <div class="row" style="font-size: 18px !important;">
                <div class="col-2" >
                    <p style="padding-top:4px;padding-bottom: 2px;margin:0px;">Color</p>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Color" value="All" checked>All
                        <label class="form-check-label" for="radio1"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Color" value="White">White
                        <label class="form-check-label" for="radio2"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Color" value="Black">Black
                        <label class="form-check-label" for="radio2"></label>
                    </div>

                    <p style="padding-top:10px;padding-bottom: 2px;margin:0px;">Printed</p>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Printed" value="Printed">Printed
                        <label class="form-check-label" for="radio1"></label>
                    </div>

                    <p style="padding-top:20px;padding-bottom: 2px;margin:0px;">Occasion</p>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Occasion" value="Streetwear" checked>Streetwear
                        <label class="form-check-label" for="radio1"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Occasion" value="Formal">Formal
                        <label class="form-check-label" for="radio2"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Occasion" value="Casual">Casual
                        <label class="form-check-label" for="radio2"></label>
                    </div>
                </div>

                <div class="col-2">
                    <p style="padding-top:4px;padding-bottom: 2px;margin:0px;">Material</p>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Material" value="Cotton" checked>Cotton
                        <label class="form-check-label" for="radio1"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Material" value="Nylon">Nylon
                        <label class="form-check-label" for="radio2"></label>
                    </div>
                     <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Material" value="Wool">Wool
                        <label class="form-check-label" for="radio3"></label>
                    </div>

                    <p style="padding-top:10px;padding-bottom: 2px;margin:0px;">Fit</p>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Fit" value="Oversized" checked>Oversized
                        <label class="form-check-label" for="radio1"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Fit" value="Body">Body
                        <label class="form-check-label" for="radio2"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Fit" value="Relaxed">Relaxed
                        <label class="form-check-label" for="radio3"></label>
                    </div>

                    <p style="padding-top:10px;padding-bottom: 2px;margin:0px;">Length</p>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Length" value="Long" checked>Long
                        <label class="form-check-label" for="radio1"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Length" value="Normal">Normal
                        <label class="form-check-label" for="radio2"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Length" value="Short">Short
                        <label class="form-check-label" for="radio3"></label>
                    </div>
                </div>
                <div class="col-2">
                    <p style="padding-top:10px;padding-bottom: 2px;margin:0px;">Neck Line</p>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="NeckLine" value="Turtleneck" checked>Turtleneck
                        <label class="form-check-label" for="radio1"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="NeckLine" value="V Neck">V Neck
                        <label class="form-check-label" for="radio2"></label>
                    </div>
                     <div class="form-check">
                        <input type="radio" class="form-check-input"  name="NeckLine" value="CLossed">CLossed
                        <label class="form-check-label" for="radio3"></label>
                    </div>

                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="NeckLine" value="Button Up">Button Up
                        <label class="form-check-label" for="radio4"></label>
                    </div>

                    <div class="form-check">
                        <input type="radio" class="form-check-input"  name="NeckLine" value="Zip Up">Zip Up
                        <label class="form-check-label" for="radio5"></label>
                    </div>
                </div>
                <div class="col-2">
                    <p style="padding-top:10px;padding-bottom: 2px;margin:0px;">Style</p>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" name="Style" value="Puffer" checked>Puffer
                        <label class="form-check-label" for="radio1"></label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" name="Style" value="Hoodie">Hoodie
                        <label class="form-check-label" for="radio2"></label>
                    </div>
                     <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Style" value="Jacket">Jacket
                        <label class="form-check-label" for="radio3"></label>
                    </div>

                     <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Style" value="Blazer">Blazer
                        <label class="form-check-label" for="radio4"></label>
                    </div>

                     <div class="form-check">
                        <input type="radio" class="form-check-input"  name="Style" value="T-Shirt">T-Shirt
                        <label class="form-check-label" for="radio5"></label>
                    </div>
                     <div class="form-check">
                        <input type="radio" class="form-check-input" name="Style" value="Polo">Polo
                        <label class="form-check-label" for="radio6"></label>
                    </div>
                     
                </div>

            </div>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="action" value="FilterProduct" >Filter</button>
           
        </div>
         </form>
    </div>




</div>
<div class="container-fluid" style="margin-bottom: 50px;" >



    <!-- Filter -->


    <div class="row" style='padding:20px;'>


        <%    if (products != null && !products.isEmpty() && p == null)
            {
                // Loop to print out all of the rows
                for (products Products : products)
                {
        %>
        <div class="col-md-3">
            <a href="../view/individualProduct.jsp?ID=<%=Products.getProductId()%>" style="color:white;" class="text-decoration-none">
                <div class="fill">
                    <img src="../media/products/<%=Products.getProductId()%>1.jpg" alt="hoodie" class="" width="500px" height="500px"/>
                </div>
                <p style="padding-top: 5px;  font-size: 18px;" class="" >
                    <a href="../view/individualProduct.jsp?ID=<%=Products.getProductId()%>" style="color:white"><%=Products.getName()%></a>


                    <br> <small>

                        <%=Products.getCP()%>
                        <span style='float:right;'><%=Products.getBrand()%></span>
                    </small> </p>
            </a>
            <%

                if (u != null && u.isIsAdmin())
                {
            %>
            <form action="../Controller" method="post">
                <div class="pt-1 mb-4">
                    <button class="btn btn-dark btn-lg " type="Edit" name="action" value="EditProduct" style="font-size:12px;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                        </svg>
                        Delete Product
                    </button>
                </div>
            </form>
            <%
                }
            %>
        </div>
        <%
                // Close the loop
            }
            //Search 

        } else if (p != null)
        {

            for (products SearchedP : p)
            {

        %>
        <div class="col-md-3">
            <a href="../view/individualProduct.jsp?ID=<%=SearchedP.getProductId()%>" style="color:white;" class="text-decoration-none">
                <div class="fill">
                    <img src="../media/products/<%=SearchedP.getProductId()%>1.jpg" alt="hoodie" class="" width="500px" height="500px"/>
                </div>
                <p style="padding-top: 5px;  font-size: 18px;" class="" >
                    <a href="../view/individualProduct.jsp?ID=<%=SearchedP.getProductId()%>" style="color:white"><%=SearchedP.getName()%></a>


                    <br> <small>

                        <%=SearchedP.getCP()%>
                        <span style='float:right;'><%=SearchedP.getBrand()%></span>
                    </small> </p>
            </a>
        </div>


        <%
                }
                session.removeAttribute("products");
            }

        %>
    </div>
</div>

<jsp:include page="../view/footer.jsp" /> 