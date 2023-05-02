<%--
    Document   : productAdmin
    Created on : 9 Mar, 2023, 5:51:45 PM
    Author     : hkhat
--%>

<%@page import="DAO.ArchivedDaoInterface"%>
<%@page import="DAO.ArchivedDao"%>
<%@page import="DTO.archived"%>
<%@page import="DTO.user"%>
<%@page import="java.util.List"%>
<%--
    Document   : adminView
    Created on : 6 Mar, 2023, 2:57:54 PM
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
<%

    ArchivedDao Adao = new ArchivedDao("clothes_shop");
    ArchivedDaoInterface productdao = new ArchivedDao("clothes_shop");
    List<archived> archivedP = Adao.ListAllProducts();
    user u = (user) session.getAttribute("user");
    // If there is a Products list returned (and it's not empty)

        if (u != null && u.isIsAdmin()) {
    // Carrying out this check avoids the page breaking when the session times out
%>

<%
    // Get the success message variable out of the session
    Object msg = session.getAttribute("successMessage");
    // If there is an success message to print
    String success = "";
    if (msg != null) {
        // Cast it to a String so we can use it
        success = (String) msg;
        // Display the message
%>
<script>
     var msg = '<%= success %>';
    swal("",msg,"success");
</script>
<%
    session.removeAttribute("successMessage");
    }
%>

<%
    // Get the error message variable out of the session
    Object errmsg = session.getAttribute("errorMessages");
    // If there is an success message to print
    String error = "";
    if (errmsg != null) {
        // Cast it to a String so we can use it
        success = (String)errmsg;
        // Display the message
%>
<script>
     var msg = '<%= success %>';
    swal("",msg,"error");
</script>
<%
    session.removeAttribute("errorMessages");
    }
%>

<!-- product section in admin -->
<div class="container" style="margin-top: 70px; background-color: white; padding: 50px; color: black;width:70%;">
    <h3>The Product table:</h3>
    <div style="overflow-y:auto; max-height: 600px;">
        <table id="dtDynamicVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%" style="color:white;max-height: 100px;">
            <thead style="background-color: white;color:black;">
                <tr>
                    <th class="th-sm">ProductId</th>
                    <th class="th-sm">Name</th>
                    <th class="th-sm">MRP</th>
                    <th class="th-sm">CP</th>
                    <th class="th-sm" style="width: 30%;">Description</th>
                    <th class="th-sm">Category</th>
                    <th class="th-sm" style="width: 15%;">Tags</th>
                    <th class="th-sm">Brand</th>
                </tr>
            </thead>
            <tbody style="background-color: white;color:black;">
                <% if (archivedP != null && !archivedP.isEmpty()) {
                        // Loop to print out all of the rows
                        for (archived Products : archivedP) {
                %>
                <tr class="accordion-toggle" data-toggle="collapse" data-target="#product-details-<%= Products.getProductId()%>" aria-expanded="false" aria-controls="product-details-<%= Products.getProductId()%>">
                    <td><%=Products.getProductId()%></td>
                    <td><%=Products.getName()%></td>
                    <td><%=Products.getMRP()%></td>
                    <td><%=Products.getCP()%></td>
                    <td><%=Products.getDescription()%></td>
                    <td><%=Products.getCategory()%></td>
                    <td><%=Products.getTags()%></td>
                    <td><%=Products.getBrand()%></td>
                </tr>
                <tr class="hiddenRow">
                    <td colspan="8" style="padding: 0;">
                        <div class="collapse" id="product-details-<%= Products.getProductId()%>">
                            <div style="padding: 15px;">
                                <p><b>Product ID:</b> <%= Products.getProductId()%></p>
                                <p><b>Name:</b> <%= Products.getName()%></p>
                                <p><b>MRP:</b> <%= Products.getMRP()%></p>
                                <p><b>CP:</b> <%= Products.getCP()%></p>
                                <p><b>Description:</b> <%= Products.getDescription()%></p>
                                <p><b>Category:</b> <%= Products.getCategory()%></p>
                                <p><b>Tags:</b> <%= Products.getTags()%></p>
                                <p><b>Brand:</b> <%= Products.getBrand()%></p>
                            </div>
                        </div>
                    </td>
                </tr>
                <% }
                    }%>
            </tbody>
        </table>


    </div>

    <div class="container mt-2">
        <div class="row">
            <div class="col-md-6">
                <h5 class=" mb-1 mt-2">return to products</h5>
                <form action="../Controller" method="post">
                    <div class="form-group">
                        <label for="product-id">Product ID:</label>
                        <input type="text" class="form-control" id="product-id" name="ProductId" required>
                    </div>
                    <div class="form-group ">
                        <button type="submit" class="btn btn-danger" name="action" value="archivedProductsReturn">return to products</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

<%
    } else {
        String redirectURL = "../view/LoginNdRegister.jsp";
        response.sendRedirect(redirectURL);

    }


%>
<jsp:include page="../view/footer.jsp" />
