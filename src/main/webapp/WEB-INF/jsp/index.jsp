<%-- 
    Document   : index
    Created on : 16-Feb-2018, 16:50:56
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <body>
        <div class="container">
            <jsp:include page="head.jsp"></jsp:include>
            <jsp:include page="header.jsp"></jsp:include>
                <main>
                    <h1>Log in</h1>
                <c:choose>
                    <c:when test="${sessionScope.loggedIn == null}">

                        <form action="<c:url value="/controller/login"/>" method="POST">

                            <p><label for="username">Gebruikersnaam</label></p>
                            <p><input type="text" name="username" id="username" value="${requestScope.username}"></p>

                            <p><label for="password">Wachtwoord</label></p>
                            <p><input type="password" name="password" id="password"></p>

                            <input type="submit" value="log in">
                        </form>
                        <c:forEach items="${errors}" var="error">
                            <p id="loginError" class="error"><c:out value="${error}"/></p>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>Hi ${sessionScope.loggedIn}, klik op onderstaande knop om terug uit te loggen!</p>
                        <form action="<c:url value="/=controller/logout"/>" method="GET">
                            <input type="submit" value="Log uit">
                        </form>
                    </c:otherwise>
                </c:choose>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
