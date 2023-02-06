<%-- 
    Document   : nav
    Created on : 26 Jan, 2023, 2:49:36 PM
    Author     : hkhat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Top Nav Bar with logo-->
<nav class="navbar-light bg-light">
    <a class="navbar-brand logo" style="padding-left: 45%; f" href="#">Odzież</a>
</div>


</nav>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav navbar-left">
            <li class="nav-item active">
                <a class="nav-link" href="../controller/index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Inspiration</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">News Letter</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Men's 
                </a>
                <div class="dropdown-menu" style="width:600px" aria-labelledby="navbarDropdownMenuLink">
                    <div class="container">
                        <div class="row">
                            <div class="col-4">
                                <p style="padding-top:4px;padding-bottom: 2px;margin:0px;">New Arrivals</p>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">View All</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Clothes</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Shoes & Accesories</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Sports</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Hand Picked</a>

                                <p style="padding-top:8px;padding-bottom: 2px;margin:0px;">Get Comfortable</p>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">View All</a>

                                <p style="padding-top:8px;padding-bottom: 2px;margin:0px;">Logbook</p>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Casual Looks</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Street Looks</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Smart Looks</a>
                            </div>
                            <div class="col-4">
                                <p style="padding-top:4px;padding-bottom: 2px;margin:0px;">New Arrivals</p>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">View All</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Clothes</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Shoes & Accesories</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Sports</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Hand Picked</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">View All</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Clothes</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Shoes & Accesories</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Sports</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Hand Picked</a>


                            </div>


                            <div class="col-4">
                                                                 <p style="padding-top:4px;padding-bottom: 2px;margin:0px;">New Arrivals</p>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">View All</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Clothes</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Shoes & Accesories</a>

                                <p style="padding-top:8px;padding-bottom: 2px;margin:0px;">Get Comfortable</p>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">View All</a>
                                 <a class="nav-link navDropSection" style="font-size:14px;" href="#">Casual Looks</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Street Looks</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Smart Looks</a>

                                <p style="padding-top:8px;padding-bottom: 2px;margin:0px;">Logbook</p>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Casual Looks</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Street Looks</a>
                                <a class="nav-link navDropSection" style="font-size:14px;" href="#">Smart Looks</a>
                                 </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <!-- Replace this with JSP which is seprate if logged IN or not -->

        <jsp:include page="loginInNav.jsp" /> 

    </div>
</nav>


