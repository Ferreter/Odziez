/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET;

import DAO.AddressDao;
import DAO.CartDao;
import DAO.OrderDao;
import DAO.OrderDetailsDao;
import DAO.ProductsDao;
import DAO.ProductsDaoInterface;
import DAO.UserDao;
import DTO.Cart;
import DTO.OrderDetails;
import DTO.address;
import DTO.orders;
import DTO.products;
import DTO.review;
import DTO.user;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kian2
 */
@WebServlet(name = "Controller", urlPatterns
        = {
            "/Controller"
        })
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String forwardToJsp = "index.jsp";
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "login":
                    forwardToJsp = LoginPage(request, response);

                    break;
                case "register":
                    forwardToJsp = RegisterPage(request, response);
                    break;
                case "DeleteUser":
                    forwardToJsp = DeleteUser(request, response);
                    break;
                case "EnterReview":
                    forwardToJsp = EnterReview(request, response);
                    break;
                case "SearchProductbyBrand":
                    forwardToJsp = SearchProductbyBrand(request, response);
                    break;
                case "SearchProduct":
                    forwardToJsp = SearchProduct(request, response);
                    break;
                case "addProduct":
                    forwardToJsp = AddProduct(request, response);
                    break;
                case "deleteProduct":
                    forwardToJsp = deleteProduct(request, response);
                    break;
                case "Cart":
                    forwardToJsp = Cart(request, response);
                    break;
                case "DeleteUserProfile":
                    forwardToJsp = DeleteUserProfile(request, response);
                    break;
                case "EditProduct":
                    forwardToJsp = EditProduct(request, response);
                    break;
                case "FilterProduct":
                    forwardToJsp = FilterProduct(request, response);
                    break;
                case "Update":
                    forwardToJsp = ResetPass(request, response);
                    break;
                case "Remove":
                    forwardToJsp = RemoveItem(request, response);
                    break;
                case "order":
                    forwardToJsp = Order(request, response);
                    break;
                case "+":
                    forwardToJsp = Add(request, response);
                    break;
                case "-":
                    forwardToJsp = Del(request, response);
                    break;
                case "Edit":
                    forwardToJsp = editUserProfile(request, response);
                    break;
                case "updateStatus":
                    forwardToJsp = updateStatus(request, response);
                    break;
                case "Update Address":
                    forwardToJsp = ResetAddress(request, response);
                    break;

            }

            response.sendRedirect(forwardToJsp);
        }
    }

    /**
     *
     * This method processes the login request sent by the user. It receives a
     * HttpServletRequest object and a HttpServletResponse object as parameters,
     * and returns a String representing the name of the JSP page to forward to.
     * It retrieves the username and password parameters from the request, and
     * uses them to check if a user with those credentials exists in the
     * database. If the user is found, the method sets the "username" and "user"
     * attributes in the session, and forwards to the "index.jsp" page. If the
     * user is not found, the method sets an error message in the session, and
     * forwards to the "error.jsp" page. If the username and/or password
     * parameters are not supplied, the method sets an error message in the
     * session, and forwards to the "error.jsp" page.
     *
     * @param request the HttpServletRequest object containing the parameters
     * sent by the user
     * @param response the HttpServletResponse object containing the response
     * that will be sent to the user
     * @return a String representing the name of the JSP page to forward to
     */
    private String LoginPage(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "index.jsp";
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserByUsernamePassword(username, password);

            if (u == null) {
                //Direct to error page when wrong credentials are provided
                forwardToJsp = "view/LoginNdRegister.jsp";
                String error = "User Not Found. Please try again.";
                session.setAttribute("errorMessages", error);
            } else {
                if (userDao.checkIfUserIsAdmin(username)) {
                    forwardToJsp = "controller/index.jsp";
                    session.setAttribute("username", username);
                    session.setAttribute("user", u);
                } else {
                    forwardToJsp = "controller/index.jsp";
                    session.setAttribute("username", username);
                    session.setAttribute("user", u);
                }

            }
        } else {
            forwardToJsp = "view/LoginNdRegister.jsp";
            String error = "No username and/or password supplied.";
            session.setAttribute("errorMessages", error);
        }
        return forwardToJsp;
    }

    /**
     * This method is responsible for handling the registration process of a
     * user. It takes in the HTTPServletRequest and HTTPServletResponse objects
     * as parameters, which are used to get the input data from the user and to
     * send the response back to the user after processing their request.
     *
     * @param request the HttpServletRequest object that contains the user's
     * input data
     * @param response the HttpServletResponse object that is used to send the
     * response back to the user
     * @return a String that represents the path of the JSP page to be forwarded
     * to after processing the request
     */
    private String RegisterPage(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        String subscription = request.getParameter("subscription");
        Date date = Date.valueOf(dob);
        boolean isAdmin = false;
        int subscriptionVal = 0;

        if (username != null && password != null && !username.isEmpty() && !password.isEmpty() && firstname != null && lastname != null && !firstname.isEmpty() && !lastname.isEmpty() && email != null && phone != null && !email.isEmpty() && !phone.isEmpty() && dob != null && !dob.isEmpty()) {
            if (subscription != null && subscription.equals("on")) {
                subscriptionVal = 1;
            }
            UserDao userDao = new UserDao("clothes_shop");
            user usernameCheck = userDao.findUserByUsername(username);
            user u = userDao.findUserByEmail(email, username);
            boolean login = false;

            if (u == null && usernameCheck == null) {
                user user = new user(0, username, password, firstname, lastname, email, phone, question, answer, date, isAdmin, subscriptionVal);
                session.setAttribute("username", username);
                session.setAttribute("user", user);

                login = userDao.addUser(user);
                forwardToJsp = "controller/index.jsp";
            } else {
                forwardToJsp = "controller/error.jsp";
                String error = "user already exists <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            }
        } else {
            forwardToJsp = "controller/error.jsp";
            String error = "No username and/or password and/or email and/or phone and/or firstname and/or lastname supplied. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }

        return forwardToJsp;
    }

    /**
     *
     * This function handles the reset password functionality, and it's
     * triggered when the user submits the reset password form. It takes in a
     * HttpServletRequest object, and a HttpServletResponse object as
     * parameters, and returns a String value of the JSP page to be forwarded
     * to. It retrieves the username parameter from the request object and
     * validates it. If the username is valid and exists in the user database,
     * it retrieves the user's password from the database, and updates it with a
     * new random password. The new password is then stored in the user's
     * session object, and the user is redirected to the login page to log in
     * with the new password. If the username is not valid or does not exist in
     * the database, an error message is stored in the session object, and the
     * user is redirected to an error page. If the username parameter is not
     * provided, an error message is stored in the session object, and the user
     * is redirected to an error page.
     *
     * @param request the HttpServletRequest object that contains the user's
     * request information
     * @param response the HttpServletResponse object that contains the response
     * that will be sent to the user
     * @return a String value of the JSP page to be forwarded to.
     */
    private String ResetPass(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "#";
        HttpSession session = request.getSession(true);

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");

        if (username != null && password != null && question != null && answer != null && !username.isEmpty() && !password.isEmpty() && !question.isEmpty() && !answer.isEmpty()) {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserDetails(username, question, answer);
            boolean Reset = false;
            boolean update = false;

            if (u != null) {

                session.setAttribute("password", password);

                update = userDao.updatePass(u, password);

                forwardToJsp = "view/LoginNdRegister.jsp";
            } else {
                forwardToJsp = "controller/error.jsp";
                String error = "NO User Found <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            }
        } else {
            forwardToJsp = "controller/error.jsp";
            String error = "No username and/or password and/or question and/or answer supplied. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }

    private String ResetAddress(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "#";
        HttpSession session = request.getSession(true);

        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String address3 = request.getParameter("address3");
        String city = request.getParameter("city");
        String county = request.getParameter("county");
        String country = request.getParameter("country");
        String pincode = request.getParameter("pincode");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (address1 != null && city != null && !address1.isEmpty() && !address2.isEmpty() && !address3.isEmpty() && !city.isEmpty() && password != null && !password.isEmpty()) {
            UserDao userDao = new UserDao("clothes_shop");
            AddressDao addressDao = new AddressDao("clothes_shop");
            user u = (user) session.getAttribute("user");
            address add = addressDao.AddressByUserId(u.getUserId());
            session.setAttribute("address", add);
            address a = (address) session.getAttribute("address");

            boolean passwordMatch = userDao.confirmUserByUsernamePassword(username, password);
            if (add != null && !passwordMatch) {

                boolean update = addressDao.editAddress(a, address1, address2, address3, city, county, country, pincode);

                forwardToJsp = "view/userProfile.jsp";
            } else {
                forwardToJsp = "controller/error.jsp";
                String error = "NO Address found<a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            }
        } else {
            forwardToJsp = "controller/error.jsp";
            String error = "Failed to retrieve address. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }

    /**
     *
     * This method handles the search of a product by name.
     *
     * @param request the request object containing the search parameter
     *
     * @param response the response object to be returned
     *
     * @return a String representing the path to the jsp page to forward to
     */
    private String SearchProduct(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        String product = request.getParameter("product");

        if (product != null && !product.isEmpty()) {
            ProductsDao pdao = new ProductsDao("clothes_shop");
            ProductsDaoInterface productdao = new ProductsDao("clothes_shop");
            List<products> p = productdao.searchbyname(product);

            boolean login = false;

            if (p != null) {
                session.setAttribute("products", p);

                forwardToJsp = "view/productsView.jsp";
            } else {
                forwardToJsp = "view/productsView.jsp";
                String error = "No Products by that name";
                session.setAttribute("errorMessage", error);
            }
        } else {
            forwardToJsp = "view/productsView.jsp";
            String error = "No Product Namesupplied. Please <a href=\"individualProduct.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }

    private String SearchProductbyBrand(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        String product = request.getParameter("product");

        if (product != null && !product.isEmpty()) {
            ProductsDao pdao = new ProductsDao("clothes_shop");
            ProductsDaoInterface productdao = new ProductsDao("clothes_shop");
            List<products> p = productdao.searchbybrand(product);

            boolean login = false;

            if (p != null) {
                session.setAttribute("products", p);

                forwardToJsp = "view/productsView.jsp";
            } else {
                forwardToJsp = "view/productsView.jsp";
                String error = "No Products by that Brand";
                session.setAttribute("errorMessage", error);
            }
        } else {
            forwardToJsp = "view/productsView.jsp";
            String error = "No Product Namesupplied. Please <a href=\"individualProduct.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }

    private String Reset(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");

        if (username != null && !username.isEmpty()) {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserByUsername(username);

            if (u == null) {
                //Direct to error page when wrong credentials are provided
                forwardToJsp = "controller/error.jsp";
                String error = "User Not Found. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            } else {
                if (userDao.checkIfUserIsAdmin(username)) {
                    forwardToJsp = "controller/error.jsp";
                    String error = "Admins Can't Reset their password this way, Contact the other admins ";
                    session.setAttribute("errorMessage", error);
                } else {
                    forwardToJsp = "view/Link.jsp";
                    session.setAttribute("username", username);

                }

            }
        } else {
            forwardToJsp = "controller/error.jsp";
            String error = "No username and/or password supplied. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }

    private String Cart(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "#";
        HttpSession session = request.getSession(true);

        String id = request.getParameter("id");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        if (id != null && !id.isEmpty()) {
            ProductsDao pdao = new ProductsDao("clothes_shop");
            products p = pdao.searchbyId(id);

            CartDao cartdao = new CartDao("clothes_shop");
            user u = (user) session.getAttribute("user");

            if (p != null) {
                boolean exist = false;
                ArrayList<Cart> cartList = new ArrayList<>();
                Cart cm = new Cart();
                cm.setUserId(u.getUserId());
                cm.setProductId(id);
                cm.setQuantity(quantity);
                cm.setPrice(p.getCP());

                ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
                if (cart_list == null) {
                    cartList.add(cm);
                    boolean added = cartdao.addCart(cm);
                    session.setAttribute("cart-list", cartList);

                    forwardToJsp = "view/productsView.jsp";

                } else {
                    cartList = cart_list;

                    for (Cart c : cart_list) {
                        if (c.getProductId().equals(id)) {
                            exist = true;
                            forwardToJsp = "view/cart.jsp";

                        }
                    }

                    if (!exist) {
                        cartList.add(cm);
                        boolean added = cartdao.addCart(cm);
                        forwardToJsp = "view/productsView.jsp";
                    }
                }

            }

        }
        return forwardToJsp;
    }

    private String EnterReview(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        String ratingstring = request.getParameter("rating");
        String review = request.getParameter("review");
        ProductsDao pdao = new ProductsDao("clothes_shop");
        ProductsDaoInterface productdao = new ProductsDao("clothes_shop");

        List<String> profanityList = Arrays.asList("fuck", "shit", "doodoo");

        int rating = Integer.parseInt(ratingstring);
        user u = (user) session.getAttribute("user");

        if (review != null && !review.isEmpty()) {
            if (u == null) {
                forwardToJsp = "controller/error.jsp";
                String error = "Not Logged in please sign up to Review. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            } else {

                long millis = System.currentTimeMillis();
                java.sql.Date date = new java.sql.Date(millis);
                products p = (products) session.getAttribute("product");

                // Censor profanity
                for (String word : profanityList) {
                    review = review.replaceAll("(?i)" + word, "****");
                }

                review r = new review(0, p.getProductId(), u.getUserId(), rating, review, date);
                boolean entered = productdao.insertReview(r);

                if (entered == true) {
                    forwardToJsp = "/Oziz/view/individualProduct.jsp?ID=" + p.getProductId();
                } else {
                    forwardToJsp = "controller/error.jsp";
                    String error = "No rating and/or review supplied. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
                    session.setAttribute("errorMessage", error);
                }
            }

        } else {
            forwardToJsp = "controller/error.jsp";
            String error = "No rating and/or review supplied. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }

        return forwardToJsp;
    }

    /**
     *
     * This method handles the request for deleting a user from the database
     *
     * @param request The HTTP request from the client
     *
     * @param response The HTTP response to send back to the client
     *
     * @return A string representing the JSP file to forward to after the
     * request is processed
     */
    private String DeleteUser(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "view/userAdmin.jsp";
        HttpSession session = request.getSession(true);
        String username = request.getParameter("userN");

        boolean isAdmin = false;
        if (username != null && !username.isEmpty()) {
            UserDao userDao = new UserDao("clothes_shop");
            boolean removed = userDao.removeUser(username);

            if (removed == true) {

                forwardToJsp = "view/userAdmin.jsp";
                String success = "Action Successful, User " + username + " has been removed";
                session.setAttribute("successMessage", success);

            } else {
                forwardToJsp = "view/userAdmin.jsp";
                String error = "User doesnt exists: " + username;
                session.setAttribute("errorMessages", error);
            }
        } else {
            forwardToJsp = "view/userAdmin.jsp";
            String error = "Not enough details provided";
            session.setAttribute("errorMessages", error);
        }
        return forwardToJsp;
    }

    private String DeleteUserProfile(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        user u = (user) session.getAttribute("user");
        String username = request.getParameter("userN");
        if (u != null) {
            UserDao userDao = new UserDao("clothes_shop");
            boolean removed = userDao.deleteUserProfile(u);

            if (removed == true) {
                forwardToJsp = "model/Logout.jsp";
            } else {
                forwardToJsp = "controller/error.jsp";
                String error = "Could Not delete the user, Try contacting an admin ";
                session.setAttribute("errorMessage", error);
            }
        } else {
            forwardToJsp = "controller/error.jsp";
            String error = "No username and/or password and/or email and/or phone and/or firstname and/or lastname supplied. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }

    private String AddProduct(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/error.jsp";
        HttpSession session = request.getSession(true);

        ProductsDao pdao = new ProductsDao("clothes_shop");
        ProductsDaoInterface productdao = new ProductsDao("clothes_shop");

        String ProductId = request.getParameter("ProductId");
        String Name = request.getParameter("Name");
        String MRP = request.getParameter("MRP");
        String CP = request.getParameter("CP");
        String Description = request.getParameter("Description");
        String Category = request.getParameter("Category");
        String Tags = request.getParameter("Tags");
        String Brand = request.getParameter("Brand");

        if (ProductId != null && !ProductId.isEmpty() && Name != null && !Name.isEmpty() && MRP != null && !MRP.isEmpty() && CP != null && !CP.isEmpty() && Description != null && !Description.isEmpty() && Category != null && !Category.isEmpty() && Brand != null && !Brand.isEmpty() && Tags != null && !Tags.isEmpty()) {
            double mrp = Double.valueOf(MRP);
            double cp = Double.valueOf(CP);

            products p = new products(ProductId, Name, mrp, cp, Description, Category, Tags, "", Brand);
            boolean entered = productdao.AddProduct(p);

            if (entered == true) {
                forwardToJsp = "view/productAdmin.jsp";
            } else {
                forwardToJsp = "controller/error.jsp";
                String error = "Not enough info supplied. Please <a href=\"../view/productAdmin.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            }

        } else {
            forwardToJsp = "controller/error.jsp";
            String error = "Not enough info supplied. Please <a href=\"../view/productAdmin.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }

        return forwardToJsp;

    }

    private String RemoveItem(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);

        String id = request.getParameter("id");
        CartDao cartdao = new CartDao("clothes_shop");
        cartdao.deleteCartItem(id);

        forwardToJsp = "view/cart.jsp";

        return forwardToJsp;
    }

    private String Order(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        user u = (user) session.getAttribute("user");
        int userId = Integer.parseInt(request.getParameter("userId"));

        String exAdd = request.getParameter("exAdd");
        String newAdd = request.getParameter("newAdd");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String address3 = request.getParameter("address3");
        String city = request.getParameter("city");
        String county = request.getParameter("county");
        String country = request.getParameter("country");
        String pincode = request.getParameter("pincode");
        String cardNumber = request.getParameter("cardNumber");
        String expiry = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");
        double total = Double.parseDouble(request.getParameter("total"));

        //ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
        if (total != 0.0 && cardNumber != null && expiry != null && cvv != null) {

            ProductsDao pdao = new ProductsDao("clothes_shop");
            products p = new products();
            address add = new address();
            AddressDao addressDao = new AddressDao("clothes_shop");
            OrderDao orderDao = new OrderDao("clothes_shop");
            OrderDetailsDao detailsDao = new OrderDetailsDao("clothes_shop");
            CartDao cartdao = new CartDao("clothes_shop");

            boolean addOrder = false;
            boolean addDetails = false;
            boolean addAddress = false;
            if (exAdd != null && exAdd.equals("on")) {

                int id = addressDao.searchbyUserId(userId);

                if (id != 0) {

                    orders order = new orders(0, u.getUserId(), id, total, "Confirmed");

                    addOrder = orderDao.addOrder(order);

                    int orderId = orderDao.getLastIndex();

                    List<Cart> cartItems = cartdao.ListAllCart(userId);

                    //if (cart_list != null) {
                    for (Cart cartItem : cartItems) {
                        products pro = pdao.searchbyId(cartItem.getProductId());
                        String productName = pro.getName();
                        double productPrice = pro.getCP();
                        int quantity = cartItem.getQuantity();

                        OrderDetails orderDet = new OrderDetails(orderId, productName, productPrice, quantity);
                        addDetails = detailsDao.addOrderDetails(orderDet);
                    }

                    cartdao.EmptyCartItem(userId);
                    forwardToJsp = "controller/index.jsp";
                } else {
                    forwardToJsp = "controller/error.jsp";
                    String error = "You do not have an existing address Please <a href=\"../view/order.jsp\">add address.</a>";

                    session.setAttribute("errorMessage", error);
                }
            } else if (newAdd != null && newAdd.equals("on")) {

                int addressId = addressDao.getLastIndex() + 1;

                address newAddress = new address(addressId, u.getUserId(), address1, address2, address3, city, county, country, pincode);

                addAddress = addressDao.addNewAddress(newAddress);

                int id2 = addressDao.searchbyUserId(userId);
                orders order2 = new orders(0, u.getUserId(), addressId, total, "Confirmed");

                addOrder = orderDao.addOrder(order2);

                int orderId2 = orderDao.getLastIndex();

                List<Cart> cartItems2 = cartdao.ListAllCart(userId);

                //if (cart_list != null) {
                for (Cart cartItem : cartItems2) {
                    products pro = pdao.searchbyId(cartItem.getProductId());
                    String productName = pro.getName();
                    double productPrice = pro.getCP();
                    int quantity = cartItem.getQuantity();

                    OrderDetails orderDet = new OrderDetails(orderId2, productName, productPrice, quantity);
                    addDetails = detailsDao.addOrderDetails(orderDet);
                }
                cartdao.EmptyCartItem(userId);
                forwardToJsp = "controller/index.jsp";
            }
        } else {
            forwardToJsp = "view/error.jsp";
            String error = "No product in cart supplied. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }

        return forwardToJsp;
    }

    private String deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/error.jsp";
        HttpSession session = request.getSession(true);

        String ProductId = request.getParameter("ProductId");
        if (ProductId != null) {
            ProductsDao pdao = new ProductsDao("clothes_shop");
            ProductsDaoInterface productdao = new ProductsDao("clothes_shop");

            products prod = productdao.searchbyId(ProductId);

            boolean removed = productdao.DeleteProduct(prod);

            if (removed == true) {
                forwardToJsp = "view/productAdmin.jsp";
                String success = "Action Successful, Product has been removed";
                session.setAttribute("successMessage", success);
            } else {
                forwardToJsp = "view/productAdmin.jsp";
                String error = "Could Not delete the product, Try again ";
                session.setAttribute("errorMessages", error);
            }
        } else {
            forwardToJsp = "view/productAdmin.jsp";
            String error = "No productId supplied";
            session.setAttribute("errorMessages", error);
        }
        return forwardToJsp;
    }

    private String Add(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);

        String id = request.getParameter("id");
        CartDao cartdao = new CartDao("clothes_shop");
        cartdao.AddQuantity(id);

        forwardToJsp = "view/cart.jsp";

        return forwardToJsp;
    }

    private String Del(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        user u = (user) session.getAttribute("user");
        String id = request.getParameter("id");
        CartDao cartdao = new CartDao("clothes_shop");
        List<Cart> c = cartdao.ListAllCart(u.getUserId());
        for (Cart cartItem : c) {
            if (cartItem.getProductId().equals(id)) {
                if (cartItem.getQuantity() == 1) {
                    cartdao.deleteCartItem(id);
                } else {
                    cartdao.DelQuantity(id);
                }
            }
        }

        forwardToJsp = "view/cart.jsp";

        return forwardToJsp;
    }

    private String EditProduct(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/error.jsp";
        HttpSession session = request.getSession(true);

        ProductsDao pdao = new ProductsDao("clothes_shop");
        ProductsDaoInterface productdao = new ProductsDao("clothes_shop");

        String ProductId = request.getParameter("ProductId");
        String Name = request.getParameter("Name");
        String MRP = request.getParameter("MRP");
        String CP = request.getParameter("CP");
        String Description = request.getParameter("Description");
        String Category = request.getParameter("Category");
        String Tags = request.getParameter("Tags");
        String Brand = request.getParameter("Brand");

        if (ProductId != null && !ProductId.isEmpty() && Name != null && !Name.isEmpty() && MRP != null && !MRP.isEmpty() && CP != null && !CP.isEmpty() && Description != null && !Description.isEmpty() && Category != null && !Category.isEmpty() && Brand != null && !Brand.isEmpty() && Tags != null && !Tags.isEmpty()) {
            double mrp = Double.valueOf(MRP);
            double cp = Double.valueOf(CP);

            products p = new products(ProductId, Name, mrp, cp, Description, Category, Tags, "", Brand);
            boolean entered = productdao.EditProduct(p);

            if (entered == true) {
                forwardToJsp = "view/productAdmin.jsp";
            } else {
                forwardToJsp = "controller/error.jsp";
                String error = "Not enough info supplied. Please <a href=\"../view/productAdmin.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            }

        } else {
            forwardToJsp = "controller/error.jsp";
            String error = "Not enough info supplied. Please <a href=\"../view/productAdmin.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }

        return forwardToJsp;

    }

    private String FilterProduct(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        String forwardToJsp = "controller/error.jsp";
        String Style = request.getParameter("Style");
        String NeckLine = request.getParameter("NeckLine");
        String Material = request.getParameter("Material");
        String Fit = request.getParameter("Fit");
        String Length = request.getParameter("Length");
        String Occasion = request.getParameter("Occasion");
        String Printed = request.getParameter("Printed");
        String Color = request.getParameter("Color");

        ProductsDao pdao = new ProductsDao("clothes_shop");
        ProductsDaoInterface productdao = new ProductsDao("clothes_shop");

        List<products> p = productdao.searchByFilters(Style, NeckLine, Material, Fit, Length, Occasion, Printed, Color);

        boolean login = false;

        if (p != null) {
            session.setAttribute("products", p);

            forwardToJsp = "view/productsView.jsp";
        } else {
            forwardToJsp = "view/productsView.jsp";
            String error = "No Products by that name";
            session.setAttribute("errorMessage", error);
        }

        return forwardToJsp;

    }

    private String editUserProfile(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "#";
        HttpSession session = request.getSession(true);

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Date date = Date.valueOf(dob);

        if (firstname != null && lastname != null && !firstname.isEmpty() && !lastname.isEmpty() && email != null && phone != null && !email.isEmpty() && !phone.isEmpty() && dob != null && !dob.isEmpty()) {
            UserDao userDao = new UserDao("clothes_shop");
            user u = (user) session.getAttribute("user");
            forwardToJsp = "view/EditAuth.jsp";

            // Verify password
            boolean passwordMatch = userDao.confirmUserByUsernamePassword(username, password);

            if (!passwordMatch) {
                // Password is incorrect
                forwardToJsp = "controller/error.jsp";
                String error = "Incorrect username or password.";
                session.setAttribute("errorMessage", error);
            } else {
                boolean edit = userDao.editProfile(u, firstname, lastname, email, phone, date);
                if (edit) {
                    // User was successfully updated
                    session.invalidate(); // Log user out
                    forwardToJsp = "view/LoginNdRegister.jsp?logout=true"; // Redirect to login page with logout parameter
                } else {
                    // Error occurred while updating user
                    forwardToJsp = "controller/error.jsp";
                    String error = "An error occurred while updating your profile. Please try again.";
                    session.setAttribute("errorMessage", error);
                }
            }
        } else {
            // Missing or invalid parameters
            forwardToJsp = "controller/error.jsp";
            String error = "Please fill in all fields.";
            session.setAttribute("errorMessage", error);
        }

        return forwardToJsp;
    }

    private String updateStatus(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        OrderDao orderDao = new OrderDao("clothes_shop");

        String Id = request.getParameter("OrderId");
        int OrderId = Integer.valueOf(Id);
        String Change = request.getParameter("Changed");

        orderDao.ChangeStatus(OrderId, Change);

        forwardToJsp = "view/viewOrderAdmin.jsp";

        return forwardToJsp;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
