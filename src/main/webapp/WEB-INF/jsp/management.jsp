<%-- 
    Document   : Management
    Created on : 16-Feb-2018, 17:34:04
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
                    <h1>Gebruikers</h1>
                    <table>
                        <tr>
                            <th>Naam</th>
                            <th>Email</th>
                            <th>Bewerken</th>
                            <th>Verwijderen</th>
                        </tr>
                        <tr>
                            <td>Ad Ministrator</td>
                            <td>Administrator@mail.com</td>
                            <td class="icons"><a href="<c:url value=""/>"><i class="fa fa-edit"></i></a></td>
                            <td class="icons"><a href="<c:url value=""/>"><i class="fa fa-remove"></i></a></td>
                        </tr>
                        <tr>
                            <td>Ash</td>
                            <td>Ketchum@mail.com</td>
                            <td class="icons"><a href="<c:url value=""/>"><i class="fa fa-edit"></i></a></td>
                            <td class="icons"><a href="<c:url value=""/>"><i class="fa fa-remove"></i></a></td>
                        </tr>
                </table>

                <h2>Voeg gebruiker toe</h2>
                <form>
                    <p><label>Naam</label></p>
                    <p><input type="text"></p>

                    <p><label>Email</label></p>
                    <p><input type="email"></p>

                    <input type="submit" value="Voeg gebruiker toe">
                </form>
                <%-- <form:form modelAttribute="" action="/navigationController/newUser" method="POST">
                    <form:label path="name">Naam</form:label>
                    <form:input type="text" path="name"/>
                    <form:errors class="error" path="name"/>

                    <form:label path="email">Email</form:label>
                    <form:input type="email" path="email"/>
                    <form:errors class="error" path="email"/>

                    <input type="submit" value="Voeg gebruiker toe">
                </form:form> --%>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
