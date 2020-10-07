<%-- 
    Document   : courseList
    Created on : Oct 5, 2020, 11:24:26 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        .main{
            display: flex;
        }

        .main .side {
            margin: 3px;
            width: 50%;
        }

        .main .left-side{
            /*background: rosybrown;*/

        }

        .main .rigth-side{
            /*background: peru;*/
        }
        
        .mb-6{
            margin-bottom: 6px;
        }


    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <div class="main">
            <div class="side left-side">
                <h3>Listado de Materias</h3>                
                <h3> Listado  ${courseList.size()}</h3>

                <c:forEach items="${courseList}" var="co">

                    <div>
                        <form action="AccountServlet?action=deleteCourse" method="post">
                            <table>
                                <tr style="display: none">
                                    <th><label><b>ID</b></label></th>
                                    <th>
                                        <input type="text" class="form-control mb-6" name="courseId" value="${co.getCourseid()}" />
                                    </th>
                                </tr>
                                <div class="break"></div>
                                <tr>
                                    <td colspan="2">
                                        <div>
                                           [${co.getCourseid()}] ${co.getCName()}   Creditos: ${co.getCredits()}
                                        </div>
                                        <input class="btn btn-info btn-lg mb-6" type="submit" name="action" value="Eliminar">
                                    </td>
                                </tr>
                            </table>

                        </form>
                    </div>
                </c:forEach>
            </div>
            <div class="side rigth-side">
                <form action="AccountServlet?action=createCourse" method="post">
                    <h2>Registrar un Curso Nuevo</h2>
                    <table>
                        <tr>
                            <th><label><b>ID del Curso:</b></label></th>
                            <th>
                                <input type="text" placeholder="Nombre del curso" class="form-control mb-6" name="courseId"
                                       required="" />
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Nombre:</b></label></th>
                            <th>
                                <input type="text" placeholder="Nombre del curso" class="form-control mb-6" name="courseName"
                                       required="" />
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Creditos:</b></label></th>
                            <th>
                                <input type="text" placeholder="Numero de creditos" class="form-control mb-6" name="credits"
                                       required="" />
                            </th>
                        </tr>
                        <div class="break"></div>
                        <tr>
                            <td colspan="2">
                                <input class="btn btn-info btn-lg mb-6" type="submit" name="action" value="Crear Materia">
                            </td>
                        </tr>
                    </table>

                </form>
            </div>

        </div>
    </body>
</html>
