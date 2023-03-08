<%-- 
    Document   : Reset
    Created on : 07-Mar-2023, 08:59:55
    Author     : Dell
--%>
<%@page import="DTO.user"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<jsp:include page="../model/header.jsp" /> 
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
                                            <input  type="text" id="form2Example17" name="username"   class="form-control form-control-lg" />
                                            <label class="form-label" for="form2Example17">Username</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example27"> New Password:</label>
                                            <input type="password" autocomplete="new-password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
                                                   required=""  id="form2Example27" name="password" class="form-control form-control-lg" />
                                        </div>

                                        <div class="pt-1 mb-4">
                                            <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="Update">
                                        </div>

                                        
                                        
                                    </form>
                                    
                                </div>
                            </div>
               
    </section>
</body>
    
</html>
<jsp:include page="../view/footer.jsp" /> 
