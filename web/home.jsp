<%-- 
    Document   : home
    Author     : Jose Santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session = "true" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <!-- HEADER -->
            <div>
                <form action='<%=response.encodeURL("logout.jsp") %>'>
                    <input type='submit' value="Logout" />
                </form>
            </div>
            <!-- BODY -->
            <div>
                <h1>
                    Welcome
                    <c:if test="${not empty sessionScope.User}">
                        <c:out value="${User.uName}"/>
                    </c:if>
                </h1>
                <hr>
                <div>
                    <!-- FORM BOX FOR POSTS -->
                    <div>
                        <form action="Home" method="POST">
                            <label for="title">Title</label><br>
                            <input type="text" id="title" name="title" value="Title"><br>
                            <label for="text">Enter Text</label><br>
                            <input type="text" id="text" name="text" value="Write your blog here"><br><br>
                            <input type="submit" value="Submit">
                        </form> 
                    </div>
                    <!-- All Posts -->
                    <div>

                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
