<%-- 
    Document   : login
    Created on : 8 Dec 2022, 11:26:27
    Author     : d00241144
--%>

<jsp:include page="/model/header.jsp" /> 


<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Register To Oziz</title>
    </head>
    <body>                
        <p>Welcome Please Register</p>
            <form action="../Controller" method="post">
                <table>
                    <tr>
                        <td> Username : </td><td> <input name="username" size=30 type="text" required /> </td> 
                    </tr>
                    <tr>
                        <td> Password : </td><td> <input name="password" size=30 type="password" required /> </td> 
                    </tr>
                    <tr>
                        <td> First Name : </td><td> <input name="firstname" size=30 type="text" required /> </td> 
                    </tr>
                    <tr>
                        <td> Last Name : </td><td> <input name="lastname" size=30 type="text" required /> </td> 
                    </tr>
                    <tr>
                        <td> Email : </td><td> <input name="email" size=30 type="text" required /> </td> 
                    </tr>
                    <tr>
                        <td> Phone : </td><td> <input name="phone" size=30 type="text" required /> </td> 
                    </tr>
                     <tr>
                        <td> D.O.B : </td><td> <input name="dob" size=30 type="text" required /> </td> 
                    </tr>
                </table>
                <input type="submit" value="submit" />
                <!-- Include a hidden field to identify what the user wants to do -->
                <input type="hidden" name ="action" value="register" />
            </form>
    </body>
    <jsp:include page="/view/footer.jsp" /> 
</html>
