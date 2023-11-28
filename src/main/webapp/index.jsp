<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jstl/fmt" %>

<%
    final Date date = new Date();
    request.setAttribute("date", date);

    final double number = 10.0 / 3;
    request.setAttribute("number", number);
%>
<html>
    <head>
        <title>Примеры</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@ include file="WEB-INF/jsp/bootstrap/styles-import.jsp"%>
    </head>
    <body>
        <h2>Hello World!</h2>
        <p><c:out value="${date}"/></p>
        <c:forEach var="item" begin="1" end="10" step="2">
            <p><c:out value="${item}-c"/></p>
        </c:forEach>
        <quote>
            <fmt:formatNumber value="${number}" maxIntegerDigits="4" maxFractionDigits="2"/>
        </quote>
        <div>
            <p>
                <a href="<c:url value="/error-provider"/>">Стандартная ошибка</a>
            </p>
            <p>
                <a href="<c:url value="/unauthorized-provider"/>">Ошибка авторизации</a>
            </p>
            <p>
                <a href="<c:url value="/unknown-error-provider"/>">Неизвестная ошибка</a>
            </p>
            <p>
                <a href="<c:url value="/java-exception"/>">Встроенная ошибка (Servlet Exception)</a>
            </p>
        </div>
        <%@ include file="WEB-INF/jsp/bootstrap/js-import.jsp"%>
    </body>
</html>
