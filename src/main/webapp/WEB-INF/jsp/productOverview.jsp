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
                    <h2>Product overzicht</h2>
                    <table>
                        <tr>
                            <th>Naam</th>
                            <th>Prijs(€)</th>
                            <th>Favoriet</th>
                            <th>Bewerken</th>
                            <th>Verwijderen</th>
                        </tr>
                        <c:forEach items="${items}" var="item"> 
                            <tr>
                                <td><c:out value="${item.name}"/></td>
                                <td><fmt:formatNumber value="${item.price}" minFractionDigits="2"/></td>
                                
                                <c:choose>
                                <c:when test="${item.isFavorite == true}">
                                    <td class="icons"><i class="fas fa-check"></i></td>
                                </c:when>
                                    
                                <c:otherwise>
                                    <td class="icons"><i class="fas fa-times"></i></td>
                                </c:otherwise>   
                                </c:choose>
                                    
                                <td class="icons"><a href="<c:url value="controller/editProduct/${item.id}"/>"><i class="fas fa-pencil-alt"></i></a></td>
                                <td class="icons" id="deleteProduct" onclick="{confirmDelete('${item.id}','${item.name}')}"><i class="fas fa-trash-alt"></i></td>
                            </tr>
                        </c:forEach>
                    </table>
                </main>
                <div class="modal" id="modal">
                    <div class="modalcontent">
                        <h2>Bent u zeker dat u product <span id="producttitle"></span> wilt verwijderen?</h2>
                        <button class="modalbutton" onclick="{deleteProduct()}"><p>ja</p></button>
                        <button class="modalbutton" onclick="{toggleModal()}"><p>nee</p></button>
                    </div>
                </div>
            <jsp:include page="footer.jsp"></jsp:include>
            <script type="text/javascript" src="<c:url value="/javascript/confirmDelete.js"/>"></script>
        </div>
    </body>
</html>
