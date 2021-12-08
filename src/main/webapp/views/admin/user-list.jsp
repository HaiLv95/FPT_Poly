<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:url var="url" value="/admin"></c:url>
<div class="container">
    <table class="table table-striped table-hover table-bordered border-primary">
        <thead>
        <tr>
            <th scope="col">USERNAME</th>
            <th scope="col">FULLNAME</th>
            <th scope="col">EMAIL</th>
            <th scope="col">ADMIN</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${listUs}">
            <tr>
                <th scope="row">${user.username}</th>
                <td>${user.fullname}</td>
                <td>${user.email}</td>
                <td>${user.admin}</td>
                <td>
                    <a class="btn btn-primary" href="${url}/user-editor?id=${user.username}" >Edit</a> <br>
                    <button class="btn btn-danger mt-1" id="delete" data-bs-toggle="modal"
                            data-bs-target="#staticBackdrop" >Delete</button>
                </td>
            </tr>
            <!-- Dialog Delete -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Bạn có chắc chắn muốn xóa video "${user.username}" không? </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-footer">
                            <a href="${url}/delete-user?id=${user.username}" class="btn btn-primary">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Dialog Delete -->
        </c:forEach>
        </tbody>
    </table>

</div>
