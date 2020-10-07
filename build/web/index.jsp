<%-- 
    Document   : index
    Created on : Oct 5, 2020, 1:07:44 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laboratorio #1</title>        
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        
    <c:if test="${not empty login}">
        <h1>BIENVENID@ A LA PAGINA ${login}</h1>
    </c:if>
    
    </body>
</html>

