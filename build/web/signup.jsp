<%-- 
    Document   : signup/jsp
    Author     : Jose Santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <!-- add a check for if the user already exists then send to home page -->
            <form action="App" method="POST">
                <div class="container">
                    <h1>Sign up</h1>
                    <p>Please fill in your details to sign up</p>
                    <hr>

                    <label for="uname"><b>User name</b></label>
                    <input type="text" placeholder="Enter user name" name="uname" required>
                    
                    <label for="name"><b>Name</b></label>
                    <input type="text" placeholder="Enter your name" name="name" required>

                    <!-- TODO check for repeat password -->
                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required>

                    <label for="psw-repeat"><b>Repeat Password</b></label>
                    <input type="password" placeholder="Repeat Password" name="psw-repeat" required>

                    <c:if test='${not empty requestScope.error}'>
                        <c:out value="${error}"/>
                    </c:if>

                    <div class="clearfix">
                        <button type="submit" class="signupbtn">Sign up</button>
                    </div>
                </div>
            </form> 
            <form action='<%= response.encodeURL(request.getContextPath()) %>'>
                <input type="submit" value="Cancel" />
            </form>

        </div>
    </body>
</html>
