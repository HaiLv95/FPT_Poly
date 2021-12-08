<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container mt-2">
    <table class="table table-striped table-hover table-bordered border-primary">
        <thead>
        <tr>
            <th scope="col">VIDEO TITLE</th>
            <th scope="col">FAVORITE COUNT</th>
            <th scope="col">LASTEST DATE</th>
            <th scope="col">OLDEST DATE</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="favorite" items="${listFV}">
            <tr>
                <th scope="row">${favorite.title}</th>
                <td>${favorite.likes}</td>
                <td>${favorite.latestDate}</td>
                <td>${favorite.oldestDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
