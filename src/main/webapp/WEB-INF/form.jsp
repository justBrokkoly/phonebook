<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Contact Save</title>
    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/webjars/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="${path}/webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/static/js/jquery.boot.js"></script>
</head>
<style>
    .error {
        color: #ff0000;
    }
</style>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <h1 class="text-center"></h1>
            <c:choose>
                <c:when test="${not empty contact.id}">
                    <h1 class="text-center">Изменить контакт</h1>
                </c:when>
                <c:otherwise>
                    <h1 class="text-center">Добавить новый контакт</h1>
                </c:otherwise>
            </c:choose>
            <form:form method="post" class="form-horizontal" action="/add" modelAttribute="contact">
                <form:hidden path="id"/>
                <div class="controls">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Имя *</label>
                                <form:input class="form-control" path="firstName" placeholder="Enter ur name"
                                            required="true"/>
                                <div class="help-block with-errors">
                                    <form:errors path="firstName" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-offset-5">
                            <div class="form-group">
                                <label>Адрес </label>
                                <form:input class="form-control" path="address" placeholder="Enter ur name"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Фамилия *</label>
                                <form:input class="form-control" path="lastName" placeholder="Enter ur lastName"
                                            required="true"/>
                                <div class="help-block with-errors">
                                    <form:errors path="lastName" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-offset-5">
                            <div class="form-group">
                                <label>Мобильный телефон *</label>
                                <form:input class="form-control" path="phoneNumberMobile" placeholder="Enter ur name"/>
                                <div class="help-block with-errors">
                                    <form:errors path="phoneNumberMobile" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Email :</label>
                                <c:choose>
                                    <c:when test="${empty contact.id}">
                                        <form:input class="form-control" path="email" placeholder="Enter ur name"/>
                                        <div class="help-block with-errors">
                                            <form:errors path="email" cssClass="error"/>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <p>
                                            <label>${contact.email}</label>
                                        </p>
                                        <p><a href="/contact/edit/${contact.id}/changeEmail">Изменить email</a></p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-md-offset-5">
                            <div class="form-group">
                                <label>Рабочией телефон</label>
                                <form:input class="form-control" path="phoneNumberWork" placeholder="Enter ur name"/>
                                <div class="help-block with-errors">
                                    <form:errors path="phoneNumberWork" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-5">
                            <div class="form-group">
                                <label>Домашний телефон</label>
                                <form:input class="form-control" path="phoneNumberHome" placeholder="Enter ur name"/>
                                <div class="help-block with-errors">
                                    <form:errors path="phoneNumberHome" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <form:button value="Save" class="btn btn-success">
                                <span class="glyphicon glyphicon-floppy-disk"></span>Save</form:button>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
