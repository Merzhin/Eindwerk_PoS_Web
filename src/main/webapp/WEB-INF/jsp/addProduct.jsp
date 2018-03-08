<%-- 
    Document   : AddProduct
    Created on : 16-Feb-2018, 17:11:00
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
                <c:choose>
                    <c:when test="${item.id == null}">
                        <h2>Voeg product toe</h2>
                        <c:url var="addProduct" value="/controller/addProduct"></c:url>

                        <form:form modelAttribute="item" action="${addProduct}" method="POST">

                            <p><form:label path="name">Naam</form:label></p>
                            <p><form:input type="text" path="name" required="required"/></p>
                            <p><form:errors class="error" path="name"/></p>

                            <p><form:label path="price">Prijs</form:label></p>
                            <p><form:input type="text" path="price"/></p>
                            <p><form:errors class="error" path="price" /></p>

                            <p><form:label path="isFavorite">Favoriet?</form:label><form:checkbox path="isFavorite"/></p>
                            <p><form:errors class="error" path="isFavorite"/></p>

                            <input type="submit" value="Voeg product toe">

                        </form:form>
                    </c:when>

                    <c:otherwise>
                        <h2>Product aanpassen</h2>
                        <c:url var="editProduct" value="/controller/editProduct"></c:url>
                        <form:form modelAttribute="item" action="${editProduct}" method="POST">

                            <form:hidden path="id"></form:hidden>

                                <p><form:label path="name">Naam</form:label></p>
                            <p><form:input type="text" path="name" required=""/></p>
                            <p><form:errors class="error" path="name"/></p>

                            <p><form:label path="price">Prijs</form:label></p>
                            <p><form:input type="text" path="price" required=""/></p>
                            <p><form:errors class="error" path="price" /></p>

                            <p><form:label path="isFavorite">Favoriet?</form:label><form:checkbox path="isFavorite"/></p>
                            <p><form:errors class="error" path="isFavorite"/></p>

                            <input type="submit" value="Pas product aan">

                        </form:form>
                    </c:otherwise>
                </c:choose>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
