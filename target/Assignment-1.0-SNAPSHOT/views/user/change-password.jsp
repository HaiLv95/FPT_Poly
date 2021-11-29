<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Change-Pasword</title>
</head>
<body>
<c:url var="url" value="/account"/>
<div class="container">
    <div class="col-md-12">
        <div class="col-md-6 offset-md-3">
            <h1 style="color: green;">Change Password</h1>
            <!-- Thông báo -->
            <h3>${msg }</h3>
            <!-- url = /contextpath/value <=> /Lab5/usermanager -->
            <!-- Form -->
            <form action="${url}/sign-up" method="post" class="form-group">
                <input class="form-control" type="hidden" name="id"> <br>
                <label class="form-label">Username</label>
                <input class="form-control" name="username" type="text"> <br>
                <label class="form-label">Old Password</label>
                <input class="form-control" name="password" type="password"> <br>
                <label class="form-label">New Password</label>
                <input class="form-control" name="newpassword" type="password"> <br>
                <label class="form-label">Confirm New Password</label>
                <input class="form-control" name="cfpassword" type="password"> <br>

                <button class="btn btn-success" style="margin-left: 15rem; width: 10rem">Change Password</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>