<%-- 
    Document   : cart
    Created on : 24-Feb-2023, 05:28:12
    Author     : Dell
--%>




<%@page import="DTO.products"%>
<%@page import="DAO.CartDao"%>
<%@page import="DAO.ProductsDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Cart"%>
<%@page import="DTO.user"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 

<%
    DecimalFormat deciForm = new DecimalFormat("#.##");
    request.setAttribute("deciForm", deciForm);

    CartDao cartdao = new CartDao("clothes_shop");

    ProductsDao pDao = new ProductsDao("clothes_shop");
    user u = (user) session.getAttribute("user");
    List<Cart> cartProduct = cartdao.ListAllCart(u.getUserId());
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {

        request.setAttribute("cart_list", cart_list);
        double total = 0;
    }


%>

<%    // Get the success message variable out of the session
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

<style type="text/css">

    .table tbody td{
        vertical-align: middle;
    }
    .btn-incre, .btn-decre{
        box-shadow: none;
        font-size: 25px;
    }
</style>


<body>
    <% double total = 0; %>

    <div class="container my-3">

        <table class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Item</th>
                    <th scope="col">Category</th>
                    <th scope="col">Size</th>
                    <th scope="col">Price </th>
                    <th scope="col">Quantity </th>
                </tr>
            </thead>
            <tbody>
                <% if (cartProduct != null) {
                        for (Cart item : cartProduct) {
                            products p = pDao.searchbyId(item.getProductId());
                            total += p.getCP() * item.getQuantity();
                %>
                <tr>
                    <td><%=p.getName()%></td>
                    <td><%=p.getCategory()%></td>
                     <td><%=item.getSize() %></td>
                    
                    <td><%= deciForm.format(p.getCP())%></td>
                    <td>
                        <form action="order" method="post" class="form-inline">
                            <input type="hidden" name="id" value="<%=p.getProductId()%>" class="form-input">
                            <div class="form-group d-flex justify-content-between">
                                <span><%=item.getQuantity()%></span>
                            </div>
                        </form>
                    </td>
                    <td>
                        <form action="../Controller?id=<%=p.getProductId()%>" method="post" class="form-inline">
                            <input style="margin-left: 10px;width:80%;background-color: black;color:white"  class="btn btn-sm btn-primary" type="submit" name="action" value="+">
                        </form>
                        <form action="../Controller?id=<%=p.getProductId()%>" method="post" class="form-inline">
                            <input style="margin-left: 10px;width:80%;background-color: black;color:white"  class="btn btn-sm btn-primary" type="submit" name="action" value="-">
                        </form>
                    </td>
                    <td>
                        <form action="../Controller?id=<%=p.getProductId()%>" method="post" class="form-inline">
                            <input type="hidden" name="id" value="<%=p.getProductId()%>" class="form-input">
                            <input style="margin-left: 10px;width:80%;background-color: black;color:white"  class="btn btn-sm btn-primary" type="submit" name="action" value="Remove">
                        </form>
                    </td>
                </tr>

                <% }
                    } %>
                <% if (total > 0) {%>
            <div class="d-flex py-3">
                <h3>Total Price: € <%=deciForm.format(total)%></h3>
                <a style="background-color: white;color:black;" class="mx-3 btn btn-primary" href="order.jsp">Check Out</a>
            </div>
            <% } else { %>
            <div class="alert alert-warning"style="background-color: black; color: white;" role="alert">
                Your cart is empty!
            </div>
            <% }%>
            </tbody>
        </table>
    </div>
</body>
<jsp:include page="../view/footer.jsp" /> 
