<%-- 
    Document   : userAdmin
    Created on : 9 Mar, 2023, 5:54:26 PM
    Author     : hkhat
--%>
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

<jsp:include page="../view/footer.jsp" />