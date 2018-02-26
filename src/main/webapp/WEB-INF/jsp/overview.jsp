<%-- 
    Document   : overview
    Created on : 16-Feb-2018, 17:35:04
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
                    <h1>Product overzicht</h1>
                    <table>
                        <tr>
                            <th>Naam</th>
                            <th>Beschrijving</th>
                            <th>Prijs</th>
                            <th>Stock</th>
                            <th>Bewerken</th>
                            <th>Verwijderen</th>
                        </tr>
                        <!--<c:forEach items="${items}" var="item"> 
                                <tr>
                                    <td><c:out value="${item.Name}"/></td>
                                    <td><c:out value="${item.Description}"/></td>
                                    <td><c:out value="${item.Price}" /></td>
                                    <td><a href="<c:url value=""/>"><i class="fa fa-edit"></i></a></td>
                                    <td><a href="<c:url value=""/>"><i class="fa fa-remove"></i></a></td>
                                </tr>
                    </c:forEach> -->

                    <tr>
                        <td><c:out value="Stella"/></td>
                        <td><c:out value="Standaard pintje"/></td>
                        <td><c:out value="€2.00" /></td>
                        <td><c:out value="80"/></td>
                        <td class="icons"><a href="<c:url value=""/>"><i class="fa fa-edit"></i></a></td>
                        <td class="icons"><a href="<c:url value=""/>"><i class="fa fa-remove"></i></a></td>
                    </tr><tr>
                        <td><c:out value="Gratis"/></td>
                        <td><c:out value="Gratis pintje"/></td>
                        <td><c:out value="€0.00" /></td>
                        <td><c:out value="/"/></td>
                        <td class="icons"><a href="<c:url value=""/>"><i class="fa fa-edit"></i></a></td>
                        <td class="icons"><a href="<c:url value=""/>"><i class="fa fa-remove"></i></a></td>
                    </tr>
                </table>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
