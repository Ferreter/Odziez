<%-- 
    Document   : viewOrder
    Created on : 28 Mar, 2023, 1:28:48 PM
    Author     : hkhat
--%>

<%@page import="DTO.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    user u = (user) session.getAttribute("user");
    if (u != null) {
%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 50px">Odziez.com/profile/account-settings
</p>
<div class="container" style=" background-color: white; color:black; margin-top: 4em;">
    <div class="row" style="background-color:black">
        <div class="col-md-4 text-center" >
            <!-- Sidebar -->
            <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
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
                        <a href="#" class="list-group-item list-group-item-action py-2 ripple ">
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

            <li class="list-group-item">
                <h3>Order History</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Address</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Products </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>12345</td>
                            <td>Your Moms House</td>
                            <td>01/01/2021</td>
                            <td>$100.00</td>
                            <td>Shipped</td>
                            <td>Vibrators</td>
                        </tr>
                        <tr>
                            <td>12345</td>
                            <td>Your Moms House</td>
                            <td>01/01/2021</td>
                            <td>$100.00</td>
                            <td>Shipped</td>
                            <td>Vibrators</td>
                        </tr>
                    </tbody>
                </table>
            </li>

        </div>
    </div>
</div>

<jsp:include page="../view/footer.jsp" /> 
<%} else {
        String redirectURL = "../view/LoginNdRegister.jsp";
        response.sendRedirect(redirectURL);

    }
%>