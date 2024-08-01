/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserService;

/**
 *
 * @author Owen
 */

public class Charts extends HttpServlet {
    @EJB
    private UserService userService;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch data from the database (replace this with your actual data retrieval logic)
        String vetNames = userService.getVetNames();
        Map<String, Long> dates = userService.getAppointmentsPerDay();
        System.out.println("Vets: " + vetNames);
        System.out.println("Appointments per day: " + dates);
        
        request.setAttribute("vets", vetNames);
        request.setAttribute("record", formatMap(dates));
        request.getRequestDispatcher("charts.jsp").forward(request, response);
    }
    
    public static String formatMap(Map<String, Long> inputMap) {
        StringBuilder result = new StringBuilder("{");

        for (Map.Entry<String, Long> entry : inputMap.entrySet()) {
            result.append("\"").append(entry.getKey()).append("\":").append(entry.getValue()).append(",");
        }

        if (!inputMap.isEmpty()) {
            // Remove the trailing comma and add the closing curly brace
            result.delete(result.length() - 1, result.length()).append("}");
        } else {
            // If the map is empty, just add the closing curly brace
            result.append("}");
        }

        return result.toString();
    }

}
