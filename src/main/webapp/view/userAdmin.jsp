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
            
            // Carrying out this check avoids the page breaking when the session times out
%>

<!-- user section in admin -->
<div class="container">
    <h3>The user table:</h3>
    <div style="overflow-y:auto; max-height: 300px;">
        <table id="dtDynamicVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0"
               width="100%" style="color:white;max-height: 100px;">
            <thead style="background-color: white;color:black;">
                 <%
 if (user != null && !user.isEmpty() )
            {
                // Loop to print out all of the rows
                for (user us : user)
                {
            %>
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
                //Search 
            } else{
            
                
}
 %>
            </tbody>
        </table>
</div>

        <h5><b>Enter id of user you wish to delete</b></h5>
        <form action="../Controller" method="post">
            <table>
                <tr>
                    <td style="padding-right: 20px;">Enter Id: </td>
                    <td><input type="text" name="username" /></td>
                </tr>

                <tr >
                    <td style="padding-top:20px;" colspan="2"><input type="submit" value="DeleteUser" /></td>
                </tr>
            </table>
        </form>
    
</div>

<jsp:include page="../view/footer.jsp" />