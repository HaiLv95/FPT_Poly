<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container">
    <div class="col-md-12">
        <div class="row justify-content-md-center">
            <div class="col-md-6">
                <h1 style="color: green;">Eit-Profile</h1>
                <!-- url = /contextpath/value <=> /Lab5/usermanager -->
                <c:url var="url" value="/user/edit-profile"/>
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
                    <button class="btn btn-success" style="margin-left: 15rem; width: 10rem" data-bs-toggle="modal"
                            data-bs-target="#staticBackdrop" type="button">Cập nhật
                    </button>
                    <!-- Dialog Share -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                         tabindex="-1"
                         aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Share video</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <form action="${url}" method="post" class="form-group">
                                    <div class="modal-body">
                                        <label class="form-label">Bạn cần nhập mật khẩu để cập nhật thông tin: </label>
                                        <input class="form-control" type="password" name="passwordcf"
                                               placeholder="password">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- End Dialog Share -->
                </form>
            </div>
        </div>
    </div>
</div>