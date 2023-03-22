<%-- 
    Document   : order
    Created on : 28-Feb-2023, 00:32:54
    Author     : Dell
--%>

<%@page import="DAO.UserDao"%>
<%@page import="DTO.products"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Cart"%>
<%@page import="DTO.user"%>
<%@page import="DAO.ProductsDao"%>
<%@page import="DAO.CartDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<%UserDao udao = new UserDao("clothes_shop");%>
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
	


    
        <section>
            
        <div class="container py-5 h-100" style="color:black">
            <div class="">
                <div class="">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row">
                            <div class="col-md-6 col-lg-6 ">
                                <div class="card-body  text-black">
 <%
                                double total = 0;
                                %>

	
	<div class="container my-3">
		
		<table class="table table-sm" style="background-color:black;">
			<thead>
				<tr style="color:white;">
					<th scope="col">Item</th>
				
					<th scope="col">Price </th>
                                        
                                        <th scope="col">Quantity </th>
					
				</tr>
			</thead>
			<tbody>
                           
				<%
				if (cartProduct != null) {
					for (Cart item : cartProduct) {
                                        products p =  pDao.searchbyId(item.getProductId());
                                        total += p.getCP() * item.getQuantity();
				%>
				<tr style="color:white;">
                                    
					<td><%=p.getName() %></td>
					
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
                                            <input type="hidden" name="id" value="<%=p.getProductId()%>" class="form-input">
                                               
                                               <input style="margin-left: 10px;width:80%;background-color: white;color:black"  class="btn btn-sm btn-primary" type="submit" name="action" value="Remove">
                                            </form>
                                        </td>
				</tr>
                                
				<%
				}}%>
                                <div class="d-flex py-3"><h3 >Total Price: € <%=deciForm.format(total)%></h3></div>
			</tbody>
		</table>
	</div>
                        
                                </div> 
                            </div>
                        
        <form action="../Controller?userId=<%=u.getUserId() %>" method="post">
             <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Address Details</h5>
  <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">First Name:</label>
  <input type="text"  name="firstname" required id="form2Example17"   class="form-control form-control-lg"><br>
  </div>
  <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">Last Name:</label>
  <input type="text"  name="lastname" required id="form2Example17"   class="form-control form-control-lg"><br>
  </div>
  <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">Email:</label>
  <input type="text"  name="email" required id="form2Example17"   class="form-control form-control-lg"><br>
  </div>

  <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">Address Line 1:</label>
  <input type="text"  name="address1" required id="form2Example17"   class="form-control form-control-lg"><br>
  </div>


  <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">Address Line 2:</label>
  <input type="text"  name="address2" required id="form2Example17"   class="form-control form-control-lg"><br>
  </div>
                               
  <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">Country:</label>
  <input type="text"  name="country" required id="form2Example17"   class="form-control form-control-lg"><br>
  </div>

  <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">State/County:</label>
  <input type="text"  name="state" required id="form2Example17"   class="form-control form-control-lg"><br>
  </div>


 <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">Postal/Zip:</label>
  <input type="text"  name="zipcode" required id="form2Example17"   class="form-control form-control-lg"><br>
  </div>
            
             <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Card Details</h5>

  <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">Card Number:</label>
  <input type="text"  name="cardNumber" required id="form2Example17"   class="form-control form-control-lg"><br>
  </div>


  <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">Expiry Date:</label>
  <input type="text"  name="expiry" required id="form2Example17"  placeholder="MM/YYYY" class="form-control form-control-lg"><br>
  </div>

  <div class="form-outline mb-4">
                 <label class="form-label" for="form2Example17">CVV:</label>
  <input type="text"  name="cvv" required id="form2Example17"  placeholder="3 Digits" class="form-control form-control-lg"><br>
  </div>

  <div class="pt-1 mb-4">
      <input type="hidden" name="total" value="<%=deciForm.format(total) %>">
      
   <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="order">
  </div>
</form>
                                    
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </body>

<jsp:include page="../view/footer.jsp" /> 