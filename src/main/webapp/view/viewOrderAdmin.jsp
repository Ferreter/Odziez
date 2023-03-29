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
    <div class="col-md-7" style=" background-color: black">


  
            <li class="list-group-item">
                <h3>Order History</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Address</th>
                            <th>Total</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <%    if (orders != null && !orders.isEmpty() )
            {
                // Loop to print out all of the rows
               
                for(orders ord : orders){
                    address add = AddDao.AddressByUserId(ord.getUserId());
        %>
                    <tbody>
                        <tr>
                            <td><%=ord.getOrderId()%></td>
                            <td><%=add.getAddress1()%></td>
                            <td><%=ord.getTotal()%></td>
                            <td><%=ord.getStatus()%></td>
                        </tr>
                    </tbody>
                        <%
                            }
                
}else{
%>
no orders
<%
    }
            %>
                </table>
            </li>

        </div>

    <h5 style="margin-top:60px;"><b>Change Order Status</b></h5>
    <form action="../Controller" method="post">
        <table>

            <p style="padding-right: 20px;">Order ID: </p>
            <br><input type="text" name="OrderId" /><br><br>
            <select class="form-select" id="Changed" name="Changed" aria-label="Default select example">
                <option selected>Select Status to update to</option>
                <option value="Proccessed">Proccessed</option>
                <option value="In Transit">In Transit</option>
                <option value="Delivered">Delivered</option>
            </select>
            <td style="padding-top:20px;" colspan="2"><input type="submit" name="action" value="updateStatus" /></td>
            </tr>
        </table>
    </form>
</div>


<jsp:include page="../view/footer.jsp" />