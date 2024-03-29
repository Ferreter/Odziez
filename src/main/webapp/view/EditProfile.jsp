<%-- 
    Document   : EditProfile
    Created on : 27-Mar-2023, 09:18:37
    Author     : Khali
--%>

<%@page import="DTO.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    user u = (user) session.getAttribute("user");
    
    if (u != null) {
%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 50px">Odziez.com/profile/edit-details
</p>


<body>               
    <section>
        <div class="container py-5 h-100" style="color:black; margin: auto;">
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
                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Edit Details</h5>
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">First name:</label>
                                            <input  type="text" autocomplete="off" placeholder="<%= u.getFirstName() %>" required="" id="form2Example17" name="firstname"   class="form-control form-control-lg" />
                                        </div>
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">last name:</label>
                                            <input  type="text" autocomplete="off" placeholder="<%= u.getLastName() %>" required="" id="form2Example17" name="lastname"   class="form-control form-control-lg" />
                                        </div>
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Email:</label>
                                            <input  type="email" autocomplete="off" placeholder="<%= u.getEmail() %>" required="" id="form2Example17" name="email"   class="form-control form-control-lg" />
                                        </div>
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Phone Number:</label>
                                            <input  type="tel" autocomplete="off" placeholder="<%= u.getPhone() %>" required="" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" title="Must use the format 0000000000" placeholder="083-234-4352"  id="form2Example17" name="phone"   class="form-control form-control-lg" />
                                        </div>
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Date Of Birth:</label>
                                            <input  type="date" autocomplete="off" placeholder="<%= u.getDOB() %>" required="" id="form2Example17" name="dob"   class="form-control form-control-lg" />
                                        </div>
                                        
                                        <div class="form-check mb-4">
                                    <input type="checkbox" name="newAdd" id="editConfirm" value="on">
                                    <label class="form-check-label" for="newAdd">Confirm Edit</label>
                                        </div>
                                        <div id="editForm" style="display: none;">
                                         <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Confirm Edit</h3>
                                         <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example17">Username</label>
                                            <input  type="text" id="form2Example17" name="username"   class="form-control form-control-lg" />
                                            
                                        </div>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example27">Password</label>
                                            <input type="password"  id="form2Example27" name="password" class="form-control form-control-lg" />
                                            
                                        </div>
                                         
                                        <div class="pt-1 mb-4">
                                            <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="Edit">
                                        </div>
                                        </div>
                                          <script> 
                                    // Get references to the checkbox and the new address form
                                    
                                    const editConfirmBox = document.getElementById('editConfirm');
                                    const editForm = document.getElementById('editForm');

                                    // Add an event listener to the checkbox to toggle the visibility of the new address form
                                        editConfirmBox.addEventListener('change', () => {
                                         if (editConfirmBox.checked) {
                                           
                                         editForm.style.display = 'block';
                                    } else {
                                            
                                           editForm.style.display = 'none';
                                            }
                                    });
                                    
                                    

                                </script>
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
                    <%} else {
                            String redirectURL = "../view/LoginNdRegister.jsp";
                            response.sendRedirect(redirectURL);

                        }
                    %>