<%-- 
    Document   : signup/jsp
    Author     : Jose Santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                    <!-- TODO check for repeat password -->
                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required>

                    <label for="psw-repeat"><b>Repeat Password</b></label>
                    <input type="password" placeholder="Repeat Password" name="psw-repeat" required>

                    <%=(String)request.getAttribute("error")%>
                    
                    <div class="clearfix">
                        <button type="submit" class="loginbtn">Sign up</button>
                    </div>
                </div>
            </form> 
            <form action='<%= response.encodeURL(request.getContextPath()) %>'>
                <input type="submit" value="Cancel" />
            </form>

        </div>
    </body>
</html>
