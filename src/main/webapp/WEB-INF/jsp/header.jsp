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
                    <li><a href="<c:url value="/controller.htm"/>"><img src="<c:url value="/images/logo.png"/>" class="logo" alt="HDR logo"></a></li>
                    <li><a href="<c:url value="/controller.htm"/>">Product overzicht</a></li>
                    <li><a href="<c:url value="/controller/newProduct.htm"/>">Voeg Product toe</a></li>
                    <li><a href="<c:url value="/controller/userOverview.htm"/>">Gebruikers</a></li>
                    <li><a href="<c:url value="/controller/newUser.htm"/>">Voeg gebruiker toe</a></li>
                    <!--<li><a href="<c:url value="/controller/getUser.htm"/>">Profiel aanpassen</a></li>-->
                    <li>
                        <form action="<c:url value="/controller/logout.htm"/>" method="GET">
                            <input type="submit" value="Log uit">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </form>
                    </li>
                </ul>
            </nav>
        </header>
    </body>
</html>
