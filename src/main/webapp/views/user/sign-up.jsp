<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!-- url = /contextpath/value <=> /Lab5/usermanager -->
<c:url var="url" value="/"/>
<div class="container">
    <div class="col-md-12">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 style="color: green;">Sign-Up</h1>
                <!-- Form -->
                <form action="${url}sign-up" method="post" class="form-group needs-validation">

                    <label class="form-label">Username</label>
                    <input class="form-control" name="username" type="text" id="validationTooltipUsername" required><br>
                    <label class="form-label">Fullname</label>
                    <input class="form-control" name="fullname" type="text" id="validationTooltip01" required><br>
                    <label class="form-label">Email</label>
                    <input class="form-control" name="email" type="email" id="validationTooltip02" required><br>
                    <label class="form-label">Password</label>
                    <input class="form-control"
                           name="password" type="password"
                           id="validationTooltip03"
                           pattern="[a-zA-Z0-9]{4,12}"
                           title="Invalid character and from 4 to 12 characters" required><br>
                    <input class="form-control" name="admin" value="false" hidden>
                    <hr>
                    <button class="btn btn-success" style="margin-left: 15rem; width: 10rem">Create</button>
                </form>
                <a href="${url}sign-in" class="link-primary mb-2" >Sign In</a>
            </div>
        </div>
    </div>
</div>