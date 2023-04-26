<%-- 
    Document   : error
    Created on : 28-Nov-2022, 16:40:33
    Author     : grahamm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 

<!DOCTYPE html>

   
    <body style="background-color: black;color: white;">
         <div class="error" style="text-align: center;margin-bottom: 50px;">
        <h1 style="margin-top: 50px;">Something went wrong</h1>
        <%
            // Get the error message variable out of the session
            Object msg = session.getAttribute("errorMessage");
            // If there is an error message to print
            String error = ""; 
            if(msg != null){
                // Cast it to a String so we can use it
                error = (String) msg;
                // Display the message
                }else{
                error = "We actually dont know what it is?";
            }
        %>

            <div style="padding-bottom: 20px;"> <%=error%> </div>
            <%
                // We have finished with the results of this action
                // so now we can remove the value from the session
                session.removeAttribute("errorMessage");
                // This makes sure that old error messages 
                // don't mistakenly get printed out later
            
%> 

        <div>
            <a href="../controller/index.jsp" class="btn btn-secondary">Back to Home Page</a>
        </div>
    </div>
    <jsp:include page="../view/footer.jsp" /> 
</html>
