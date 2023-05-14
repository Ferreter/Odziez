<%-- 
    Document   : accessibility
    Created on : 6 May, 2023, 3:23:37 PM
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
            <h1 class="mt-5 text-center">Accessibility Statement</h1>
            <div class="mt-5">
                <p>Odziez.com is committed to providing a website a that are accessible to the widest possible audience, regardless of technology or ability. We are actively working to increase the accessibility and usability of our website and mobile apps, and in doing so aim to adhere to the available standards and guidelines.</p>
                <h4><strong>Web Accessibility Initiative</strong></h4>
                <p>We endeavour for our website and mobile apps to conform to level AA of the World Wide Web Consortium (W3C) Web Content Accessibility Guidelines 2.1.</p>
                <h4><strong>Further Steps</strong></h4>
                <p>Below are a list of further actions we are taking to accomplish an accessible digital offering:</p>
                <ul>
                    <li>We strive to consider accessibility from the start when developing new products and services, ensuring accessibility is embedded in a sustainable way.</li>
                    <li>We understand that accessibility is an ever-evolving field and we are committed to providing training for our staff to reflect that.</li>
                    <li>We aim to ensure accessibility is considered when procuring third-party services.</li>
                    <li>We view accessibility as an ongoing effort due to the constantly evolving nature of digital accessibility and usability considerations, as well as the changing needs of our customers.</li>
                </ul>
                <h4><strong>Exceptions</strong></h4>
                <p>Please contact us if you have any issues accessing this website, or if you have any feedback or suggestions on how we can make our products more accessible and user-friendly.</p>
            </div>

        </div>
        <div class="col-md-4">
            <div class="sticky-top pt-5">
                <h3>Related Links</h3>
                <ul class="list-group">
                    <li class="list-group-item"><a href="../view/shipping-policy.jsp">Shipping Policy</a></li>
                    <li class="list-group-item"><a href="../view/privacy-policy.jsp">Privacy Policy</a></li>
                    <li class="list-group-item"><a href="../view/Contact.jsp">Contact Us</a></li>
                    <li class="list-group-item"><a href="../view/terms-conditions.jsp">Terms and Conditions</a></li>
                    <li class="list-group-item"><a href="../view/accessibility.jsp">Accessibility</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>



<jsp:include page="../view/footer.jsp" /> 
