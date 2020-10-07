<%-- 
    Document   : studentDetails
    Created on : Oct 5, 2020, 5:28:30 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle del estudiante </title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <!--Optional theme-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">    
        <!--Latest compiled and minified JavaScript--> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        
        
    </head>
    <style>
        body {
            padding: 30px;
        }
        
        .photo-size {
            height: 300px;
        }
        .my-6 {
            margin-top: 6px;
            margin-bottom: 6px;
        }
        span{
            font-size: 18px;
        }
    </style>
    
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        
        <c:choose>
            <c:when test="${ empty userDetails}">
                <!--<div>ESTA NULO</div>-->
                <!--<button action="AccountServlet" name="action" value="viewStudentData"> CLICK </button>-->
                <jsp:forward page="AccountServlet?action=viewStudentData"/>
            </c:when>
                
            <c:when test="${ not (empty userDetails || userDetails.id eq param.id) }">
                <jsp:forward page="AccountServlet?action=viewStudentData"/>
            </c:when>
                
            <c:when test="${ not empty userDetails }">
                <h1>Estudiante CC: ${ param.id }</h1>        
                <img class="photo-size my-6" src="${userDetails.photo}" alt="Avatar" class="avatar">
                <br>
                <form action="AccountServlet?action=updatePhoto" method="post">
                    <table>
                        <tr>
                            <th><label><b>Nueva Foto</b></label></th>
                            <th>
                                <input type="text" placeholder="Enter new Photo" class="form-control my-6" name="newPhoto" required="" />
                            </th>
                        </tr>
                        <div class="break"></div>
                        <tr>
                            <td colspan="2">
                                <input class="btn btn-info btn-lg my-6" type="submit" name="action" value="Actualizar Foto">
                            </td>
                        </tr>
                    </table>
                </form>
                
                <div class="my-6">
                    <span>
                        Número de Documento: ${userDetails.id}
                    </span>
                    <br>
                    <span>
                        Nombre Completo: ${userDetails.fullname}
                    </span>
                </div>

                
                <!--<button action="AccountServlet" name="action" value="viewStudentData" > CLICK </button>-->
            </c:when>

                
        </c:choose>
                 
        
    </body>
</html>
