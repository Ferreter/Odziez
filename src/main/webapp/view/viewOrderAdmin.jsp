<%-- 
    Document   : viewOrderAdmin
    Created on : 29 Mar, 2023, 4:03:56 PM
    Author     : hkhat
--%>


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
    // If there is a Products list returned (and it's not empty)

    // Carrying out this check avoids the page breaking when the session times out
%>
<!-- product section in admin -->
<div class="container" style="margin-top: 70px">
    <h3>All Orders:</h3>
    <div class="col-md-7">
        <div class="card" style="background-color: white;">
            <div class="card-body">
                <h3 class="card-title" style="color:black">Order History</h3>
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Address</th>
                                <th>Total</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (orders != null && !orders.isEmpty() ) {
                                    for(orders ord : orders){
                                        address add = AddDao.AddressByUserId(ord.getUserId());
                            %>
                            <tr>
                                <td><%=ord.getOrderId()%></td>
                                <td><%=add.getAddress1()%></td>
                                <td>$<%=ord.getTotal()%></td>
                                <td><%=ord.getStatus()%></td>
                            </tr>
                            <%  }
                                } else { %>
                            <tr>
                                <td colspan="4">No orders</td>
                            </tr>
                            <%  } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <h5 style="margin-top:60px;"><b>Change Order Status</b></h5>
    <form action="../Controller" method="post">
        <div class="form-group">
            <label for="OrderId">Order ID:</label>
            <input type="text" class="form-control" name="OrderId" />
        </div>
        <div class="form-group">
            <label for="Changed">Select Status to update to:</label>
            <select class="form-control" id="Changed" name="Changed">
                <option selected>Select Status</option>
                <option value="Processed">Processed</option>
                <option value="In Transit">In Transit</option>
                <option value="Delivered">Delivered</option>
            </select>
        </div>
       <button class="btn btn-danger" type="submit" name="action" value="updateStatus"></button>

    </form>
</div>
<jsp:include page="../view/footer.jsp" />