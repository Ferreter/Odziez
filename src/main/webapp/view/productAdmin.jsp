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
                <%                    if (products != null && !products.isEmpty() && p == null)
                    {
                        // Loop to print out all of the rows
                        for (products Products : products)
                        {
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
                    } else
                    {

                    }
                %>
            </tbody>
        </table>
    </div>

    <h5 style="margin-top:60px;"><b>Enter id of Product you wish to delete</b></h5>
    <form action="../Controller" method="post">
        <table>
            <tr>
                <td style="padding-right: 20px;">Product Id: </td>
                <td><input type="text" name="ProductId" /></td>
            </tr>

            <tr >
                <td style="padding-top:20px;" colspan="2"><input type="submit" name="action" value="deleteProduct" /></td>
            </tr>
        </table>
    </form>

<<<<<<< HEAD
    <h5 style="margin-top:60px;    "><b>Enter Product details for adding product</b></h5>
    <form action="../Controller" method="post">
        <table>
            <tr>
                <td style="padding-right: 20px;">Product Id: </td>
                <td><input type="text" name="ProductId" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">Name : </td>
                <td><input type="text" name="Name" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">MRP: </td>
                <td style="width:200px;"><input type="number" name="MRP" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">CP: </td>
                <td><input type="number" name="CP" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">Description: </td>
                <td  colspan="6"><input type="text" name="Description" style="height:150px; overflow: auto;width:200px"/></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">Category: </td>
                <td><input type="text" name="Category" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">Tags: </td>
                <td><input type="text" name="Tags" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">Brand: </td>
                <td><input type="text" name="Brand" /></td>
            </tr>
            <tr>
                <td style="padding-top:20px;" colspan="2"><input type="submit" name="action" value="addProduct"></td>
            </tr>
        </table>
    </form>
=======
    <div class="container-fluid">
        <div class = "row">
            <div class="col-md-6">
                <h5 style="margin-top:60px;    "><b>Enter Product details for adding product</b></h5>
                <form action="../Controller" method="post">
                    <table>
                        <tr>
                            <td style="padding-right: 20px;">Product Id: </td>
                            <td><input type="text" name="ProductId" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">Name : </td>
                            <td><input type="text" name="Name" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">MRP: </td>
                            <td style="width:200px;"><input type="number" name="MRP" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">CP: </td>
                            <td><input type="number" name="CP" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">Description: </td>
                            <td  colspan="6"><input type="text" name="Description" style="height:150px; overflow: auto;width:200px"/></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">Category: </td>
                            <td><input type="text" name="Category" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">Tags: </td>
                            <td><input type="text" name="Tags" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">Brand: </td>
                            <td><input type="text" name="Brand" /></td>
                        </tr>
                        <tr>
                            <td style="padding-top:20px;" colspan="2"><input type="submit" name="action" value="addProduct"/></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="col-md-6">
                <h5 style="margin-top:60px;    "><b>Enter Product details for editing the product</b></h5>
                <form action="../Controller" method="post">
                    <table>
                        <tr>
                            <td style="padding-right: 20px;">Product Id: </td>
                            <td><input type="text" name="ProductId" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">Name : </td>
                            <td><input type="text" name="Name" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">MRP: </td>
                            <td style="width:200px;"><input type="number" name="MRP" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">CP: </td>
                            <td><input type="number" name="CP" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">Description: </td>
                            <td  colspan="6"><input type="text" name="Description" style="height:150px; overflow: auto;width:200px"/></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">Category: </td>
                            <td><input type="text" name="Category" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">Tags: </td>
                            <td><input type="text" name="Tags" /></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 20px;">Brand: </td>
                            <td><input type="text" name="Brand" /></td>
                        </tr>
                        <tr>
                            <td style="padding-top:20px;" colspan="2"><input type="submit" name="action" value="addProduct"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>

>>>>>>> 5e0ca6ea13e27efa9f38129bec71b3ddbae040bf
</div>

<jsp:include page="../view/footer.jsp" />