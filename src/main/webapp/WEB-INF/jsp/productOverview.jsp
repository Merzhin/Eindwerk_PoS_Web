<%-- 
    Document   : overview
    Created on : 16-Feb-2018, 17:35:04
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                            <th>Prijs(€)</th>
                            <th>Bewerken</th>
                            <th>Verwijderen</th>
                        </tr>
                    <c:forEach items="${items}" var="item"> 
                        <tr>
                            <td><c:out value="${item.name}"/></td>
                            <td><fmt:formatNumber value="${item.price}" minFractionDigits="2"/></td>
                            <td class="icons"><a href="<c:url value="controller/editProduct/${item.id}"/>"><i class="fa fa-edit"></i></a></td>
                            <td class="icons"><a href="<c:url value="controller/removeProduct/${item.id}"/>"><i class="fa fa-remove"></i></a></td>
                        </tr>
                    </c:forEach>
                </table>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
