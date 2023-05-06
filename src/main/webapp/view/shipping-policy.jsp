<%-- 
    Document   : shipping-policy
    Created on : 6 May, 2023, 2:23:25 PM
    Author     : hkhat
--%>

<%@page import="java.util.List"%>
<%@page import="DAO.AddressDao"%>
<%@page import="DTO.user"%>
<%@page import="DTO.address"%>
<%@page import="DAO.AddressDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="../model/header.jsp" /> 
<jsp:include page="../view/nav.jsp" /> 
<p class="text-center" style="font-size: 13px; color:whitesmoke; padding-top: 50px">Odziez.com/profile/shipping-policy</p>

<div class="container" style="background-color: white; color: black; padding:10px 50px 50px 50px; border: 10px solid white; border-radius: 1%;">
    <div class="row">
        <div class="col-md-8">
            <h1 class="mt-5 text-center">SHIPPING POLICY</h1>
            <div class="mt-5">
                <h3><strong>How soon will I receive my package after my order is placed?</strong></h3>
                <p>There are two key factors that will decide when you will receive your package.</p>
                <h4><strong>1. Item Processing Time:</strong></h4>
                <p>The processing time is the time it takes for the seller to prepare the item(s) for shipment. There are different processing times for different items depending on product category. Usually, it is around 1 to 2 working days to process.<span>98% of the goods are in stock, ready to ship within 24 hours.</span></p>
                <p ><img src="https://cdn.shopify.com/s/files/1/0599/7091/2440/files/Dingtalk_20211007140903_480x480.jpg?v=1633587025" alt=""></p>
                <h4><strong>2. Shipping Method:</strong></h4>
                <p>Delivery time varies with the shipping method.</p>
                <p>Time in transit varies depending on where you're located and where your package is coming from. You can also check the follow form for more detail about the delivery time:</p>
                <p><strong>Delivery Time:</strong><br>Total time = Processing time(1-2 Business Days) + Transit time<br><br><em>*We don't provide expedited shipping.</em><br><em>*Transit time may vary from country to country, please check the table below.</em></p>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Country / Region</th>
                            <th scope="col">Shipping cost</th>
                            <th scope="col">Transit Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Ireland/UK</td>
                            <td>Free shipping</td>
                            <td>3-5 Business Days</td>
                        </tr>
                    </tbody>
                </table>
                <p><strong>Customs and Import Duties:</strong><br>Your order may be subject to VAT, import duties and/or taxes, which are levied once your package reaches your country. Odziez ships your package DDU, "duties and taxes unpaid", and does not collect the VAT, duties and/or taxes and cannot predict what your particular charges may be. Odziez is not responsible for any fees occurs in transit. If you do incur these additional charges, they must be rendered in order for your package to clear customs. For more information regarding your country's custom policies, please contact your local customs office.<br><br><strong>Return &amp; Exchange</strong><br>Thank you for shopping at Odziez.<br>If you are not entirely satisfied with your purchase, we're here to help. Contact Us.</p>
            </div>

        </div>
        <div class="col-md-4">
            <div class="sticky-top pt-5">
                <h3>Related Links</h3>
                <ul class="list-group">
                    <li class="list-group-item"><a href="../view/shipping-policy.jsp">Shipping Policy</a></li>
                    <li class="list-group-item"><a href="../view/privacy-policy.jsp">Privacy Policy</a></li>
                    <li class="list-group-item"><a href="../view/contactus.jsp">Contact Us</a></li>
                    <li class="list-group-item"><a href="../view/terms-conditions.jsp">Terms and Conditions</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../view/footer.jsp" /> 
