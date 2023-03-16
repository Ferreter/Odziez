/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET;

import DAO.CartDao;
import DAO.ProductsDao;
import DAO.ProductsDaoInterface;
import DAO.UserDao;
import DTO.Cart;
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
@WebServlet(name = "Controller", urlPatterns =
{
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
        if (action != null)
        {
            switch (action)
            {
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
                    forwardToJsp = EnterReview(request,response);
                    break;
                case "SearchProduct":
                    forwardToJsp = SearchProduct(request, response);
                    break;
                    case"AddProduct":
                        forwardToJsp = AddProduct(request, response);
                    break;
                case "Cart":
                    forwardToJsp = Cart(request, response);
                    break;

                case "Reset":
                    forwardToJsp = Reset(request, response);
                    break;
                case "Update":
                    forwardToJsp = ResetPass(request, response);
                    break;
                    case "Link":
                    forwardToJsp = Link(request, response);
                    break;
                case "Remove":
                    forwardToJsp = RemoveItem(request, response);
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
        if (username != null && password != null && !username.isEmpty() && !password.isEmpty())
        {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserByUsernamePassword(username, password);

            if (u == null)
            {
                //Direct to error page when wrong credentials are provided
                forwardToJsp = "controller/error.jsp";
                String error = "User Not Found. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            } else
            {
                if (userDao.checkIfUserIsAdmin(username))
                {
                    forwardToJsp = "controller/index.jsp";
                    session.setAttribute("username", username);
                    session.setAttribute("user", u);
                } else
                {
                    forwardToJsp = "controller/index.jsp";
                    session.setAttribute("username", username);
                    session.setAttribute("user", u);
                }

            }
        } else
        {
            forwardToJsp = "controller/error.jsp";
            String error = "No username and/or password supplied. Please <a href=\"LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        Date date = Date.valueOf(dob);
        boolean isAdmin = false;
        if (username != null && password != null && !username.isEmpty() && !password.isEmpty() && firstname != null && lastname != null && !firstname.isEmpty() && !lastname.isEmpty() && email != null && phone != null && !email.isEmpty() && !phone.isEmpty() && dob != null && !dob.isEmpty())
        {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserByUsernamePassword(username, password);
            boolean login = false;

            if (u == null)
            {

                user user = new user(0, username, password, firstname, lastname, email, phone, date, isAdmin);
                session.setAttribute("username", username);
                session.setAttribute("user", user);

                login = userDao.addUser(user);
                forwardToJsp = "controller/index.jsp";
            } else
            {
                forwardToJsp = "view/error.jsp";
                String error = "user already exists <a href=\"LoginNdRegister.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            }
        } else
        {
            forwardToJsp = "view/error.jsp";
            String error = "No username and/or password and/or email and/or phone and/or firstname and/or lastname supplied. Please <a href=\"LoginNdRegister.jsp\">try again.</a>";
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
    private String Link(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);

        String email = request.getParameter("email");
        String Username = request.getParameter("username");
       
        
        if (email != null && !email.isEmpty() )

        {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserByEmail(email, Username);
            

            if (u != null)
            {
                    String token = UUID.randomUUID().toString();
                    
                    // Save the token in the database
            userDao.addReset(u.getEmail(), token);
            
            
            // Send password reset link to user's email
            String subject = "Password Reset Request";
            String resetUrl = "http://localhost:8080/Oziz/view/Reset.jsp?token=" + token;
            String body = "Dear " + u.getUsername() + ",\n\n"
                        + "We received a request to reset your password. To reset your password, please click the link below:\n\n"
                        + resetUrl + "\n\n"
                        + "If you did not request a password reset, please ignore this message.\n\n"
                        + "Best regards,\n"
                        + "Your Website Team";
            
            String fromEmail = "attanyarkmeshach@gmail.com"; // Replace with your email address
            String fromPassword = ""; // Replace with your email password
            String toEmail =email;
            
            Properties properties = System.getProperties();
            properties.setProperty("mail.smtp.host", "smtp.gmail.com"); // Replace with your SMTP server
            properties.setProperty("mail.smtp.auth", "true");
            properties.setProperty("mail.smtp.port", "465"); // Replace with your SMTP port
            properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            
            
                
                

                forwardToJsp = "view/LoginNdRegister.jsp";
            } else
            {
                forwardToJsp = "controller/error.jsp";
                String error = "NO User Found <a href=\"LoginNdRegister.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            }
        } else
        {
            forwardToJsp = "controller/error.jsp";
            String error = "No username and/or password and/or email and/or phone and/or firstname and/or lastname supplied. Please <a href=\"LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }
    
    private String ResetPass(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);

        String username = request.getParameter("username");

        String password = request.getParameter("password");
        
        if (username != null  && password != null && !username.isEmpty() && !password.isEmpty() )

        {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserByUsername(username);
            boolean Reset = false;
            boolean update = false;

            if (u != null)
            {

                
                session.setAttribute("password", password);
                
                update = userDao.updatePass(u, password);

                forwardToJsp = "view/LoginNdRegister.jsp";
            } else
            {
                forwardToJsp = "controller/error.jsp";
                String error = "NO User Found <a href=\"LoginNdRegister.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            }
        } else
        {
            forwardToJsp = "controller/error.jsp";
            String error = "No username and/or password and/or email and/or phone and/or firstname and/or lastname supplied. Please <a href=\"LoginNdRegister.jsp\">try again.</a>";
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

        if (product != null && !product.isEmpty())
        {
            ProductsDao pdao = new ProductsDao("clothes_shop");
            ProductsDaoInterface productdao = new ProductsDao("clothes_shop");
            products p = productdao.searchbyname(product);

            boolean login = false;

            if (p != null)
            {
                session.setAttribute("products", p);

                forwardToJsp = "view/productsView.jsp";
            } else
            {
                forwardToJsp = "view/productsView.jsp";
                String error = "No Products by that name";
                session.setAttribute("errorMessage", error);
            }
        } else
        {
            forwardToJsp = "view/productsView.jsp";
            String error = "No Product Namesupplied. Please <a href=\"LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }

    private String Reset(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");

        if (username != null && !username.isEmpty())
        {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserByUsername(username);

            if (u == null)
            {
                //Direct to error page when wrong credentials are provided
                forwardToJsp = "controller/error.jsp";
                String error = "User Not Found. Please <a href=\"../view/LoginNdRegister.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            } else
            {
                if (userDao.checkIfUserIsAdmin(username))
                {
                    forwardToJsp = "controller/error.jsp";
                    String error = "Admins Can't Reset their password this way, Contact the other admins ";
                    session.setAttribute("errorMessage", error);
                } else
                {
                    forwardToJsp = "view/Link.jsp";
                    session.setAttribute("username", username);

                }

            }
        } else
        {
            forwardToJsp = "controller/error.jsp";
            String error = "No username and/or password supplied. Please <a href=\"LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }

    private String Cart(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "#";
        HttpSession session = request.getSession(true);

        
        String id = request.getParameter("id");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        

        if (id != null && !id.isEmpty())
        {
            ProductsDao pdao = new ProductsDao("clothes_shop");
            products p = pdao.searchbyId(id);
            
            CartDao cartdao = new CartDao("clothes_shop");
            user u = (user) session.getAttribute("user");
           
            if (p != null){
             boolean exist = false;
                ArrayList<Cart> cartList = new ArrayList<>();
                Cart cm = new Cart();
                cm.setUserId(u.getUserId());
                cm.setProductId(id);
                cm.setQuantity(quantity);
                cm.setPrice(p.getCP());
                
                ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
                if (cart_list == null)
                {
                    cartList.add(cm);
                    boolean added = cartdao.addCart(cm);
                    session.setAttribute("cart-list", cartList);
                    
                    forwardToJsp = "view/productsView.jsp";

                } else
                {
                    cartList = cart_list;

                   
                    for (Cart c : cart_list)
                    {
                        if (c.getProductId().equals(id))
                        {
                            exist = true;
                            forwardToJsp = "view/productsView.jsp";
                            
                        }
                    }

                    if (!exist)
                    {
                        cartList.add(cm);
                        boolean added = cartdao.addCart(cm);
                        forwardToJsp = "view/cart.jsp";
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
         
        int rating = Integer.parseInt(ratingstring);
        user u = (user) session.getAttribute("user");
        
        
        
        if (review != null && !review.isEmpty() )
        {
            if(u==null){
                forwardToJsp = "controller/error.jsp";
            String error = "Not Logged in please sign up to Review. Please <a href=\"LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
            }else{

           

            long millis=System.currentTimeMillis();  
            java.sql.Date date=new java.sql.Date(millis);         
            products p = (products) session.getAttribute("product");
            review r = new review(0, p.getProductId(),u.getUserId(),rating,review,date);
            boolean entered = productdao.insertReview(r);
            
            if(entered==true){
            forwardToJsp ="/Oziz/view/individualProduct.jsp?Name="+p.getName();
        }else{
                forwardToJsp = "controller/error.jsp";
            String error = "No rating and/or review supplied. Please <a href=\"LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
            }
            }
            
            
        } else
        {
            forwardToJsp = "controller/error.jsp";
            String error = "No rating and/or review supplied. Please <a href=\"LoginNdRegister.jsp\">try again.</a>";
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
        if (username != null && !username.isEmpty())
        {
            UserDao userDao = new UserDao("clothes_shop");
            boolean removed = userDao.removeUser(username);

            if (removed == true)
            {

                forwardToJsp = "view/userAdmin.jsp";
            } else
            {
                forwardToJsp = "controller/error.jsp";
                String error = "prodcut doesnt exists <a href=\"userAdmin.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            }
        } else
        {
            forwardToJsp = "controller/error.jsp";
            String error = "No username and/or password and/or email and/or phone and/or firstname and/or lastname supplied. Please <a href=\"LoginNdRegister.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }
    
    private String AddProduct(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        
        ProductsDao pdao = new ProductsDao("clothes_shop");
        ProductsDaoInterface productdao = new ProductsDao("clothes_shop");
        
        
         String ProductId = request.getParameter("ProductId");
        String Name = request.getParameter("Name");
        String MRP = request.getParameter("MRP");
        String CP = request.getParameter("CP");
        String Description = request.getParameter("Description");
        String Category =request.getParameter("Category");
         String Tags =request.getParameter("Tags");
        String Brand = request.getParameter("Brand");
   
        
        if (ProductId != null && !ProductId.isEmpty() &&Name != null && !Name.isEmpty() &&MRP != null && !MRP.isEmpty() &&CP != null && !CP.isEmpty() &&Description != null && !Description.isEmpty() &&Category != null && !Category.isEmpty() &&Brand != null && !Brand.isEmpty() &&Tags != null && !Tags.isEmpty() )
        {
            double mrp = Double.valueOf( MRP );
           double cp =Double.valueOf( CP );
         
            products p = new products(ProductId, Name,mrp,cp,Description,Category,Tags,"",Brand);
            boolean entered = productdao.AddProduct(p);
            
            if(entered==true){
            forwardToJsp ="/Oziz/view/productAdmin";
        }else{
                forwardToJsp = "controller/error.jsp";
            String error = "Not enough info supplied. Please <a href=\"productAdmin.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
            }
            
            
            
        } else
        {
            forwardToJsp = "controller/error.jsp";
            String error = "Not enough info supplied. Please <a href=\"productAdmin.jsp\">try again.</a>";
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
        
        forwardToJsp ="view/cart.jsp";
        
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
