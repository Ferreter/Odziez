<%-- 
    Document   : index
    Created on : 26 Jan, 2023, 2:49:53 PM
    Author     : hkhat
--%>

<%@page import="DTO.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    user u = (user) session.getAttribute("user");
    if (u == null)
    {
%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<jsp:include page="../view/IndexBanner.jsp" /> 
<jsp:include page="../view/footer.jsp" /> 
<%} else
{
%>

<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<jsp:include page="../view/IndexBanner.jsp" />
<%
    }
%>
</html>
