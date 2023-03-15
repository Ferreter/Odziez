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
	

	
	<div class="container my-3">
		<div class="d-flex py-3"><h3>Total Price: € ${(total>0)?dcf.format(total):0} </h3> <a class="mx-3 btn btn-primary" href="order.jsp">Check Out</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price </th>
					
				</tr>
			</thead>
			<tbody>
				<%
				if (cartProduct != null) {
					for (Cart item : cartProduct) {
                                        products p =  pDao.searchbyId(item.getProductId());
				%>
				<tr>
					<td><%=p.getName() %></td>
					<td><%=p.getCategory()%></td>
					<td><%= deciForm.format(p.getCP())%></td>
					<td>
						<form action="order" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%=p.getProductId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								
								<input type="text" name="quantity" class="form-control"  value="<%=item.getQuantity()%>" readonly> 
								
							</div>
							
						</form>
					</td>
					<td><a href="#?id=<%=p.getProductId()%>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}}%>
			</tbody>
		</table>
	</div>
                        
	
</body>
<jsp:include page="../view/footer.jsp" /> 
