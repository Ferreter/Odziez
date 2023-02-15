<%-- 
    Document   : userProfile
    Created on : 8 Feb, 2023, 12:38:41 PM
    Author     : hkhat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<div class="container" style=" background-color: white; color:black; margin-top: 4em;">
    <div class="row">
        <div class="col-md-4 text-center">
            <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
                <div class="position-sticky">
                    <div class="list-group list-group-flush mx-3 mt-4">
                        <!-- Collapse 1 -->
                        <a
                            class="list-group-item list-group-item-action py-2 ripple"
                            aria-current="true"
                            data-mdb-toggle="collapse"
                            href="#collapseExample1"
                            aria-expanded="true"
                            aria-controls="collapseExample1"
                            >
                            <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Expanded menu</span>
                        </a>
                        <!-- Collapsed content -->
                        <ul id="collapseExample1" class="collapse show list-group list-group-flush">
                            <li class="list-group-item py-1">
                                <a href="" class="text-reset">Link</a>
                            </li>
                            <li class="list-group-item py-1">
                                <a href="" class="text-reset">Link</a>
                            </li>
                            <li class="list-group-item py-1">
                                <a href="" class="text-reset">Link</a>
                            </li>
                            <li class="list-group-item py-1">
                                <a href="" class="text-reset">Link</a>
                            </li>
                        </ul>
                        <!-- Collapse 1 -->

                        <!-- Collapse 2 -->
                        <a
                            class="list-group-item list-group-item-action py-2 ripple"
                            aria-current="true"
                            data-mdb-toggle="collapse"
                            href="#collapseExample2"
                            aria-expanded="true"
                            aria-controls="collapseExample2"
                            >
                            <i class="fas fa-chart-area fa-fw me-3"></i><span>Collapsed menu</span>
                        </a>
                        <!-- Collapsed content -->
                        <ul id="collapseExample2" class="collapse list-group list-group-flush">
                            <li class="list-group-item py-1">
                                <a href="" class="text-reset">Link</a>
                            </li>
                            <li class="list-group-item py-1">
                                <a href="" class="text-reset">Link</a>
                            </li>
                            <li class="list-group-item py-1">
                                <a href="" class="text-reset">Link</a>
                            </li>
                            <li class="list-group-item py-1">
                                <a href="" class="text-reset">Link</a>
                            </li>
                        </ul>
                        <!-- Collapse 2 -->
                    </div>
                </div>
            </nav>
            <!-- Sidebar -->
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-7">
            <ul class="list-group">
                <li class="list-group-item">
                    <h3>Personal Information</h3>
                    <p>
                        <strong>Name:</strong> User Name<br>
                        <strong>Email:</strong> user@example.com<br>
                        <strong>Location:</strong> City, Country<br>
                    </p>
                </li>
                <li class="list-group-item">
                    <h3>Order History</h3>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Date</th>
                                <th>Total</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>12345</td>
                                <td>01/01/2021</td>
                                <td>$100.00</td>
                                <td>Shipped</td>
                            </tr>
                            <tr>
                                <td>67890</td>
                                <td>02/01/2021</td>
                                <td>$200.00</td>
                                <td>Delivered</td>
                            </tr>
                        </tbody>
                    </table>
                </li>
            </ul>
        </div>
    </div>
</div>

<jsp:include page="../view/footer.jsp" /> 