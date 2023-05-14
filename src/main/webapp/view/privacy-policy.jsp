<%-- 
    Document   : privacy-policy
    Created on : 6 May, 2023, 2:46:06 PM
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
            <h1 class="mt-5 text-center">PRIVACY POLICY</h1>
            <div class="mt-5">
                <h3><strong>Introduction</strong></h3>
                <p>At our company, we respect and protect the privacy of our customers and visitors to our website. This Privacy Policy explains how we collect and use personal information.</p>
                <h4><strong>Information Collection and Use</strong></h4>
                <p>We collect information that you provide to us when you make a purchase, register for an account, or contact us. This information may include your name, email address, phone number, and payment information. We use this information to process your orders, provide customer service, and improve our website.</p>
                
                <h4><strong>Sharing of Information</strong></h4>
                <p>We may share your personal information with third-party service providers who perform services on our behalf, such as payment processing and shipping. We may also share your information with law enforcement agencies or other organizations if we believe that such disclosure is necessary to comply with applicable laws or regulations.</p>
                <h4><strong>Security</strong></h4>
                <p>We take reasonable measures to protect the security of your personal information. However, no method of transmission over the Internet, or method of electronic storage, is 100% secure. Therefore, we cannot guarantee the absolute security of your information.</p>
                <h4><strong>Changes to this Privacy Policy</strong></h4>
                <p>We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.</p>
                <p>If you have any questions about this Privacy Policy, please contact us.</p>
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
