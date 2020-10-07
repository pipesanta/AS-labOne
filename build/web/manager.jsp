<%-- 
    Document   : manager
    Created on : Oct 5, 2020, 3:09:00 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <!--Optional theme-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">    
        <!--Latest compiled and minified JavaScript--> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    </head>
    <style>
        .alert-section {
            border: red 2px;
            border-radius: 15px;
        }
        .mb-6 {
            margin-bottom: 6px;            
        }
        
    </style>
    <body>        
    <!-- SECTION JUST FOR ROOT USER -->
    <c:if test="${ login eq 'admin' }">

        <div class="alert-section">

            <!-- CREAR ESTUDIANTE  -->
            <form action="AccountServlet?action=insertStudent" method="post">
                <table>
                    <tr>
                        <th><label><b>Documento de identidad: </b></label></th>
                        <th>
                            <input type="text" placeholder="Documento de identidad" class="form-control mb-6" name="documentId"
                                   required="" />
                        </th>
                    </tr>

                    <tr>
                        <th><label><b>Nombre completo: </b></label></th>
                        <th>
                            <input type="text" placeholder="Nombre completo" class="form-control mb-6" name="name"
                                   required="" />
                        </th>
                    </tr>

                    <tr>
                        <th><label><b>Password</b></label></th>
                        <th>
                            <input type="password" placeholder="password" class="form-control mb-6" name="password"
                                   required="" />
                        </th>
                    </tr>
                    <tr>
                        <th><label><b>Foto: </b></label></th>
                        <th>
                            <input type="text" placeholder="Photo" class="form-control mb-6" name="photo"
                                   required="" />
                        </th>
                    </tr>
                    <div class="break"></div>
                    <tr>
                        <td colspan="2">
                            <input class="btn btn-info btn-lg mb-6" type="submit" name="action" value="Registrar Estudiante">
                        </td>
                    </tr>
                </table>
            </form>

        </div>

    </c:if>
    

</body>
</html>
