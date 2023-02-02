/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET;

import DAO.UserDao;
import DTO.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
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
        String forwardToJsp = "index.html";
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "login":
                    forwardToJsp = LoginPage(request, response);
                    break;
                    case "register":
                    forwardToJsp = RegisterPage(request, response);
                    break;
            }
        }
    }
    private String LoginPage(HttpServletRequest request, HttpServletResponse response) {
      String forwardToJsp = "index.jsp";
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
            UserDao userDao = new UserDao("clothes chop");
            user u = userDao.findUserByUsernamePassword(username, password);
            
            if (u == null) {
                forwardToJsp = "controller/index.jsp";
                String error = "Incorrect credentials supplied. Please <a href=\"login.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            } else {
                forwardToJsp = "loginSuccessful.jsp";
                session.setAttribute("username", username);
                session.setAttribute("user", u);
            }
        } else {
            forwardToJsp = "error.jsp";
            String error = "No username and/or password supplied. Please <a href=\"login.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
        }
        return forwardToJsp;
    }
    private String RegisterPage(HttpServletRequest request, HttpServletResponse response) {
     String forwardToJsp = "RegisterPage.jsp";
        HttpSession session = request.getSession(true);
         String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        Date date=Date.valueOf(dob);
        if (username != null && password != null && !username.isEmpty() && !password.isEmpty() ) {
            UserDao userDao = new UserDao("clothes_shop");
            user u = userDao.findUserByUsernamePassword(username, password);
            boolean login = false;
            
            if (u == null) {
                forwardToJsp = "RegisterPage.jsp";
                session.setAttribute("username", username);
                session.setAttribute("user", u);
                user user = new user(username, password, firstname, lastname,email,phone,date);
                login = userDao.addUser(user);
            } else {
               forwardToJsp = "error.jsp";
                String error = "user already exists <a href=\"register.jsp\">try again.</a>";
                session.setAttribute("errorMessage", error);
            }
        } else {
            forwardToJsp = "error.jsp";
            String error = "No username and/or password and/or email and/or phone and/or firstname and/or lastname supplied. Please <a href=\"login.jsp\">try again.</a>";
            session.setAttribute("errorMessage", error);
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
            protected void doGet
            (HttpServletRequest request, HttpServletResponse response)
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
            protected void doPost
            (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                processRequest(request, response);
            }

            /**
             * Returns a short description of the servlet.
             *
             * @return a String containing servlet description
             */
            @Override
            public String getServletInfo
            
                () {
        return "Short description";
            }// </editor-fold>

        }

    
