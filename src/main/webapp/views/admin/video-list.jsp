<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:url var="url" value="/admin"></c:url>
<div class="container">
    <table class="table table-striped table-hover table-bordered border-primary">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Title</th>
            <th scope="col">Poster</th>
            <th scope="col">Description</th>
            <th scope="col">Views</th>
            <th scope="col">Active?</th>
            <th scope="col">Manager</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="video" items="${listVD}">
            <tr>
                <th scope="row">${video.id}</th>
                <td>${video.title}</td>
                <td>${video.poster}</td>
                <td>${video.descriptions}</td>
                <td>${video.views}</td>
                <td>${video.actives}</td>
                <td>
                    <a class="btn btn-primary" href="${url}/edit-video?id=${video.id}" >Edit</a> <br>
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
                            <h5 class="modal-title" id="staticBackdropLabel">Bạn có chắc chắn muốn xóa video "${video.id}" không? </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-footer">
                            <a href="${url}/delete-video?id=${video.id}" class="btn btn-primary">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Dialog Delete -->
        </c:forEach>
        </tbody>
    </table>

</div>
