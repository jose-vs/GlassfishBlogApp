<%-- 
    Document   : login.jsp
    Author     : Jose Santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div>
            <!-- add a check for if the user already exists then send to home page -->
            <form action="App">
                <div class="container">
                    <h1>Login</h1>
                    <p>Please fill in your details to login</p>
                    <hr>

                    <label for="uname"><b>User name</b></label>
                    <input type="text" placeholder="Enter user name" name="uname" required>

                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required>

                    <%=(String)request.getAttribute("error")%>

                    <div class="clearfix">
                        <button type="submit" class="loginbtn">Login</button>
                    </div>
                </div>
            </form> 

            <form action='<%= response.encodeURL(request.getContextPath()) %>'>
                <input type="submit" value="Cancel" />
            </form>

        </div>

    </body>
</html>
