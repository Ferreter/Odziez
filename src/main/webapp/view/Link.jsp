<%-- 
    Document   : Reset
    Created on : 07-Mar-2023, 08:59:55
    Author     : Dell
--%>
<%@page import="DTO.user"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<%
    user u = (user) session.getAttribute("user");
    if (u == null)
    {
    
%>


<!DOCTYPE html>
<html>
    
    <body>
        <section>
            <!-- Form for Reset Password -->
            <div class="col-md-5 col-lg-5 ">
                <div class="card-body text-black">
                    <form action="../Controller" method="post">
                        <input style="display:none">
                        <input type="password" style="display:none">
                        <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Get Link</h3>
                                       
                        <div class="form-outline mb-4">
                                            <input  type="text" id="form2Example17" name="username" placeholder="Enter Username"  class="form-control form-control-lg" />
                                            <label class="form-label" for="form2Example17"  >Username</label>
                                        </div>
                        
                        <div class="form-outline mb-4">
                            <input type="text" id="form2Example17" name="email"   class="form-control form-control-lg" />
                            <label class="form-label" for="form2Example17">Email</label>
                        </div>

                        <div class="pt-1 mb-4">
                            <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="Link">
                        </div>
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