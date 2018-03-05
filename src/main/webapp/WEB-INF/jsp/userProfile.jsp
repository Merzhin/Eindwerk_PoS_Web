<%-- 
    Document   : userProfile
    Created on : 26-Feb-2018, 13:12:24
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
                    <h2>Uw profiel</h2>
                <form:form modelAttribute="userinfo" action="/controller/addUser" method="POST">
                    <p><form:label path="name">Naam</form:label></p>
                    <p><form:input type="text" path="name"/></p>
                    <p><form:errors class="error" path="name"/></p>
                    
                    <input type="submit" value="Opslaan">
                </form:form>
            </main>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
