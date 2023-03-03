<%-- 
    Document   : productsView
    Created on : 26 Feb, 2023, 11:47:37 PM
    Author     : hkhat
--%>

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
<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 20px">Odziez.com/allproducts
</p>

 <%
           
            ProductsDao pdao = new ProductsDao("clothes_shop");
            ProductsDaoInterface productdao = new ProductsDao("clothes_shop");
            List<products> products = productdao.ListAllProducts();
            // If there is a customer list returned (and it's not empty)
            // Carrying out this check avoids the page breaking when the session times out
            
            if (products != null && !products.isEmpty())
            {
    
                // Loop to print out all of the rows
                for (products p : products)
                {
            %>
 

<div class="container-fluid" style="margin-bottom: 50px;" >
    <div class="row" style='padding:20px;'>
        <div class="col-md-3">
            <a href="#" style="color:white;" class="text-decoration-none">
                <div class="fill">
                    <img src="../media/products/<%=p.getProductId()%>1.jpg" alt="hoodie" class=""/>
                </div>
                <p style="padding-top: 5px;  font-size: 18px;" class="" >Product Name: <%=p.getName()%>
                    <br> <small>
                            <%=p.getCP()%>
                            <span style='float:right;'>Brand Name: <%=p.getBrand()%></span>
                        </small> </p>
            </a>
        </div>
        
    </div>
</div>
<%
                    // Close the loop
                }
            } else
            {
                out.println("No customers found. Please try again.");
            }
            %>


<jsp:include page="../view/footer.jsp" /> 
