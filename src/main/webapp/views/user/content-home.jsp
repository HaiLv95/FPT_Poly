<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="container-fluid">
    <c:url var="url" value="/"></c:url>
    <div class="row justify-content-md-start">
        <c:forEach var="video" items="${listVD}">
            <!-- Video content -->
                <div class="card m-2" style="width:20rem;">
                    <a href="${url}view?id=${video.id}" class="mt-1">
                        <img src="${pageContext.request.contextPath}/photos/${video.poster }"
                            class="card-img-top" alt="..." style="height: 12rem;"></a>
                    <div class="card-body">
                        <div style="height: 8rem">
                            <a href="${url}view?id=${video.id}" class="link-dark" style="text-decoration: none">
                                <h6 class="card-title"> ${fn:toUpperCase(video.title)} </h6>
                            </a>
                        </div>
                        <a class="btn btn-primary ms-4" href="${url}user/like?id=${video.id}">
                            Like
                            <span class="material-icons">
                            thumb_up
                        </span>
                        </a>
                        <button class="btn btn-success ms-4" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop">Share
                            <span class="material-icons">
                            share
                        </span>
                        </button>
                    </div>
                </div>
            <!-- Video content end -->
            <!-- Dialog Share -->
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Share video</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="${url}user/shared" method="post" class="form-group">
                            <div class="modal-body">
                                <input name="videoID" value="${video.id}" hidden>
                                <label class="form-label">Share "${video.id}" to:</label>
                                <input class="form-control" type="email" name="sharedEmail" placeholder="Email address" required>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Send</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Dialog Share -->
        </c:forEach>
    </div>
    <!-- Change page  -->
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <a class="btn btn-outline-secondary" href="${url}fist?pageNum=${pageNum}">
                    <span class="material-icons">
                        skip_previous
                    </span>
            </a>
            <a class="btn btn-outline-secondary" href="${url}pre?pageNum=${pageNum}" aria-readonly="true">
                    <span class="material-icons">
                        arrow_left
                    </span>
            </a>
            <input type="text" value="${pageNum}">
            <a class="btn btn-outline-secondary" href="${url}next?pageNum=${pageNum}">
                    <span class="material-icons">
                        arrow_right
                    </span>
            </a>

            <a class="btn btn-outline-secondary" href="${url}last?pageNum=${pageNum}">
                    <span class="material-icons">
                        skip_next
                    </span>
            </a>
        </div>
    </div>
    <!-- End Change page -->
</div>
<!-- Script -->

<!-- Script end -->