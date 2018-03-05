<%-- 
    Document   : Management
    Created on : 16-Feb-2018, 17:34:04
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
                    <h2>Gebruikers</h2>
                    <table>
                        <tr>
                            <th>Naam</th>
                            <th>Verwijderen</th>
                        </tr>
                    <c:forEach items="${users}" var="user"> 
                        <tr>
                            <td><c:out value="${user}"/></td>
                            <td class="icons"><a href="<c:url value="/controller/removeUser/${user}"/>"><i class="fa fa-remove"></i></a></td>
                        </tr>
                    </c:forEach>
                </table>
                    <h2>Uw profiel</h2>
                    <p>Naam:<c:out value="${sessionScope.loggedIn}"/></p>
                    <form action="<c:url value="/controller/changePassword.htm"/>" method="GET">
                        <input type="submit" value="Verander wachtwoord">
                    </form>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
