<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!-- url = /contextpath/value <=> /Lab5/usermanager -->
<c:url var="url" value="/admin"/>
<div class="container">
    <div class="col-md-12">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 style="color: green;">USER MANAGER</h1>
                <!-- Form -->
                <form action="${url}/user-editor" method="post" class="form-group needs-validation">

                    <label class="form-label">Username</label>
                    <input class="form-control" name="username" type="text" id="validationTooltipUsername" value="${userEdit.username}" readonly><br>
                    <label class="form-label">Fullname</label>
                    <input class="form-control" name="fullname" type="text" id="validationTooltip01" value="${userEdit.fullname}" required><br>
                    <label class="form-label">Email</label>
                    <input class="form-control" name="email" type="email" id="validationTooltip02" value="${userEdit.email}" required><br>
                    <select class="form-select" aria-label="Default select example" name="admin">
                        <option value="true" ${userEdit.admin?"selected":""}>Admin</option>
                        <option value="false" ${userEdit.admin?"":"selected"}>User</option>
                    </select>
                    <hr>
                    <button class="btn btn-success" type="submit" style="margin-left: 15rem; width: 10rem">UPDATE</button>
                    <button class="btn btn-secondary ms-2" type="reset" style="margin-left: 15rem; width: 10rem">RESET</button>

                </form>
            </div>
        </div>
    </div>
</div>