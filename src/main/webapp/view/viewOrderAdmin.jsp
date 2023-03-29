<%-- 
    Document   : viewOrderAdmin
    Created on : 29 Mar, 2023, 4:03:56 PM
    Author     : hkhat
--%>


<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    products p = (products) session.getAttribute("products");
    List<products> products = productdao.ListAllProducts();
    // If there is a Products list returned (and it's not empty)

    // Carrying out this check avoids the page breaking when the session times out
%>
<!-- product section in admin -->
<div class="container" style="margin-top: 70px">
    <h3>The Product table:</h3>
    <div style="overflow-y:auto; max-height: 600px;">
        <table id="dtDynamicVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0"
               width="100%" style="color:white;max-height: 100px;">
            <thead style="background-color: white;color:black;">
                <tr>
                    <th class="th-sm">ProductId
                    </th>
                    <th class="th-sm">Name
                    </th>
                    <th class="th-sm">MRP
                    </th>
                    <th class="th-sm">CP
                    </th>
                    <th class="th-sm">Description
                    </th>
                    <th class="th-sm">Category
                    </th>
                    <th class="th-sm">Tags
                    </th>
                    <th class="th-sm">Brand
                    </th>
                </tr>
            </thead>
            <tbody>
                <%                    if (products != null && !products.isEmpty() && p == null) {
                        // Loop to print out all of the rows
                        for (products Products : products) {
                %>

                <tr>
                    <td><%=Products.getProductId()%></td>
                    <td><%=Products.getName()%></td>
                    <td><%=Products.getMRP()%></td>
                    <td><%=Products.getCP()%></td>
                    <td><%=Products.getDescription()%></td>
                    <td><%=Products.getCategory()%></td>
                    <td><%=Products.getTags()%></td>
                    <td><%=Products.getBrand()%></td>
                </tr>
                <%
                        }
                        //Search 
                    } else {

                    }
                %>
            </tbody>
        </table>
    </div>

    <h5 style="margin-top:60px;"><b>Change Order Status</b></h5>
    <form action="../Controller" method="post">
        <table>

            <p style="padding-right: 20px;">Order ID: </p>
            <br><input type="text" name="ProductId" /><br><br>
            <select class="form-select" aria-label="Default select example">
                <option selected>Select Status to update to</option>
                <option value="1">Proccessed</option>
                <option value="2">In Transit</option>
                <option value="3">Delivered</option>
            </select>
            <td style="padding-top:20px;" colspan="2"><input type="submit" name="action" value="updateStatus" /></td>
            </tr>
        </table>
    </form>
</div>


<jsp:include page="../view/footer.jsp" />