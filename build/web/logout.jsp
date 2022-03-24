<%-- 
    Document   : logout.jsp
    Author     : Jose Santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session = "true" %>

<!DOCTYPE html>
<%
    session.invalidate();
    response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
