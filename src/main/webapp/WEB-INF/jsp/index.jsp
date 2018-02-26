<%-- 
    Document   : index
    Created on : 16-Feb-2018, 16:50:56
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <body>
        <div class="container">
            <jsp:include page="head.jsp"></jsp:include>
            <jsp:include page="header.jsp"></jsp:include>
                <main>
                    <h1>Index</h1>
                <sec:authorize access="isAnonymous()">
                    <form action="<c:url value="/perform_login"/>" method="POST">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                        <p><label for="username">Gebruikersnaam</label></p>
                        <p><input type="text" name="username" id="username"></p>

                        <p><label for="password">Wachtwoord</label></p>
                        <p><input type="password" name="password" id="password"></p>

                        <input type="submit" value="log in">
                    </form>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <form action="<c:url value="/perform_logout"/>" method="POST">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <input type="submit" value="Log uit">
                    </form>
                </sec:authorize>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
