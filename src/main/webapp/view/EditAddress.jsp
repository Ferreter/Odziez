<%-- 
    Document   : EditAddress
    Created on : 26-Apr-2023, 17:25:07
    Author     : Dell
--%>

<%@page import="DTO.address"%>
<%@page import="DAO.AddressDao"%>
<%@page import="DTO.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    user u = (user) session.getAttribute("user");
    if (u != null) {
        address a = (address) session.getAttribute("address");
        AddressDao adao = new AddressDao("clothes_shop");

        address add = adao.AddressByUserId(u.getUserId());
%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 50px">Odziez.com/profile/edit-address
</p>


<body>               
    <section>
        <div class="d-flex justify-content-center">
            <!-- Form for Login -->
            <div class="col-md-5 col-lg-5 ">
                <div class="card-body text-black">
                    <form action="../Controller" method="post">
                        <input style="display:none">
                        <input type="password" style="display:none">
                        <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Edit Address</h3>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example17">Address1</label>
                            <input type="text" id="form2Example17" name="address1" placeholder="<%= add.getAddress1()%>" class="form-control form-control-lg" />
                        </div><!-- comment -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example17">Address2</label>
                            <input type="text" id="form2Example17" name="address2" placeholder="<%= add.getAddress2()%>" class="form-control form-control-lg" />
                        </div><!-- comment -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example17">Address3</label>
                            <input type="text" id="form2Example17" name="address3" placeholder="<%= add.getAddress3()%>" class="form-control form-control-lg" />
                        </div><!-- comment -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example17">City</label>
                            <input type="text" id="form2Example17" name="city" placeholder="<%= add.getCity()%>" class="form-control form-control-lg" />
                        </div><!-- comment -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example17">County</label>
                            <input type="text" id="form2Example17" name="county" placeholder="<%= add.getCounty()%>" class="form-control form-control-lg" />
                        </div><!-- comment -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example17">Country</label>
                            <input type="text" id="form2Example17" name="country" placeholder="<%= add.getCountry()%>" class="form-control form-control-lg" />
                        </div><!-- comment -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example17">PostCode</label>
                            <input type="text" id="form2Example17" name="pincode" placeholder="<%= add.getPincode()%>" class="form-control form-control-lg" />
                        </div><!-- comment -->
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
                                <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="Update Address">
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
    </section>


</body>
<jsp:include page="../view/footer.jsp" /> 
<%} else {
        String redirectURL = "../view/LoginNdRegister.jsp";
        response.sendRedirect(redirectURL);

    }
%>
