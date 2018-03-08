<%-- 
    Document   : changePassword
    Created on : 04-Mar-2018, 13:32:38
    Author     : Thomas
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <div class="container">
        <jsp:include page="head.jsp"></jsp:include>
        <jsp:include page="header.jsp"></jsp:include>
            <main>
                <h1>Verander Wachtwoord</h1>
                <p>Een wachtwoord mag enkel bestaan uit cijfers!</p>
            <c:url var="savePassword" value="/controller/savePassword"></c:url>
            <form action="${savePassword}" method="POST">
                <p><label for="password">Nieuw wachtwoord</label></p>
                <p><input type="password" id="password" name="password" oninput="checkPassword(this)"></p>
                <p><label for="confirm">Bevesting uw nieuw wachtwoord</label></p>
                <p><input type="password" id="confirm" name="confirm"  oninput="checkConfirm(this)"></p>
                <p id="matchError" class="matchError error">De wachtwoorden komen niet overeen.</p>
                <p id="numberError" class="numberError error">Een wachtwoord mag enkel cijfers bevatten</p>
                <input type="submit" id="submit" disabled value="Opslaan">
            </form>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
        <script type="text/javascript" src="<c:url value="/javascript/changePassword.js"/>"></script>
    </div>
</html>
