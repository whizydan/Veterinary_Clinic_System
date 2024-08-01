/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserService;
import model.Users;

/**
 *
 * @author Owen
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    
    @EJB
    private UserService userService;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Validate email and password (e.g., check for null or empty values)
        if (email != null && !email.isEmpty() && password != null && !password.isEmpty()) {
            boolean isValidUser = userService.validateUser(email, password);
            
            if (isValidUser) {
                Users user = userService.getUser(email, password);
                CookieHelper.setCookie(response, "name", user.getName(), 3600);
                CookieHelper.setCookie(response, "role", user.getRole(), 3600);
                CookieHelper.setCookie(response, "id", user.getId().toString(), 3600);
                CookieHelper.setCookie(response, "email", user.getEmail(), 3600);
                CookieHelper.setCookie(response, "phone", user.getPhone(), 3600);

                if(user.getRole().equals("0")){
                    //admin
                    response.sendRedirect("admin.jsp");
                }else if(user.getRole().equals("1")){
                    //receptionist
                    response.sendRedirect("rec.jsp");
                }else if(user.getRole().equals("2")){
                    //vet
                    response.sendRedirect("vet.jsp");
                }
            } else {
                // Display an error message for invalid credentials
                response.sendRedirect("index.jsp?e=0");
            }
        } else {
            // Display an error message for missing email or password
            response.sendRedirect("index.jsp?e=1");
        }
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
