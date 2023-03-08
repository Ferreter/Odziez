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



<form action="../Controller" method="post">
                <input class="form-control mr-sm-2" type="text" name="product"  placeholder="Search" aria-label="Search">
               <div class="pt-1 mb-4">
                <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="SearchProduct">
                </div>
            </form>

<div class="container-fluid" style="margin-bottom: 50px;" >

<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 20px">Odziez.com/allproducts
</p>

    <div class="row" style='padding:20px;'>
        
 <%
           
                   
                   
            ProductsDao pdao = new ProductsDao("clothes_shop");
            ProductsDaoInterface productdao = new ProductsDao("clothes_shop");
            UserDao udao = new UserDao("clothes_shop");
            UserDaoInterface userdao = new UserDao("clothes_shop");
            user u = (user) session.getAttribute("user");
            products p = (products) session.getAttribute("products");
            List<products> products = productdao.ListAllProducts();
            // If there is a Products list returned (and it's not empty)
            
            // Carrying out this check avoids the page breaking when the session times out
            
            
 
            if (products != null && !products.isEmpty() && p == null && u==null )
            {
                // Loop to print out all of the rows
                for (products Products : products)
                {
            %>
        <div class="col-md-3">

            <a href="#" style="color:white;" class="text-decoration-none">

           


                <div class="fill">
                    <img src="../media/products/<%=Products.getProductId()%>1.jpg" alt="hoodie" class="" width="500px" height="500px"/>
                </div>
                <p style="padding-top: 5px;  font-size: 18px;" class="" >
                    <a href="../view/individualProduct.jsp?Name=<%=Products.getName()%>"><%=Products.getName()%></a>
                   
                    
                    <br> <small>
                            <%=Products.getCP()%>
                            <span style='float:right;'><%=Products.getBrand()%></span>
                        </small> </p>
            </a>
        </div>
<%
                    // Close the loop
                }
     
            } else if(p != null)
            {
        session.removeAttribute("products");
%>
                <div class="col-md-3">
            <a href="../view/individualProduct.jsp" style="color:white;" class="text-decoration-none">
                <div class="fill">

                <div class="fill" style=" background-image: url(../media/products/<%=p.getProductId()%>1.jpg);">

                    <img src="../media/products/<%=p.getProductId()%>1.jpg" alt="hoodie" class="" width="500px" height="500px"/>
                </div>
                <p style="padding-top: 5px;  font-size: 18px;" class="" ><%=p.getName()%>
                    <br> <small>
                            <%=p.getCP()%>
                            <span style='float:right;'><%=p.getBrand()%></span>
                        </small> </p>
            </a>
        </div>
         
            
            <%
            }else if( u!=null)
            {

  // Loop to print out all of the rows
                for (products Products : products)
                {
            %>
 

        <div class="col-md-3">
            <a href="#" style="color:white;" class="text-decoration-none">

                <div class="fill">
                    <img src="../media/products/<%=Products.getProductId()%>1.jpg" alt="hoodie" class="" width="500px" height="500px"/>
                </div>
                <p style="padding-top: 5px;  font-size: 18px;" class="" >
                    <a href="../view/individualProduct.jsp?Name=<%=Products.getName()%>"><%=Products.getName()%></a>
                   
                    
                    <br> <small>
                            <%=Products.getCP()%>
                            <span style='float:right;'><%=Products.getBrand()%></span>
                        </small> </p>
            </a>
        </div>
<%
                    // Close the loop
                }
            }else if( u.isIsAdmin())
            {

  // Loop to print out all of the rows
                for (products Products : products)
                {
            %>
 

        <div class="col-md-3">
            <a href="#" style="color:white;" class="text-decoration-none">

                <div class="fill">
                    <img src="../media/products/<%=Products.getProductId()%>1.jpg" alt="hoodie" class="" width="500px" height="500px"/>
                </div>
                <p style="padding-top: 5px;  font-size: 18px;" class="" >
                    <a href="../view/individualProduct.jsp?Name=<%=Products.getName()%>"><%=Products.getName()%></a>
                   
                    
                    <br> <small>
                            <%=Products.getCP()%>
                            <span style='float:right;'><%=Products.getBrand()%></span>
                        </small> </p>
            </a>
        </div>
                 <form action="../Controller" method="post">
               <div class="pt-1 mb-4">
                <input class="btn btn-dark btn-lg btn-block" type="Edit" name="action" value="EditProduct">
                </div>
            </form>
        <form action="../Controller" method="post">
               <div class="pt-1 mb-4">
                <input class="btn btn-dark btn-lg btn-block" type="Delete" name="action" value="DeleteProduct">
                </div>
            </form>   
<%
                    // Close the loop
                }
}

%>
    </div>
</div>

<jsp:include page="../view/footer.jsp" /> 