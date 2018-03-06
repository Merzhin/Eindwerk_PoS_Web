<%-- 
    Document   : userProfile
    Created on : 26-Feb-2018, 13:20:38
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <body>
        <div class="container">
            <jsp:include page="head.jsp"></jsp:include>
            <jsp:include page="header.jsp"></jsp:include>
                <main>
                    <h2>Voeg gebruiker toe</h2>
                <c:url var="addUser" value="/controller/addUser"></c:url>
                <form action="${addUser}" method="POST">

                    <p><label for="username">Naam</label></p>
                    <p><input type="text" id="username" name="username" value="${requestScope.username}" required/></p>

                    <p><label for="password">Nieuw wachtwoord</label></p>
                    <p><input type="password" id="password" name="password" oninput="checkPassword(this)" required></p>

                    <p><label for="confirm">Bevesting uw nieuw wachtwoord</label></p>
                    <p><input type="password" id="confirm"  oninput="checkConfirm(this)" required></p>

                    <c:forEach items="${errors}" var="error">
                        <p id="loginError" class="error"><c:out value="${error}"/></p>
                    </c:forEach>

                    <p id="matchError" class="matchError">De wachtwoorden komen niet overeen.</p>
                    <p id="numberError" class="numberError">Een wachtwoord mag enkel cijfers bevatten</p>

                    <input type="submit" id="submit" disabled value="Toevoegen">

                </form>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
            <script type="text/javascript" src="<c:url value="/javascript/changePassword.js"/>"></script>
        </div>
    </body>
</html>
