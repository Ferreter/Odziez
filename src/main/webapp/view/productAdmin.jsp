<%--
    Document   : productAdmin
    Created on : 9 Mar, 2023, 5:51:45 PM
    Author     : hkhat
--%>

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

    ProductsDao pdao = new ProductsDao("clothes_shop");
    ProductsDaoInterface productdao = new ProductsDao("clothes_shop");
    products p = (products) session.getAttribute("products");
    List<products> products = productdao.ListAllProducts();
    // If there is a Products list returned (and it's not empty)

    // Carrying out this check avoids the page breaking when the session times out
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
                <% if (products != null && !products.isEmpty() && p == null) {
                        // Loop to print out all of the rows
                        for (products Products : products) {
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
                <h5 class=" mb-1 mt-2">Delete a Product</h5>
                <form action="../Controller" method="post">
                    <div class="form-group">
                        <label for="product-id">Product ID:</label>
                        <input type="text" class="form-control" id="product-id" name="ProductId" required>
                    </div>
                    <div class="form-group ">
                        <button type="submit" class="btn btn-danger" name="action" value="deleteProduct">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <h5 style="margin-top: 60px;"><b>Enter Product Details for Adding Product</b></h5>
                <form action="../Controller" method="post">
                    <div class="form-group">
                        <label for="productId">Product ID:</label>
                        <input type="text" class="form-control" id="productId" name="ProductId" placeholder="Enter Product ID" required>
                    </div>
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" name="Name" placeholder="Enter Name" required>
                    </div>
                    <div class="form-group">
                        <label for="mrp-cp">MRP & CP:</label>
                        <div class="input-group">
                            <input type="number" class="form-control" id="mrp" name="MRP" placeholder="Enter MRP" required>
                            <div class="input-group-append">
                                <span class="input-group-text">-</span>
                            </div>
                            <input type="number" class="form-control" id="cp" name="CP" placeholder="Enter CP" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control" id="description" name="Description" rows="4" placeholder="Enter Description"></textarea>
                    </div>
                        <div class="form-group">
                            <label for="product-category">Category:</label>
                            <select class="form-control" id="product-category" name="Category">
                                <option value="Hoodies">Hoodies</option>
                                <option value="Jackets">Jackets</option>
                                <option value="Puffers">Puffers</option>
                            </select>
                        </div>
                    <div class="form-group">
                        <label for="tags">Tags:</label>
                        <input type="text" class="form-control" id="tags" name="Tags" placeholder="Enter Tags">
                    </div>
                    <div class="form-group">
                        <label for="brand">Brand:</label>
                        <input type="text" class="form-control" id="brand" name="Brand" placeholder="Enter Brand" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary" name="action" value="addProduct">Add Product</button>
                    </div>
                </form>
            </div>




            <div class="col-md-6">
                <form action="../Controller" method="post">
                    <fieldset>
                        <legend><h5 style="margin-top:60px;"><b>Edit Product Details</b></h5></legend>
                        <div class="form-group">
                            <label for="product-id">Product ID:</label>
                            <input type="text" class="form-control" id="product-id" name="ProductId" placeholder="Enter Product ID" />
                        </div>
                        <div class="form-group">
                            <label for="product-name">Name:</label>
                            <input type="text" class="form-control" id="product-name" name="Name" placeholder="Enter Product Name" />
                        </div>
                        <div class="form-group">
                            <label for="product-mrp">MRP:</label>
                            <input type="number" class="form-control" id="product-mrp" name="MRP" placeholder="Enter Maximum Retail Price" />
                        </div>
                        <div class="form-group">
                            <label for="product-cp">CP:</label>
                            <input type="number" class="form-control" id="product-cp" name="CP" placeholder="Enter Cost Price" />
                        </div>
                        <div class="form-group">
                            <label for="product-description">Description:</label>
                            <textarea class="form-control" id="product-description" name="Description" rows="3" placeholder="Enter Product Description"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="product-category">Category:</label>
                            <select class="form-control" id="product-category" name="Category">
                                <option value="Hoodies">Hoodies</option>
                                <option value="Jackets">Jackets</option>
                                <option value="Puffers">Puffers</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="product-tags">Tags (comma-separated):</label>
                            <input type="text" class="form-control" id="product-tags" name="Tags" placeholder="e.g. electronics, gadgets" />
                        </div>
                        <div class="form-group">
                            <label for="product-brand">Brand:</label>
                            <input type="text" class="form-control" id="product-brand" name="Brand" placeholder="Enter Product Brand" />
                        </div>
                        <button type="submit" class="btn btn-primary" name="action" value="EditProduct">Edit Product</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>


</div>

<jsp:include page="../view/footer.jsp" />
