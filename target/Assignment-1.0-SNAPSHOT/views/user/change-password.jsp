<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:url var="url" value="/User"/>
<div class="container">
    <div class="col-md-12">
        <div class="col-md-6 offset-md-3">
            <h1 style="color: green;">Change Password</h1>
            <!-- Thông báo -->
            <h3>${msg }</h3>
            <!-- url = /contextpath/value <=> /Lab5/usermanager -->
            <!-- Form -->
            <form action="${url}Change-password" method="post" class="form-group">
                <input class="form-control" type="hidden" name="id"> <br>
                <label class="form-label">Username</label>
                <input class="form-control" name="username" type="text" disabled> <br>
                <label class="form-label">Old Password</label>
                <input class="form-control" name="password" type="password" required> <br>
                <label class="form-label">New Password</label>
                <input class="form-control" name="newpassword" id="newpassword" type="password" required> <br>
                <label class="form-label">Confirm New Password</label>
                <input class="form-control" name="cfpassword" id="cfpassword" type="password" required> <br><br>
                <button class="btn btn-success" style="margin-left: 15rem; width: 10rem">Change Password</button>
            </form>
        </div>
    </div>
</div>