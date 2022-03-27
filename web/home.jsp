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
        <title>Home Page</title>
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
                <c:if test="${not empty sessionScope.User}">
                    <h1>
                        Welcome
                        <c:out value="${User.name}"/>
                    </h1>
                    <c:out value="Username: ${User.uName}"/>
                </c:if>
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
                    <form action="Blog">
                        <input type="submit" value="View your posts" >
                    </form> 
                    <!-- All Posts -->
                    <div>
                        <c:if test="${not empty requestScope.allPosts}">
                            <c:forEach items="${allPosts}" var="post">
                                <div style= 'border:1px solid #000000;'>
                                    <div><b>Title: </b>${post.getTitle()}</div>
                                    <div><b>Author: </b>${post.getAuthor()}</div><br>
                                    <div><b>Content: </b>${post.getContent()}</div>
                                </div>

                            </c:forEach>
                        </c:if>

                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
