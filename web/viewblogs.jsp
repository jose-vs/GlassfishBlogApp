<%-- 
    Document   : viewblogs
    Created on : 27/03/2022, 11:49:28 pm
    Author     : jcvsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Blogs</title>
    </head>
    <body>
        <form action='Home'>
            <input type='submit' value="back" />
        </form>
        <h1>Viewing blogs by 
            <c:if test="${not empty sessionScope.User}">
                <c:out value="${User.uName}"/>
            </c:if>
        </h1>
        <div>
            <c:if test="${not empty requestScope.blogList}">
                <c:forEach items="${blogList}" var="post">
                    <div style= 'border:1px solid #000000;'>
                        <form action='Blog' method="POST">

                            <input type="hidden" name="id" value="${post.getId()}">

                            <label for="title"><b>Title: </b></label>
                            <input type="text" name="title" value="${post.getTitle()}" >

                            <br><label for="author"><b>Author:</b>  ${post.getAuthor()}<br></label><br>

                            <label for="content"><b>Content: </b></label>
                            <input type="text" name="content" value="${post.getContent()}">

                                <!--                            
                                <div>${post.getTitle()}</div>
                                <div>${post.getAuthor()}</div>
                                <div>${post.getContent()}</div>
                                -->

                            <input type='submit' value="edit" />
                        </form>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </body>
</html>
