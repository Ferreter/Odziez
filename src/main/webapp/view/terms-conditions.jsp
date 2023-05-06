<%-- 
    Document   : terms-conditions
    Created on : 6 May, 2023, 3:09:07 PM
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
            <h1 class="mt-5 text-center">TERMS AND CONDITIONS</h1>
            <div class="mt-5">
                <h3><strong>Introduction</strong></h3>
                <p>Welcome to our clothing website. By using our website, you agree to these terms and conditions. If you do not agree to these terms, please do not use our website.</p>

                <h4><strong>Use of Website</strong></h4>
                <p>You may use our website only for lawful purposes and in accordance with these terms and conditions. You may not use our website: (i) in any way that violates any applicable federal, state, local or international law or regulation, (ii) for the purpose of exploiting, harming or attempting to exploit or harm minors in any way by exposing them to inappropriate content, asking for personally identifiable information or otherwise, or (iii) to transmit, or procure the sending of, any advertising or promotional material without our prior written consent.</p>

                <h4><strong>Intellectual Property</strong></h4>
                <p>The content on our website, including but not limited to text, graphics, images, logos, and software, is the property of our company or its content suppliers and is protected by United States and international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.</p>

                <h4><strong>Product Availability and Pricing</strong></h4>
                <p>Product availability and pricing on our website are subject to change without notice. We reserve the right to modify or discontinue any product or service without notice. We shall not be liable to you or to any third-party for any modification, price change, suspension, or discontinuance of the product or service.</p>

                <h4><strong>Disclaimer of Warranties; Limitation of Liability</strong></h4>
                <p>We do not guarantee, represent, or warrant that your use of our website will be uninterrupted, timely, secure or error-free. We make no warranty that the quality of any products, services, information, or other material purchased or obtained by you will meet your expectations. In no event shall our company, its affiliates, officers, directors, employees, agents, suppliers or licensors be liable for any direct, indirect, punitive, incidental, special, or consequential damages arising out of or in any way connected with the use of our website or the purchase or use of any products or services offered on our website, whether based on contract, tort, strict liability, or otherwise, even if our company has been advised of the possibility of damages.</p>

                <h4><strong>Indemnification</strong></h4>
                <p>You agree to defend, indemnify and hold harmless our company, its affiliates, officers, directors, employees, agents, suppliers, and licensors from and against any claims, liabilities, damages, judgments, awards, losses, costs, expenses or fees (including reasonable attorneys' fees) arising out of or relating to your violation of these terms and conditions or your use of our website.</p>

                <h4><strong>Changes to Terms and Conditions</strong></h4>
                <p>We may update these terms and conditions from time to time. We will notify you of any changes by posting the new terms and conditions on this
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
                    <li class="list-group-item"><a href="../view/accessibility.jsp">Accessibility</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>



<jsp:include page="../view/footer.jsp" /> 
