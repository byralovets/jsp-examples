<%@ page import="by.ralovets.examples.exception.GenericHttpException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>

<%
    if (exception instanceof GenericHttpException) {
        GenericHttpException httpException = (GenericHttpException) exception;
        request.setAttribute("reason", httpException.getMessage());
        request.setAttribute("code", httpException.getCode());
    }
%>

<html>
<head>
    <title>Ошибка</title>
    <%@ include file="../jsp/bootstrap/styles-import.jsp"%>
</head>
<body class="d-flex justify-content-center align-items-center">
    <div class="d-flex align-items-center">
        <div>
            <img src="<c:url value="/img/sad-cat.png"/>" alt="Грустный кот" height="145px">
        </div>
        <div class="ms-3">
            <h1>Упс.../></h1>
            <p>Кажется, произошла ошибка</p>

            <c:choose>
                <c:when test="${code != null}">
                    <p>Код ошибки: <c:out value="${code}"/></p>
                </c:when>
                <c:otherwise>
                    <p>Код ошибки: <c:out value="${pageContext.errorData.statusCode}"/></p>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${reason != null}">
                    <p class="mb-0">Проблема: <c:out value="${reason}"/></p>
                </c:when>
                <c:otherwise>
                    <p class="mb-0">Неизвестная проблема: <c:out value="${pageContext.exception.localizedMessage}"/></p>
                </c:otherwise>
            </c:choose>
            <%@ include file="../jsp/bootstrap/js-import.jsp"%>
        </div>
    </div>
</body>
</html>
