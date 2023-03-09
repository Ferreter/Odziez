<%-- 
    Document   : error
    Created on : 28-Nov-2022, 16:40:33
    Author     : grahamm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 

<!DOCTYPE html>

    <div class="error" style="text-align: center;">
    <body style="background-color: black;color: white;">
        
        <h1>Something went wrong</h1>
        <%
            // Get the error message variable out of the session
            Object msg = session.getAttribute("errorMessage");
            // If there is an error message to print
            if(msg != null){
                // Cast it to a String so we can use it
                String error = (String) msg;
                // Display the message
        %>

            <div> <%=error%> </div>
            <%
                // We have finished with the results of this action
                // so now we can remove the value from the session
                session.removeAttribute("errorMessage");
                // This makes sure that old error messages 
                // don't mistakenly get printed out later
            }
%> 

        <div><a href="index.jsp">Back to index</a></div>
    </div>
    <jsp:include page="../view/footer.jsp" /> 
</html>
