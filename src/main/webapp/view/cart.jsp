<%-- 
    Document   : cart
    Created on : 24-Feb-2023, 05:28:12
    Author     : Dell
--%>




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

%>


<body>
	

	<div class="container mb-3">
		<div class="d-flex py-3"><h3>Total Price: €${(total>0)?deciForm.format(total):540} </h3>
                    <a class="mx-3 btn btn-primary" style="background-color: white;color: black;" href="../view/order.jsp">Check Out</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
                                        <th scope="col">Size</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
					
				</tr>
			</thead>
                        
                         <tbody>
                            <tr>
                                <td>Drew Oversized T</td>
                                <td>T-Shirts</td>
                                <td>L</td>
                                <td>€100.00</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>FTY Varsity Jacket</td>
                                <td>Hoodies & Jackets</td>
                                <td>XL</td>
                                <td>€170.00</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>Drew Oversized T</td>
                                <td>T-Shirts</td>
                                <td>L</td>
                                <td>€100.00</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>FTY Varsity Jacket</td>
                                <td>Hoodies & Jackets</td>
                                <td>XL</td>
                                <td>€170.00</td>
                                <td>1</td>
                            </tr>
                        </tbody>
			
		</table>
	</div>

	
</body>
<jsp:include page="../view/footer.jsp" /> 
