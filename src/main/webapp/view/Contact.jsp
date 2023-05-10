<%@page import="DTO.user"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<jsp:include page="../model/header.jsp" /> 

<jsp:include page="../view/nav.jsp" /> 
<!DOCTYPE html>
<html>
<head>
    <style>
        /* Center the form */
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Increase the size of the message input */
        .form-control-lg {
            height: 150px;
        }
    </style>
</head>
<body>
    <section>
        <!-- Form for Login -->
        <div class="form-container">
            <div class="col-md-5 col-lg-5">
                <div class="card-body text-black">
                    <form action="../Controller" method="post">
                        <input style="display:none">
                        <input type="password" style="display:none">
                        <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 0px;">Contact Us</h3>

                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example17">Username</label>
                            
                            <textarea id="form2Example17" name="username" placeholder="Enter Username" class="form-control form-control-lg"></textarea>
                        </div><!-- comment -->

                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example27">Message</label>
                            <input type="text" id="form2Example17" name="message" placeholder="Lets Hear From You" class="form-control form-control-lg" />
                        </div>

                        <div class="pt-1 mb-4">
                            <input class="btn btn-dark btn-lg btn-block" type="submit" name="action" value="Send">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
<jsp:include page="../view/footer.jsp" /> 