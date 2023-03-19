<%-- 
    Document   : comingsoon
    Created on : 19 Mar, 2023, 1:59:45 PM
    Author     : hkhat
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 

<!DOCTYPE html>

   
    <body style="background-color: black;color: white;">
         <div class="error" style="text-align: center;margin-bottom: 50px;">
        <h1 style="margin-top: 50px;">Coming Soon</h1>
            <div style="padding-bottom: 20px;"> The Page you requested is still under Construction, Visit Soon and we may have it done </div>
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
