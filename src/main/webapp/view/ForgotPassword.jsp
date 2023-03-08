<%-- 
    Document   : order
    Created on : 28-Feb-2023, 00:32:54
    Author     : Dell
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
<!DOCTYPE html>
<html>
    
    <body>
        <section>
                                    <!-- Form for Login -->
                            <div class="col-md-5 col-lg-5 ">
                                <div class="card-body text-black">



                                    <form action="../Controller" method="post">
                                        <input style="display:none">
                                        <input type="password" style="display:none">
                                        <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Reset Password</h3>

                                        <div class="form-outline mb-4">
                                            <input  type="text" id="form2Example17" name="username" placeholder="Enter Username"  class="form-control form-control-lg" />
                                            <label class="form-label" for="form2Example17"  >Username</label>
                                        </div>

                                        

                                        <div class="pt-1 mb-4">
                                            <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="Reset">
                                        </div>
<!--                                        <a href="../view/ForgotPassword.jsp">Submit</a>-->
                                    </form>
                                    
                                </div>
                            </div>
               
    </section>
</body>
    
</html>
<jsp:include page="../view/footer.jsp" /> 
<%} else
{
    String redirectURL = "../controller/index.jsp";
    response.sendRedirect(redirectURL);

}
%>
