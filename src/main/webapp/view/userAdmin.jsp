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

<div class="container mt-4">
    <h3>The user table:</h3>
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead style="background-color: #f8f9fa; color: #343a40;">
                <tr>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Date of Birth</th>
                    <th>Admin</th>
                </tr>
            </thead>
            <tbody style="background-color: #f8f9fa; color: #343a40;">
                <%
                    UserDao udao = new UserDao("clothes_shop");
                    UserDaoInterface userdao = new UserDao("clothes_shop");
                    user u = (user) session.getAttribute("user");
                    List<user> user = userdao.ListAllUsers();
                    if (user != null && !user.isEmpty()) {
                        for (user us : user) {
                %>
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
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="mt-4">
        <h5><b>Enter username of user you wish to delete</b></h5>
        <form class="form-inline" action="../Controller" method="post">
            <div class="form-group mr-2">
                <input class="form-control" type="text" required="" autocomplete="off" id="form2Example17" name="userN" placeholder="Enter Username">
            </div>
            <button class="btn btn-danger" type="submit" name="action" value="DeleteUser">Delete User</button>
        </form>
    </div>
</div>

<jsp:include page="../view/footer.jsp" />