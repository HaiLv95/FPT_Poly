<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:url var="url" value="/"/>
<div class="container">
    <div class="col-md-12">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 style="color: green;">Forgot Password</h1>
                <!-- Form -->
                <form action="${url}forgot-password" method="post" class="form-group">
                    <label class="form-label">Username</label>
                    <input class="form-control" name="username" type="text" required> <br>
                    <label class="form-label">Email</label>
                    <input class="form-control" name="email" type="email" required> <br>
                    <button class="btn btn-success" style="margin-left: 15rem; width: 10rem">Forgot Password</button>
                    <a href="${url}sign-in" class="link-primary mb-2 mt-2">Sign in</a>
                </form>
            </div>
        </div>
    </div>
</div>