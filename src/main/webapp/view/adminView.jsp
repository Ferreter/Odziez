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


<!-- user section in admin -->
<div class="container">
    <h3>The user table:</h3>
    <div style="overflow-y:auto; max-height: 300px;">
        <table id="dtDynamicVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0"
               width="100%" style="color:white;max-height: 100px;">
            <thead style="background-color: white;color:black;">
                <tr>
                    <th class="th-sm">UserId
                    </th>
                    <th class="th-sm">username
                    </th>
                    <th class="th-sm">FirstName
                    </th>
                    <th class="th-sm">LastName
                    </th>
                    <th class="th-sm">Email
                    </th>
                    <th class="th-sm">Phone
                    </th>
                    <th class="th-sm">DOB
                    </th>
                    <th class="th-sm">isAdmin
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Harsh</td>
                    <td>Harsh</td>
                    <td>Khatri</td>
                    <td>Email</td>
                    <td>Phone</td>
                    <td>DOB</td>
                    <td>isAdmin</td>
                </tr>

            </tbody>
        </table>


        <h5><b>Enter id of user you wish to delete</b></h5>
        <form action="delete" method="post">
            <table>
                <tr>
                    <td style="padding-right: 20px;">Enter Id: </td>
                    <td><input type="text" name="title" /></td>
                </tr>

                <tr >
                    <td style="padding-top:20px;" colspan="2"><input type="submit" value="Submit Form" /></td>
                </tr>
            </table>
        </form>
    </div>
</div>

<!-- product section in admin -->
<div class="container" style="margin-top: 70px">
    <h3>The Product table:</h3>
    <div style="overflow-y:auto; max-height: 300px;">
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
                <tr>
                    <td>1</td>
                    <td>Harsh</td>
                    <td>Harsh</td>
                    <td>Khatri</td>
                    <td>Email</td>
                    <td>Phone</td>
                    <td>DOB</td>
                    <td>isAdmin</td>
                </tr>

            </tbody>
        </table>
    </div>

    <h5><b>Enter id of Product you wish to delete</b></h5>
    <form action="deleteProduct" method="post">
        <table>
            <tr>
                <td style="padding-right: 20px;">Product Id: </td>
                <td><input type="text" name="title" /></td>
            </tr>

            <tr >
                <td style="padding-top:20px;" colspan="2"><input type="submit" value="Submit Form" /></td>
            </tr>
        </table>
    </form>

    <h5 style="margin-top:60px;    "><b>Enter Product details for adding product</b></h5>
    <form action="addProduct" method="post">
        <table>
            <tr>
                <td style="padding-right: 20px;">Product Id: </td>
                <td><input type="text" name="title" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">Name : </td>
                <td><input type="text" name="title" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">MRP: </td>
                <td style="width:200px;"><input type="text" name="title" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">CP: </td>
                <td><input type="text" name="title" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">Description: </td>
                <td  colspan="6"><input type="text" name="title" style="height:150px; overflow: auto;width:200px"/></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">Category: </td>
                <td><input type="text" name="title" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">Tags: </td>
                <td><input type="text" name="title" /></td>
            </tr>
            <tr>
                <td style="padding-right: 20px;">Brand: </td>
                <td><input type="text" name="title" /></td>
            </tr>
            <tr>
                <td style="padding-top:20px;" colspan="2"><input type="submit" value="Submit Form" /></td>
            </tr>
        </table>
    </form>
</div>

<jsp:include page="../view/footer.jsp" />