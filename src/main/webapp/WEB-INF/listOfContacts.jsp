<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Contacts List</title>
    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/webjars/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="${path}/webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/static/js/jquery.boot.js"></script>
</head>
<body>
<h2></h2>
<p></p>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>
                <span class="glyphicon glyphicon-info-sign"></span> Список контактов
            </strong>
            <div class="pull-right">
                <a href="/form"><span class="glyphicon glyphicon-plus-sign"></span> Добавить контакт</a>
            </div>
            <div><input class="form-control" id="myInput" type="text" placeholder="Поиск...по любому атрибуту"></div>
        </div>
        <div class="card">
            <div class="card-block">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th hidden>Contact id</th>
                        <th>имя</th>
                        <th>фамилия</th>
                        <th>адрес</th>
                        <th>email</th>
                        <th>телефоны</th>
                        <th>изменить</th>
                        <th>удалить</th>
                    </tr>
                    </thead>
                    <tbody id="myTable">
                    <c:forEach items="${contacts}" var="contact">
                        <tr>
                            <td hidden>${contact.id}</td>
                            <td>${contact.firstName}</td>
                            <td>${contact.lastName}</td>
                            <td>${contact.address}</td>
                            <td>${contact.email}</td>
                            <td>
                                <table><c:if test="${not empty fn:trim(contact.phoneNumberHome)}">
                                    <tr>
                                        <td>дом.т. :</td>
                                        <td>${contact.phoneNumberHome}</td>
                                    </tr>
                                </c:if>
                                    <c:if test="${not empty fn:trim(contact.phoneNumberWork)}">
                                        <tr>
                                            <td>раб.т.:</td>
                                            <td>${contact.phoneNumberWork}</td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${not empty fn:trim(contact.phoneNumberMobile)}">
                                        <tr>
                                            <td>моб.т.:</td>
                                            <td>${contact.phoneNumberMobile}</td>
                                        </tr>
                                    </c:if>
                                </table>
                            </td>
                            <td><a href="/contact/edit/${contact.id}"><span class="glyphicon glyphicon-edit"></span></a>
                            </td>
                            <td><a href="/contact/delete/${contact.id}"> <span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
