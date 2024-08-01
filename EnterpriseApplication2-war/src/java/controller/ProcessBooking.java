/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Animal;
import model.Owner;
import model.UserService;

/**
 *
 * @author Owen
 */
public class ProcessBooking extends HttpServlet {
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vetId = request.getParameter("vet");
        String animalId = request.getParameter("id");
        Animal animal = userService.getAnimalById(Long.parseLong(animalId));
        Owner user = userService.getOwnerById(animal.getCustomerId());
        String date = request.getParameter("date");
        
        boolean hasThreeOrMoreBookings = userService.hasThreeOrMoreBookingsInDay(Long.parseLong(vetId), date);
        if (hasThreeOrMoreBookings) {
            request.setAttribute("e", "1");
            request.setAttribute("id", animalId);
            request.getRequestDispatcher("/Book").forward(request, response);
        } else {
            userService.addAppointment(animal.getCustomerId(), animal.getId(), Long.parseLong(vetId), date, "", "");
            response.sendRedirect("app.jsp");
        }
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
