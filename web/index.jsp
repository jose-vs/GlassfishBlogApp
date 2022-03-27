<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index.jsp
    Author     : Jose Santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session = "true" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DSM Assignment 1 - BlogApp</title>
    </head>
    <body>
        <c:if test="${not empty sessionScope.User}">
            <%
                response.sendRedirect(request.getContextPath() + "/Home");
            %>
        </c:if>

        <div>
            <h1>Welcome to My BlogApp</h1>
            <h2>Made by Jose Santos</h2>

        </div>
        <div>
            <form action='<%= response.encodeURL("login.jsp") %>'>
                <input type="submit" value="Login" />
            </form>
            <form action='<%= response.encodeURL("signup.jsp") %>'>
                <input type="submit" value="Sign up" />
            </form>
        </div>
    </body>
</html>
