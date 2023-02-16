<%-- 
    Document   : nav
    Created on : 26 Jan, 2023, 2:49:36 PM
    Author     : hkhat
--%>

<%@page import="DTO.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Top Nav Bar with logo-->
<nav class="navbar-light bg-light">
    <a class="navbar-brand logo" style="padding-left: 45%; font-size: 45px;" href="#">Odziez</a>
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
        <%
            user u = (user) session.getAttribute("user");
            if (u == null) 
            {
        %>
        <ul class="nav navbar-nav navbar-right  ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="../view/LoginNdRegister.jsp" ><span class="glyphicon glyphicon-log-in"></span>Login</a>
            </li>
            <li class="nav-item">
                <span class="glyphicon glyphicon-user" style="color:black"></span><a class="nav-link" href="../view/LoginNdRegister.jsp">Sign Up</a>
            </li>
        </ul>
        <%} else
        {
        %>
        <ul class="nav navbar-nav navbar-right  ml-auto" style="padding-right: 20px;">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
                    </svg>
                    <%
                   out.print("Hi, " + u.getFirstName()); 
                    %>
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="../view/userProfile.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                        <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
                        </svg>
                        Profile
                    </a>
                    <a class="dropdown-item" href="#">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
                        <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                        </svg>
                        Orders
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="../controller/index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16" >
                        <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
                        <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5zM4 1.934V15h6V1.077l-6 .857z"/>
                        </svg>
                        <a href="../model/Logout.jsp">Logout</a>
                    </a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../view/LoginNdRegister.jsp" >
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                    <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                    </svg>
                    Cart
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../view/LoginNdRegister.jsp" >
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16">
                    <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
                    </svg>
                    Favourites</a>
            </li>
        </ul>
        <%
            }
        %>


    </div>
</nav>


