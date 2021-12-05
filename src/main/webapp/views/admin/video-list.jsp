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
                <td>    <a class="btn btn-danger" href="${url}/edit-video?id=${video.id}" >Edit</a> </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
