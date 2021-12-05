<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:url var="url" value="/user"/>
<div class="container">
    <div class="col-md-12">
        <div class="col-md-6 offset-md-3">
            <h1 style="color: green;">Change Password</h1>
            <!-- Form -->
            <form action="${url}/change-password" method="post" class="form-group">
                <input class="form-control" type="hidden" name="id"> <br>
                <label class="form-label">Username</label>
                <input class="form-control" name="username" type="text" value="${username}" disabled> <br>
                <label class="form-label">Old Password</label>
                <input class="form-control" name="password" type="password" required> <br>
                <label class="form-label">New Password</label>
                <input class="form-control"
                       name="newpassword" id="newpassword"
                       type="password" pattern="[a-zA-Z0-9]{4,30}"
                       title="Invalid character and from 4 to 30 characters" required> <br>
                <label class="form-label">Confirm New Password</label>
                <input class="form-control"
                       name="cfpassword" id="cfpassword"
                       type="password" pattern="[a-zA-Z0-9]{4,30}"
                       title="Invalid character and from 4 to 30 characters" required> <br><br>
                <button class="btn btn-success" style="margin-left: 15rem; width: 10rem" onclick="validatePassword()">Change Password</button>
            </form>
        </div>
    </div>
    <script>
        var newPass = document.getElementById("newpassword");
        var cfPass = document.getElementById("cfpassword");
        function validatePassword() {
            if (newPass.value != cfPass.value) {
                cfPass.setCustomValidity("Mật khẩu phải khớp với mật khẩu mới!");
                return false;
            } else {
                cfPass.setCustomValidity("");
                return true;
            }
        }

        newPass.onchange = validatePassword;
        cfPass.onkeyup = validatePassword;

    </script>
</div>