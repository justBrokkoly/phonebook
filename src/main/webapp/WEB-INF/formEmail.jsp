<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>New Email</title>
    <link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.7-1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/webjars/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="${path}/webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/static/js/jquery.boot.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <form:form method="post" class="form-horizontal" action="/saveEmail" modelAttribute="contactCommand">
                <form:hidden path="id"/>
                <label>Введите новый email</label>
                <form:input class="form-control" path="email" placeholder="Enter ur new email" required="true"/>
                <div class="help-block with-errors">
                    <form:errors path="email" cssClass="error"/>
                </div>
                <div class="help-block with-errors">
                    <label>${message}</label>
                </div>
                <form:button value="Save" class="btn btn-success">
                    <span class="glyphicon glyphicon-floppy-disk"></span>Save</form:button>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
