<%-- 
    Document   : header
    Created on : 16-Feb-2018, 16:52:00
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="index.htm"><img src="images/logo.png" class="logo" alt="HDR logo"></a></li>
                    <li><a href="<c:url value="/navigationController.htm"/>">Product overzicht</a></li>
                    <li><a href="<c:url value="/navigationController/new.htm"/>">Voeg Product toe</a></li>
                    <li><a href="<c:url value="/navigationController/management.htm"/>">Beheer</a></li>
                    <li>
                        <form action="<c:url value="/perform_logout"/>" method="POST">
                            <input type="submit" value="Log uit">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </form>
                    </li>
                </ul>
            </nav>
        </header>
    </body>
</html>
