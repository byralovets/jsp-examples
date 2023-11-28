<%@ page import="java.util.List" %>
<%@ page import="by.ralovets.examples.bean.User" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%
    List<String> usernames = List.of("Anton", "Andrew", "Michail", "Vladimir");
    request.setAttribute("usernames", usernames);

    List<Double> doubles = List.of(1.0, 2.12345678, 3.141521);
    request.setAttribute("doubles", doubles);

    User user = new User();
    user.setId(1L);
    user.setName("Alexey");
    user.setSurname("Grigoriev");

    User user2 = new User();
    user2.setId(2L);
    user2.setName("Mihail");
    user2.setSurname("Stepanov");

    User user3 = new User();
    user3.setId(3L);
    user3.setName("Pyotr");
    user3.setSurname("Berezovsky");

    List<User> users = List.of(user, user2, user3);
    request.setAttribute("users", users);
%>

<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="messages"/>

<html>
    <head>
        <title><fmt:message key="main-page.header.message"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%@ include file="WEB-INF/jsp/bootstrap/styles-import.jsp"%>
    </head>
    <body class="container-md">
        <h2><fmt:message key="main-page.header.message"/></h2>

        <c:if test="${sessionScope.locale != null}">
            <p><fmt:message key="main-page.body.active-locale.message"/> <c:out value="${sessionScope.locale}"/></p>
        </c:if>

        <div>
            <p>
                <a href="<c:url value="/error-provider"/>">
                    <fmt:message key="default-error.link.name"/>
                </a>
            </p>
            <p>
                <a href="<c:url value="/unauthorized-provider"/>">
                    <fmt:message key="auth-error.link.name"/>
                </a>
            </p>
            <p>
                <a href="<c:url value="/unknown-error-provider"/>">
                    <fmt:message key="unknown-error.link.name"/>
                </a>
            </p>
            <p>
                <a href="<c:url value="/java-exception"/>">
                    <fmt:message key="servlet-error.link.name"/>
                </a>
            </p>
        </div>
        <div class="d-flex">
            <c:forEach var="user" items="${users}">
                <div class="card p-3">
                    <h2><c:out value="${user.id}"/></h2>
                    <p><c:out value="${user.name}"/></p>
                    <p><c:out value="${user.surname}"/></p>
                </div>
            </c:forEach>
        </div>
<%--        <div>--%>
<%--            <c:forEach var="name" items="${usernames}" varStatus="status">--%>
<%--                <div>--%>
<%--                    <h2>Пользователь:<c:out value=" ${name}"/></h2>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <c:forEach var="number" items="${doubles}">--%>
<%--                <p><fmt:formatNumber value="${number}" type="CURRENCY" currencySymbol="$" maxFractionDigits="3" minFractionDigits="2" /></p>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
        <%@ include file="WEB-INF/jsp/bootstrap/js-import.jsp"%>
    </body>
</html>
