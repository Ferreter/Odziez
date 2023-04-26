<%--
    Document   : userAdmin
    Created on : 9 Mar, 2023, 5:54:26 PM
    Author     : hkhat
--%>
<%@page import="DTO.user"%>
<%@page import="DAO.UserDaoInterface"%>
<%@page import="DAO.UserDao"%>
<%@page import="java.util.List"%>
<%--
    Document   : adminView
    Created on : 6 Mar, 2023, 2:57:54 PM
    Author     : hkhat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../model/header.jsp" />
<jsp:include page="../view/nav.jsp" />


<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 20px">Odziez.com/allproducts
</p>
<%

    UserDao udao = new UserDao("clothes_shop");
    UserDaoInterface userdao = new UserDao("clothes_shop");
    user u = (user) session.getAttribute("user");
    List<user> user = userdao.ListAllUsers();
    // If there is a Products list returned (and it's not empty)

    if (u != null && u.isIsAdmin()) {

        // Carrying out this check avoids the page breaking when the session times out
%>

<!-- user section in admin -->
<div class="container " style="background-color: white; padding: 50px; color:black">
    <h3>The user table:</h3>
    <div style="overflow-y:auto; max-height: 300px;">
        <table id="userTable" class="table table-striped table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Date of Birth</th>
                    <th>Is Admin?</th>
                </tr>
            </thead>
            <tbody>
                <% if (user != null && !user.isEmpty()) {
            // Loop to print out all of the rows
            for (user us : user) {%>
                <tr>
                    <td><%=us.getUserId()%></td>
                    <td><%=us.getUsername()%></td>
                    <td><%=us.getFirstName()%></td>
                    <td><%=us.getLastName()%></td>
                    <td><%=us.getEmail()%></td>
                    <td><%=us.getPhone()%></td>
                    <td><%=us.getDOB()%></td>
                    <td><%=us.isIsAdmin()%></td>
                </tr>
                <% }
                    //Search
                } else { %>
                <tr>
                    <td colspan="8">No users found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <h5 style="margin-top:20px;"><b>Enter username of user you wish to delete</b></h5>
    <form action="../Controller" method="post">
        <table>
            <tr>
                <td style="padding-right: 20px;">Enter Username: </td>
                <td><input  type="text" required="" autocomplete="off" id="form2Example17" name="userN"/></td>
            </tr>
            <tr>
                <td style="padding-top:20px;" colspan="2"><input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="DeleteUser"></td>
            </tr>
        </table>
    </form>
</div>
</div>
<%
    } else {
        String redirectURL = "../view/LoginNdRegister.jsp";
        response.sendRedirect(redirectURL);

    }


%>
<jsp:include page="../view/footer.jsp" />
