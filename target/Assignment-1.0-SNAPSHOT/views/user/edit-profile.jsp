<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous">
    <title>Edit Profile</title>
</head>
<body>
<div class="container">
    <div class="col-md-12">
        <div class="col-md-6 offset-md-3">
            <h1 style="color: green;">Eit-Profile</h1>
            <!-- Thông báo -->
            <c:if test="${not empty msg}">
                <jsp:include page="/views/toast/toast_success.jsp"></jsp:include>
            </c:if>
            <c:if test="${not empty msgFailed}">
                <jsp:include page="/views/toast/toast_failed.jsp"></jsp:include>
            </c:if>
            <!-- url = /contextpath/value <=> /Lab5/usermanager -->
            <c:url var="url" value="/User/Edit-profile"/>
            <!-- Form -->
            <form action="${url}" method="post" class="form-group">
                <label class="form-label">Username</label>
                <input class="form-control" type="text" value="${user.username}"
                       name="id" placeholder="UserID" disabled> <br>
                <label class="form-label">Fullname</label>
                <input class="form-control"
                       name="fullname" value="${user.fullname}"> <br>
                <label class="form-label">Email</label>
                <input class="form-control"
                       name="email" type="email" value="${user.email}"> <br> <br>
                <hr>
                <button class="btn btn-success" style="margin-left: 15rem; width: 10rem">Cập nhật</button>
            </form>
        </div>
    </div>
</div>
<!-- Script -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>