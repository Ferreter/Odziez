<%-- 
    Document   : login
    Created on : 08-Dec-2022, 11:27:00
    Author     : khali
--%>

<jsp:include page="/model/header.jsp" /> 
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<link href="../css/register.css" rel="stylesheet" type="text/css">
<body>               


    <section class="vh-100">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block">

                                <img src="../media/Register.jpg" height="1000"
                                     alt="Register Form" class="img-fluid"  />
                            </div>
                            <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">


                                    <!-- Form for login -->
                                    <form action="../Controller" method="post">
                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Come On In!</h5>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Username:</label>
                                            <input  type="text" id="form2Example17" name="username"   class="form-control form-control-lg" />
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example27">Password:</label>
                                            <input type="password"  id="form2Example27" name="password" class="form-control form-control-lg" />
                                        </div>
                                        
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">First name:</label>
                                            <input  type="text" id="form2Example17" name="firstname"   class="form-control form-control-lg" />
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">last name:</label>
                                            <input  type="text" id="form2Example17" name="lastname"   class="form-control form-control-lg" />
                                        </div>
                                        
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Email:</label>
                                            <input  type="email" id="form2Example17" name="email"   class="form-control form-control-lg" />
                                        </div>
                                        
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Phone Number:</label>
                                            <input  type="number" id="form2Example17" name="phone"   class="form-control form-control-lg" />
                                        </div>
                                        
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Date Of Birth:</label>
                                            <input  type="date" id="form2Example17" name="dob"   class="form-control form-control-lg" />
                                        </div>
                                        
                                        <div class="pt-1 mb-4">
                                            <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="register">
                                        </div>

                                        <!-- link to register if not registered -->
                                        <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="#!"
                                                                                                                  style="color: #393f81;">Register here</a></p>
                                        <a href="#!" class="small text-muted">Terms of use.</a>
                                        <a href="#!" class="small text-muted">Privacy policy</a>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../view/footer.jsp" /> 
</body>
</html>
