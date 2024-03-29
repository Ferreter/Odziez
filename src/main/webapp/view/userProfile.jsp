<%-- 
    Document   : userProfile
    Created on : 8 Feb, 2023, 12:38:41 PM
    Author     : hkhat
--%>

<%@page import="java.util.List"%>
<%@page import="DAO.AddressDao"%>
<%@page import="DTO.user"%>
<%@page import="DTO.address"%>
<%@page import="DAO.AddressDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    user u = (user) session.getAttribute("user");
    if (u != null) {
        AddressDao adao = new AddressDao("clothes_shop");

        List<address> p = (List<address>) session.getAttribute("address");
        List<address> add = adao.AddressByUserId(u.getUserId());
%>

<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 50px">Odziez.com/profile/account-settings</p>
<div class="container" style=" background-color: white; color:black; margin-top: 4em;">
    <div class="row" style="background-color:black">
        <div class="col-md-4 text-center" >
            <!-- Sidebar -->
            <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white sticky-top">
                <div class="position-sticky" style="padding:8px 20px 20px 8px;">
                    <div class="list-group list-group-flush mx-3 mt-4">
                        <a href="../view/userProfile.jsp" class="list-group-item list-group-item-action py-2 ripple" style="padding-bottom: 10px" aria-current="true">
                            <i class="fas fa-tachometer-alt fa-fw me-3"></i><span style="float:left">Account Settings</span>
                            <svg style="float:right" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
                                <path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>
                            </svg>
                        </a>
                        <a href="../view/viewOrder.jsp" class="list-group-item list-group-item-action py-2 ripple ">
                            <i class="fas fa-chart-area fa-fw me-3"></i><span style="float:left">Orders</span>
                            <svg style="float:right" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
                                <path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>
                            </svg>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action py-2 ripple ">
                            <i class="fas fa-chart-area fa-fw me-3"></i><span style="float:left">Favourites</span>
                            <svg style="float:right" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
                                <path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>
                            </svg>
                        </a>
                        <a href="../view/shipping-policy.jsp" class="list-group-item list-group-item-action py-2 ripple ">
                            <i class="fas fa-chart-area fa-fw me-3"></i><span style="float:left">Policies</span>
                            <svg style="float:right" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
                                <path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>
                            </svg>
                        </a>

                    </div>
                </div>
            </nav>
            <!-- Sidebar -->
            <!-- Sidebar -->
        </div>
        <div class="col-md-1" style="background-color:black"></div>
        <div class="col-md-7" style=" background-color: black">
            <div style="margin-bottom: 40px; padding-top: 20px;"> 
                <ul class="list-group" style="border: none;">
                    <li class="list-group-item" style="border: none;">
                        <p style="font-size: 21px">Personal Information
                            <span style="float: right;font-size: 16px;color:gray">
                                <a href="../view/EditProfile.jsp" style="color:gray">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>
                                    Edit
                                </a>
                            </span>
                        </p>
                        <br><br>
                                <p style="font-size:17px;">
                                    <span style="color:gray; font-size: 14px;">First Name </span><br><%out.print(u.getFirstName());%> <!--bug here that password is being stored as last name and vice versa-->
                                        <br>
                                            <span style="color:gray; font-size: 14px;">Last Name </span><br><%out.print(u.getLastName());%><br>
                                                    <span style="color:gray; font-size: 14px;">Email :</span><br> <%out.print(u.getEmail());%><br>
                                                            <span style="color:gray; font-size: 14px;">Phone : </span><br><%out.print(u.getPhone());%><br>
                                                                    <span style="color:gray; font-size: 14px;">DOB : </span><br><%out.print(u.getDOB());%><br>
                                                                            </p>
                                                                            </li>
                                                                            </div>

                                                                            <div style="margin-bottom: 40px; padding-top: 5px;"> 
                                                                                <ul class="list-group" style="border: none;">
                                                                                    <li class="list-group-item" style="border: none;">
                                                                                        <p style="font-size: 21px">Address Book


                                                                                        </p>
                                                                                        <%    if (add != null && !add.isEmpty() && p == null) {
                                                                                                // Loop to print out all of the rows
                                                                                                for (address address : add) {

                                                                                        %>

                                                                                        <span style="float: right;font-size: 16px;color:gray">
                                                                                            <a href="../view/EditAddress.jsp?ID=<%=address.getAddressId()%>" style="color:gray">
                                                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                                                                </svg>
                                                                                                Edit
                                                                                            </a>

                                                                                        </span>
                                                                                        <br> <%=address.getAddress1()%></br>
                                                                                        <br> <%=address.getAddress2()%></br>
                                                                                        <br> <%=address.getAddress3()%></br>
                                                                                        <br> <%=address.getCity()%></br>
                                                                                        <br> <%=address.getCountry()%></br>
                                                                                        <br> <%=address.getCounty()%></br>
                                                                                        <br> <%=address.getPincode()%></br>



                                                                                        <%
                                                                                            }
                                                                                        %> 

                                                                                        <%
                                                                                            }
                                                                                        %>

                                                                                        <form action="../Controller?userId=<%=u.getUserId()%>" method="post" onsubmit="return addressAdded()">
                                                                                            <div class="form-check mb-4">
                                                                                                <input type="checkbox" name="newAdd" id="newAdd" value="on">
                                                                                                    <label class="form-check-label" for="newAdd">Add New Address</label>
                                                                                            </div>

                                                                                            <div id="new-address-form" style="display: none;">
                                                                                                <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">New Address Details</h5>

                                                                                                <div class="form-outline mb-4">
                                                                                                    <label class="form-label" for="form2Example17">Address 1:</label>
                                                                                                    <input type="text" name="address1" id="address1" class="form-control form-control-lg">
                                                                                                </div>

                                                                                                <div class="form-outline mb-4">
                                                                                                    <label class="form-label" for="form2Example17">Address 2:</label>
                                                                                                    <input type="text" name="address2" id="address2" class="form-control form-control-lg">
                                                                                                </div>

                                                                                                <div class="form-outline mb-4">
                                                                                                    <label class="form-label" for="form2Example17">Address 3:</label>
                                                                                                    <input type="text" name="address3" id="address3" class="form-control form-control-lg">
                                                                                                </div>

                                                                                                <div class="form-outline mb-4">
                                                                                                    <label class="form-label" for="form2Example17">City:</label>
                                                                                                    <input type="text" name="city" id="city" class="form-control form-control-lg">
                                                                                                </div>

                                                                                                <div class="form-outline mb-4">
                                                                                                    <label class="form-label" for="form2Example17">County:</label>
                                                                                                    <input type="text" name="county" id="county" class="form-control form-control-lg">
                                                                                                </div>

                                                                                                <div class="form-outline mb-4">
                                                                                                    <label class="form-label" for="form2Example17">Country:</label>
                                                                                                    <input type="text" name="country" id="country" class="form-control form-control-lg">
                                                                                                </div>


                                                                                                <div class="form-outline mb-4">
                                                                                                    <label class="form-label" for="form2Example17">Pin Code:</label>
                                                                                                    <input type="text" name="pincode" id="pincode" class="form-control form-control-lg">
                                                                                                </div>

                                                                                                <div class="pt-1 mb-4">

                                                                                                    <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="Add">
                                                                                                </div>
                                                                                            </div>
                                                                                            <script>
                                                                                                // Get references to the checkbox and the new address form

                                                                                                const newAddCheckbox = document.getElementById('newAdd');
                                                                                                const newAddressForm = document.getElementById('new-address-form');

                                                                                                // Add an event listener to the checkbox to toggle the visibility of the new address form
                                                                                                newAddCheckbox.addEventListener('change', () => {
                                                                                                    if (newAddCheckbox.checked) {

                                                                                                        newAddressForm.style.display = 'block';
                                                                                                    } else {

                                                                                                        newAddressForm.style.display = 'none';
                                                                                                    }
                                                                                                });



                                                                                            </script>
                                                                                        </form>
                                                                                        <script>
                                                                                            function addressAdded() {
                                                                                                alert("Address Added!");
                                                                                                return true;
                                                                                            }
                                                                                        </script>

                                                                                        <br><br>
                                                                                                <p style="font-size:16px;">
                                                                                                    <span style="color:gray; font-size: 14px;">You can also add and edit delivery addresses here </span><br>Coming Soon!<br> <!--bug here that password is being stored as last name and vice versa-->
                                                                                                            <br>
                                                                                                                <span style="color:gray; font-size: 14px;">Billing Address </span><br><br>
                                                                                                                        Coming Soon!
                                                                                                                        </p>
                                                                                                                        </li>
                                                                                                                        </div>

                                                                                                                        <div style="margin-bottom: 40px; padding-top: 5px;"> 
                                                                                                                            <ul class="list-group" style="border: none;">
                                                                                                                                <li class="list-group-item" style="border: none;">
                                                                                                                                    <p style="font-size: 21px">Newsletter Subscription
                                                                                                                                        <span style="float: right;font-size: 16px;color:gray">
                                                                                                                                            <a href="#" style="color:gray">
                                                                                                                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                                                                                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                                                                                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                                                                                                                </svg>
                                                                                                                                                Edit
                                                                                                                                            </a>
                                                                                                                                        </span>
                                                                                                                                    </p>
                                                                                                                                    <br><br>
                                                                                                                                            <p style="font-size:16px;">
                                                                                                                                                <%
                                                                                                                                                    if (u.getSubscription() == 0) {
                                                                                                                                                %>
                                                                                                                                                <span style="color:gray; font-size: 14px;">Newsletter Subscription </span><br>Not Subscribed 
                                                                                                                                                    <%} else {
                                                                                                                                                    %>
                                                                                                                                                    <span style="color:gray; font-size: 14px;">Newsletter Subscription </span><br>Subscribed 
                                                                                                                                                        <%
                                                                                                                                                            }
                                                                                                                                                        %>
                                                                                                                                                        <br>

                                                                                                                                                            </p>
                                                                                                                                                            </li>
                                                                                                                                                            </div>

                                                                                                                                                            <div style="margin-bottom: 40px; padding-top: 5px;"> 
                                                                                                                                                                <ul class="list-group" style="border: none;">
                                                                                                                                                                    <li class="list-group-item" style="border: none;">
                                                                                                                                                                        <p style="font-size: 21px">Delete Your Profile?

                                                                                                                                                                        </p>
                                                                                                                                                                        <p style="font-size:16px;">
                                                                                                                                                                            <span style="color:gray; font-size: 14px;">Want to Leave and Delete all your information?
                                                                                                                                                                                <br>
                                                                                                                                                                                    <form action="../Controller" method="post">
                                                                                                                                                                                        <div class="pt-1 mb-4">
                                                                                                                                                                                            <button class="btn btn-dark btn-lg btn-block" type="button"  onclick="showDeleteForm()">DELETE USER DATA</button>
                                                                                                                                                                                        </div>
                                                                                                                                                                                        <div id="deleteForm" style="display: none;">
                                                                                                                                                                                            <label for="username">Username:</label>
                                                                                                                                                                                            <input type="text" name="username" id="username" required>
                                                                                                                                                                                                <label for="password">Password:</label>
                                                                                                                                                                                                <input type="password" name="password" id="password" required>
                                                                                                                                                                                                    <button class="btn btn-danger" type="submit" name="action" value="DeleteUserProfile">Confirm Delete</button>
                                                                                                                                                                                                    </div>


                                                                                                                                                                                                    <script>
                                                                                                                                                                                                        function showDeleteForm() {
                                                                                                                                                                                                            var deleteForm = document.getElementById("deleteForm");
                                                                                                                                                                                                            deleteForm.style.display = "block";
                                                                                                                                                                                                        }
                                                                                                                                                                                                    </script>
                                                                                                                                                                                                    </form>
                                                                                                                                                                                                    </p>
                                                                                                                                                                                                    </li>
                                                                                                                                                                                                    </div>

                                                                                                                                                                                                    </ul>
                                                                                                                                                                                                    </div>
                                                                                                                                                                                                    </div>
                                                                                                                                                                                                    </div>

                                                                                                                                                                                                    <jsp:include page="../view/footer.jsp" /> 
                                                                                                                                                                                                    <%} else {
                                                                                                                                                                                                            String redirectURL = "../view/LoginNdRegister.jsp";
                                                                                                                                                                                                            response.sendRedirect(redirectURL);
                                                                                                                                                                                                        }
                                                                                                                                                                                                    %>