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
                    <c:when test="${item.ID == 0}">
                        <h2>Voeg product toe</h2>
                        <form>
                            <p><label>Naam</label></p>
                            <p><input type="text"></p>

                            <p><label>Beschrijving</label></p>
                            <p><input type="text"></p>

                            <p><label>Prijs</label></p>
                            <p><input type="text"></p>
                            
                            <p><label>Stock</label></p>
                            <p><input type="text"></p>

                            <input type="submit" value="Voeg product toe">

                        </form>
                        <%--<form:form action="/navigationController/newItem" method="POST">
                            
                            <form:label path="name">Naam</form:label>
                            <form:input type="text" path="name"/>
                            <form:errors class="error" path="name"/>
                            
                            <form:label path="description">Beschrijving</form:label>
                            <form:input type="text" path="description"/>
                            <form:errors class="error" path="description"/>

                    <form:label path="price">Prijs</form:label>
                    <form:input type="text" path="price"/>
                    <form:errors class="error" path="price" />
                    
                    <input type="submit" value="Voeg product toe">
                    
                </form:form> --%>
                    </c:when>

                    <c:otherwise>
                        <h2>Product aanpassen</h2>

                        <form>
                            <p><label>Naam</label></p>
                            <p><input type="text"></p>

                            <p><label>Beschrijving</label></p>
                            <p><input type="text"></p>

                            <p><label>Prijs</label></p>
                            <p><input type="text"></p>
                            
                            <p><label>Stock</label></p>
                            <p><input type="text"></p>

                            <input type="submit" value="Voeg product toe">

                        </form>

                        <%-- <form:form modelAttribute="item" action="${addItem}" method="POST">
                            
                            <form:label path="name">Naam</form:label>
                            <form:input type="text" path="name"/>
                            <form:errors class="error" path="name"/>
                            
                            <form:label path="description">Beschrijving</form:label>
                            <form:input type="text" path="description"/>
                            <form:errors class="error" path="description"/>

                    <form:label path="price">Prijs</form:label>
                    <form:input type="text" path="price"/>
                    <form:errors class="error" path="price" />
                    
                    <input type="submit" value="Pas product aan">
                    
                </form:form> --%>
                    </c:otherwise>
                </c:choose>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
