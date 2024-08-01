<%-- 
    Document   : logout
    Created on : Mar 3, 2024, 3:37:19 PM
    Author     : Owen
--%>

<%@page import="controller.CookieHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
CookieHelper.deleteCookie(response, "name");
CookieHelper.deleteCookie(response, "role");
CookieHelper.deleteCookie(response, "id");
CookieHelper.deleteCookie(response, "email");

response.sendRedirect("index.jsp");
%>
