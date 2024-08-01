/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AppointmentDTO;
import model.UserService;

/**
 *
 * @author Owen
 */
public class Show extends HttpServlet {
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
        
        Long vetId = Long.parseLong(CookieHelper.getCookieValue(request, "id"));
        String role = CookieHelper.getCookieValue(request, "role");
        
        List<AppointmentDTO> allUsers = userService.getApps();
        System.out.println("Number of appointments retrieved: " + allUsers.size());
        
        Iterator<AppointmentDTO> iterator = allUsers.iterator();

        // Iterate through the list using the iterator
        while (iterator.hasNext()) {
            AppointmentDTO appointment = iterator.next();
            
            appointment.setAppointmentDate(DateConverter.convertDate(appointment.getAppointmentDate()));

            
        }
        
        if(role.equals("0")){
             System.out.println("admin Calendar events: " + allUsers.toString());
             request.setAttribute("allApps", allUsers.toString());
            request.getRequestDispatcher("diary.jsp").forward(request, response); 
        }else{
            while (iterator.hasNext()) {
                AppointmentDTO appointment = iterator.next();

                if (appointment.getVetId() != vetId) {
                    // Remove the element using the iterator's remove method
                    iterator.remove();
                }
            }
            
            request.setAttribute("allApps", allUsers.toString());
            System.out.println("vet Calendar events: " + allUsers.toString());
           request.getRequestDispatcher("sch.jsp").forward(request, response); 
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
