<%-- 
    Document   : LoginNdRegister
    Created on : 8 Feb, 2023, 12:13:09 PM
    Author     : hkhat
--%>

<%@page import="DTO.user"%>
<%
    user u = (user) session.getAttribute("user");
    if (u == null)
    {
%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<body>               


    <section>
        <div class="container py-5 h-100" style="color:black">
            <div class="">
                <div class="">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row">
                            <div class="col-md-5 col-lg-5 ">
                                <div class="card-body  text-black">


                                    <!-- Form for Register -->
                                    <form action="../Controller" method="post">
                                        <input style="display:none">
                                        <input type="password" style="display:none">
                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Register Here</h5>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Username:</label>
                                            <input  type="text" required="" autocomplete="off" id="form2Example17" name="username"   class="form-control form-control-lg" />
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example27">Password:</label>
                                            <input type="password" autocomplete="new-password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
                                                   required=""  id="form2Example27" name="password" class="form-control form-control-lg" />
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">First name:</label>
                                            <input  type="text" autocomplete="off" required="" id="form2Example17" name="firstname"   class="form-control form-control-lg" />
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">last name:</label>
                                            <input  type="text" autocomplete="off" required="" id="form2Example17" name="lastname"   class="form-control form-control-lg" />
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Email:</label>
                                            <input  type="email" autocomplete="off" required="" id="form2Example17" name="email"   class="form-control form-control-lg" />
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Phone Number:</label>
                                            <input  type="tel" autocomplete="off" required="" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" title="Must use the format 0000000000" placeholder="083-234-4352"  id="form2Example17" name="phone"   class="form-control form-control-lg" />
                                        </div>
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Choose Security Question:</label>
                                            <select name="question" required="" id="form2Example17"   class="form-control form-control-lg">
                                                 <option value="null"></option>
                                                <option value="What was the first concert you attended?">What was the first concert you attended?</option>
                                                <option value="What was a thing you did as a child which was unique?">What was a thing you did as a child which was unique?</option>
                                                 <option value="what is your favorite fictional character">what is your favorite fictional character</option>
                                                 <option value="Who was the first artist you used to like but cringe on now">Who was the first artist you used to like but cringe on now?</option>
                                                 <option value="Where were you when you had your first kiss?">Where were you when you had your first kiss?</option>
                                                 <option value="What was your favorite place to visit as a child?">What was your favorite place to visit as a child?</option>
                                                 <option value="What was the name of your first stuffed animal?">What was the name of your first stuffed animal?</option>
                                                 <option value="Who was the first person you kissed in College">Who was the first person you kissed in College</option>
                                             </select>
                                            
                                        </div>
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Security Answer:</label>
                                            <input  type="text" autocomplete="off" required="" id="form2Example17" name="answer"   class="form-control form-control-lg" />
                                        </div>
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Date Of Birth:</label>
                                            <input  type="date" autocomplete="off" required="" id="form2Example17" name="dob"   class="form-control form-control-lg" />
                                        </div>
                                        
                                        <div class="form-check mb-4">
                                            <input type="checkbox" name="subscription" value="on">
                                            <label class="form-check-label" for="subscribeCheckbox">
                                                   Subscribe to our newsletter
                                           </label>
                                        </div>

                                        <div class="pt-1 mb-4">
                                            <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="register">
                                        </div>
                                        </form>
                                </div>
                            </div>
                            
                            <div class="col-md-2 col-lg-2 text-black text-center" style="margin-top: 30%">
                            
                                <h2 style="color: black;">
                                    Or
                                </h2>
                            </div>
                            
                            <!-- Form for Login -->
                            <div class="col-md-5 col-lg-5 ">
                                <div class="card-body text-black">



                                    <form action="../Controller" method="post">
                                        <input style="display:none">
                                        <input type="password" style="display:none">
                                        <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Login</h3>

                                        <div class="form-outline mb-4">
                                            <input  type="text" id="form2Example17" name="username"   class="form-control form-control-lg" />
                                            <label class="form-label" for="form2Example17">Username</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password"  id="form2Example27" name="password" class="form-control form-control-lg" />
                                            <label class="form-label" for="form2Example27">Password</label>
                                        </div>

                                        <div class="pt-1 mb-4">
                                            <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="login">
                                        </div>
                                        <a href="../view/ResetPassword.jsp">Forgot Password?</a>
                                    </form>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

<jsp:include page="../view/footer.jsp" /> 
<%} else
{
    String redirectURL = "../controller/index.jsp";
    response.sendRedirect(redirectURL);

}
%>
