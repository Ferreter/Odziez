/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET;

import DAO.ProductsDao;
import DAO.ProductsDaoInterface;
import DAO.UserDao;
import DTO.Cart;
import DTO.products;
import DTO.user;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import java.util.ArrayList;
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
                    
                    case"SearchProduct":
                        forwardToJsp = SearchProduct(request, response);
                    break;
                    case"Add to cart":
                        forwardToJsp = Cart(request, response);
                    break;
                    
                    case"Reset":
                        forwardToJsp = Reset(request, response);
                    break;
                    case"Update":
                        forwardToJsp = ResetPass(request, response);
                    break;
                    
            }

            response.sendRedirect(forwardToJsp);
        }
    }

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
                if(userDao.checkIfUserIsAdmin(username)){
                    forwardToJsp = "controller/admin.jsp";
                     session.setAttribute("username", username);
                     session.setAttribute("user", u);
                }else{
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
        if (username != null && password != null && !username.isEmpty() && !password.isEmpty() && firstname != null && lastname != null && !firstname.isEmpty() && !lastname.isEmpty() && email != null && phone != null && !email.isEmpty() && !phone.isEmpty() && dob != null && !dob.isEmpty() )
        {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserByUsernamePassword(username, password);
            boolean login = false;

            if (u == null)
            {
                user user = new user(username, password, firstname, lastname, email, phone, date,isAdmin);
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
    
    private String ResetPass(HttpServletRequest request, HttpServletResponse response) {
        String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        
        String username = request.getParameter("username");
        
        if (username != null  && !username.isEmpty() )
        {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserByUsername(username);
            boolean Reset = false;

            if (u != null)
            {
                
               
                
                session.setAttribute("password", u.getPassword());
                
                Reset = userDao.updatePass(u);
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
        
        if (username != null  && !username.isEmpty() )
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
                if(userDao.checkIfUserIsAdmin(username)){
                    forwardToJsp = "controller/admin.jsp";
                     session.setAttribute("username", username);
                     session.setAttribute("user", u);
                }else{
                   
                    
                    forwardToJsp = "view/Reset.jsp";
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
       String forwardToJsp = "controller/index.jsp";
        HttpSession session = request.getSession(true);
        String id = request.getParameter("id");
	
        
	
	if (id != null && !id.isEmpty())
        {
            
            
            
            ProductsDao pdao = new ProductsDao("clothes_shop");
            products p = pdao.searchbyId(id);
           
            if (p != null){
                
            
            ArrayList<Cart> cartList = new ArrayList<>();
             id = request.getParameter(p.getProductId());
            Cart cm = new Cart();
            cm.setProductId(id);
            cm.setQuantity(1);
           
            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
            if (cart_list == null) {
                cartList.add(cm);
                session.setAttribute("cart-list", cartList);
                
                forwardToJsp ="view/productsView.jsp";
               
            } else {
                cartList = cart_list;

                boolean exist = false;
                for (Cart c : cart_list) {
                    if (c.getProductId().equals(id)) {
                        exist = true;
                       String error = "<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cart.jsp'>GO to Cart Page</a></h3>";
                    }
                }
            
                if (!exist) {
                    cartList.add(cm);
                    forwardToJsp = "view/cart.jsp";
                }
            }
                
            }
        
   }
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

    