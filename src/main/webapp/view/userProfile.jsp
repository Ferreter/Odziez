<%-- 
    Document   : userProfile
    Created on : 8 Feb, 2023, 12:38:41 PM
    Author     : hkhat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<div class="container">
  <div class="row">
    <div class="col-md-4 text-center">
      <img src="profile_image.jpg" class="img-fluid rounded-circle mb-3" alt="Profile Image">
      <h2>User Name</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </div>
    <div class="col-md-8">
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