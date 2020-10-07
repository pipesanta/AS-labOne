<%-- 
    Document   : menu
    Created on : Oct 5, 2020, 2:30:31 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty login}">
    |<a href="login.jsp">Login</a>|
    |<a href="signUp.jsp">Register</a>|
</c:if>

<c:if test="${not empty login}">
    |<a href="AccountServlet?action=logout">Logout</a>|
    |<a href="AccountServlet?action=studentList">Lista de estudiantes</a>|
    |<a href="AccountServlet?action=courseList">Materias</a>|
</c:if>



|<a href="AccountServlet?action=about">About</a>|
<hr/>