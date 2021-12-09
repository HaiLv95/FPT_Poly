<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container mt-2">
    <c:url var="url" value="/admin"></c:url>
    <form class="row g-12" action="${url}/reports-favorite-users" method="post">
        <div class="col-auto">
            <select  class="form-select" aria-label="Default select example" name="title">
                <c:forEach var="favorite" items="${listFV}">
                    <option>${favorite.title}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary mb-3">Find</button>
        </div>
    </form>
    <h5 class="mt-2 mb-2">Title: ${title}</h5>
    <table class="table table-striped table-hover table-bordered border-primary">
        <thead>
        <tr>
            <th scope="col">USERNAME</th>
            <th scope="col">FULLNAME</th>
            <th scope="col">EMAIL</th>
            <th scope="col">FAVORITE DATE</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="FVTitle" items="${listFVTitle}">
            <tr>
                <th scope="row">${FVTitle.username}</th>
                <td>${FVTitle.fullname}</td>
                <td>${FVTitle.emails}</td>
                <td>${FVTitle.likeDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
