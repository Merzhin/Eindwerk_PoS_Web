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
                    <li class="hover"><a href="<c:url value="/controller.htm"/>">Producten</a></li>
                    <li class="hover"><a href="<c:url value="/controller/newProduct.htm"/>">Product toevoegen</a></li>
                    <li class="hover"><a href="<c:url value="/controller/userOverview.htm"/>">Gebruikers</a></li>
                    <li class="hover"><a href="<c:url value="/controller/newUser.htm"/>">Gebruiker toevoegen</a></li>
                    <li><a href="<c:url value="/controller/logout.htm"/>"><button class="logout"><i class="fas fa-power-off"></i></button></a></li>
                </ul>
            </nav>
        </header>
    </body>
</html>
