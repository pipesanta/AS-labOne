<%-- 
    Document   : studentList
    Created on : Oct 5, 2020, 8:51:21 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de estudiantes</title>

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

        .m-12{
            margin: 12px;
        }
        .my-6 {
            margin-top: 6px;
            margin-bottom: 6px;
        }
        .my-2 {
            margin-top: 2px;
            margin-bottom: 2px;
        }
        .student-item{
            border: 1px solid grey;
            border-radius: 15px;
            margin-bottom: 5px;
            margin-top: 5px;
            padding: 5px;
        }
    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

            <form class="m-12" action="AccountServlet?action=changeStudentListMode" method="post">
                <input type="submit" name="insert" value="Registrar Estudiantes" />
                <input type="submit" name="listing" value="Listar Estudiantes" />
            </form>

        <c:if test="${studentModeList eq 'LISTING'}">
            <div>
                busqueda de estudiantes por numero de cedula
            </div>
            <div>
                <form action="AccountServlet?action=searchStudents" method="post">
                    <input  type="text" placeholder="Número de Cedula" class="form-control my-6" name="documentId"/>
                    <input class="btn btn-info btn-lg my-6" type="submit" name="action" value="Buscar">
                </form>
                <!--                <input type="text" placeholder="Enter Username" class="form-control" name="username" />
                            <input class="btn btn-info btn-lg" type="submit" name="action" value="Login">-->
            </div>

            <c:if test="${empty studentItem}">
                <c:forEach var="m" items="${studentList}">
                    <div class="student-item">
                        [${m.getId()}] ${m.getFullname()}
                        <a href="studentDetails.jsp?id=${m.getId()}">Ver</a>
                    </div>
                </c:forEach>
            </c:if>




            <c:if test="${not empty studentItem}">
                <img class="photo-size" src="${studentItem.photo}" alt="Avatar" class="avatar">
                <br>
                <span>
                    Número de Documento: ${studentItem.id}
                </span>
                <br>
                <span>
                    Nombre Completo: ${studentItem.fullname}
                </span>

            </c:if>

        </c:if>

        <c:if test="${studentModeList eq 'INSERT'}">
            <jsp:include page="manager.jsp"></jsp:include>
        </c:if>



    </body>
</html>
