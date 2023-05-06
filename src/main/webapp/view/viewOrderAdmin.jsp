<%--
    Document   : viewOrderAdmin
    Created on : 29 Mar, 2023, 4:03:56 PM
    Author     : hkhat
--%>


<%@page import="DTO.user"%>
<%@page import="DTO.address"%>
<%@page import="DTO.orders"%>
<%@page import="DAO.AddressDao"%>
<%@page import="DAO.UserDaoInterface"%>
<%@page import="DAO.UserDao"%>
<%@page import="DAO.UserDao"%>
<%@page import="DAO.OrderDaoInterface"%>
<%@page import="DAO.OrderDao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../model/header.jsp" />
<jsp:include page="../view/nav.jsp" />
<%@page import="DTO.products"%>
<%@page import="DAO.ProductsDao"%>
<%@page import="DAO.ProductsDaoInterface"%>
<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 20px">Odziez.com/allproducts
</p>
<%

    OrderDao Odao = new OrderDao("clothes_shop");
    OrderDaoInterface Orderdao = new OrderDao("clothes_shop");

    UserDao udao = new UserDao("clothes_shop");
    UserDaoInterface userdao = new UserDao("clothes_shop");
    AddressDao AddDao = new AddressDao("clothes_shop");
    List<orders> orders = Orderdao.AllOrders();
    user u = (user) session.getAttribute("user");
    // If there is a Products list returned (and it's not empty)

    if (u != null && u.isIsAdmin()) {
        // Carrying out this check avoids the page breaking when the session times out
%>
<!-- order section in admin -->
<%
    // Get the success message variable out of the session
    Object msg = session.getAttribute("successMessage");
    // If there is an success message to print
    String success = "";
    if (msg != null) {
        // Cast it to a String so we can use it
        success = (String) msg;
        // Display the message
%>
<script>
    var msg = '<%= success%>';
    swal("", msg, "success");
</script>
<%
        session.removeAttribute("successMessage");
    }
%>

<%
    // Get the error message variable out of the session
    Object errmsg = session.getAttribute("errorMessages");
    // If there is an success message to print
    String error = "";
    if (errmsg != null) {
        // Cast it to a String so we can use it
        success = (String) errmsg;
        // Display the message
%>
<script>
    var msg = '<%= success%>';
    swal("", msg, "error");
</script>
<%
        session.removeAttribute("errorMessages");
    }
%>
<div class="container" style="margin-top: 70px; background-color: white; padding: 50px; color: black;">
    <div class="col-md-7">
        <h3>Order History</h3>
        <div style="overflow-y: auto; max-height: 300px;">
            <table class="table table-striped table-bordered table-hover" style="width: 100%;">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Address</th>
                        <th>Total</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <% if (orders != null && !orders.isEmpty()) { %>
                <tbody>
                    <% for (orders ord : orders) {
                            List<address> add = AddDao.AddressByUserId(ord.getUserId());
                            address orderAddress = null;
                            for (address addr : add) {
                                if (addr.getAddressId() == ord.getAddressId()) {
                                    orderAddress = addr;
                                    break;
                                }
                            }
                    %>
                    <tr>
                        <td><%= ord.getOrderId()%></td>
                        <td>
                            <%= orderAddress.getAddress1()%><br>
                            <%= orderAddress.getAddress2()%><br>
                            <%= orderAddress.getCity()%>, <%= orderAddress.getCounty()%> <%= orderAddress.getPincode()%><br>
                            <%= orderAddress.getCountry()%>
                        </td>
                        <td><%= ord.getTotal()%></td>
                        <td><%= ord.getStatus()%></td>
                    </tr>
                    <% } %>
                </tbody>
                <% } else { %>
                <tbody>
                    <tr>
                        <td colspan="4">No orders</td>
                    </tr>
                </tbody>
                <% } %>
            </table>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <h5 class="my-4"><b>Change Order Status</b></h5>
                <form action="../Controller" method="post">
                    <div class="form-group row">
                        <label for="OrderId" class="col-sm-4 col-form-label">Order ID:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="OrderId" name="OrderId">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Changed" class="col-sm-4 col-form-label">Status:</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="Changed" name="Changed">
                                <option selected>Select Status to Update to</option>
                                <option value="Processed">Processed</option>
                                <option value="In Transit">In Transit</option>
                                <option value="Delivered">Delivered</option>
                            </select>
                        </div>
                    </div>



                    <div class="form-group row">
                        <div class="col-sm-12 text-center">
                            <button type="submit" name="action" value="updateStatus" class="btn btn-primary">Update Status</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<%
    } else {
        String redirectURL = "../view/LoginNdRegister.jsp";
        response.sendRedirect(redirectURL);

    }


%>
<jsp:include page="../view/footer.jsp" />
