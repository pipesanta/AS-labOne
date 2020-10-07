<%-- 
    Document   : login
    Created on : Oct 5, 2020, 2:35:51 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <!--<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
         Optional theme 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
         Latest compiled and minified JavaScript 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>-->
    
    <style>
        .photo-size {
            height: 300px;
        }
    </style>

    <body>
        <jsp:include page="menu.jsp"></jsp:include>

        <c:if test="${param.error==1}">
            <font color="red">Usuario Invalido. Intentelo de nuevo</font>
        </c:if>

        <div class="container well">

            <div align="center">
                <h1> Contact Information</h1>
                <img class="photo-size" src="https://brighterwriting.com/wp-content/uploads/icon-user-default.png" alt="Avatar" class="avatar">
                <form action="AccountServlet?action=login" method="post">
                    <table>
                        <tr>
                            <th><label><b>Username:</b></label></th>
                            <th>
                                <input type="text" placeholder="Enter Username" class="form-control" name="username"
                                       required="" />
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Password:</b></label></th>
                            <th>
                                <input type="password" placeholder="Enter Password" class="form-control" name="password"
                                       required="" />
                            </th>
                        </tr>
                        <div class="break"></div>
                        <tr>
                            <td colspan="2">
                                <input class="btn btn-info btn-lg" type="submit" name="action" value="Login">
                                
                                <input class="btn icon-info btn-lg" type="reset" name="action" value="Reset">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>

</html>