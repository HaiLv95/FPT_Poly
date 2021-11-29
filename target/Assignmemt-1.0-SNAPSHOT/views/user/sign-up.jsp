<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!-- url = /contextpath/value <=> /Lab5/usermanager -->
<c:url var="url" value="/Sign-up"/>
<div class="container">
    <div class="col-md-12">
        <div class="col-md-6 offset-md-3">
            <h1 style="color: green;">Sign-Up</h1>
            <!-- Thông báo -->
            <!-- Thông báo -->
            <c:if test="${not empty msg}">
                <jsp:include page="/views/toast/toast_success.jsp"></jsp:include>
            </c:if>
            <c:if test="${not empty msgFailed}">
                <jsp:include page="/views/toast/toast_failed.jsp"></jsp:include>
            </c:if>
            <!-- Form -->
            <form action="${url}" method="post" class="form-group needs-validation">

                <label class="form-label">Username</label>
                <input class="form-control" name="username" type="text" id="validationTooltipUsername" required><br>
                <label class="form-label">Fullname</label>
                <input class="form-control" name="fullname" type="text" id="validationTooltip01" required><br>
                <label class="form-label">Email</label>
                <input class="form-control" name="email" type="email" id="validationTooltip02" required><br>
                <label class="form-label">Password</label>
                <input class="form-control" name="password" type="password" id="validationTooltip03" required><br>
                <label class="form-label">Admin</label> <br>
                <input class="form-check-input" type="radio" name="admin"
                       value="true" checked="checked"> Admin
                <input class="form-check-input" type="radio" name="admin"
                       value="false"> User <br>
                <hr>
                <button class="btn btn-success" style="margin-left: 15rem; width: 10rem">Create</button>
            </form>
        </div>
    </div>
</div>