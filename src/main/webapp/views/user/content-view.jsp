<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous">
<div class="container-fluid">
    <c:url var="url" value="/"></c:url>
    <div class="row justify-content-md-center mt-4">
        <!-- Video layout -->
        <div class="col-md-7">
            <div class="card mb-3">
                <iframe max-width="860" height="500px" src="https://www.youtube.com/embed/${video.id}"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                <div class="card-body">
                    <h5 class="card-title">${video.title}</h5>
                    <p class="card-text">${video.descriptions}</p>
                    <div class="row justify-content-end">
                        <div class="col-md-4">
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
                </div>
            </div>
        </div>
        <!-- End Video layout -->
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
                            <input class="form-control" type="email" name="sharedEmail" placeholder="Email address"
                                   required>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Send</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End Dialog Share -->
        <!-- List layout -->
        <div class="col-md-4 m-2">
            <c:forEach var="video" items="${listDX}">
                <div class="card mb-3" style="max-width: 540px;">
                    <a class="list-group-item list-group-item-action"
                       href="${pageContext.request.contextPath}/view?id=${video.id}" style="text-decoration: none">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="${pageContext.request.contextPath}/photos/${video.poster}"
                                     class="img-fluid rounded-start" alt="..."
                                     style="width: 146px;max-height: 100px;">
                            </div>
                            <div class="col-md-8 ps-1 mt-1">
                                <div class="card-body p-0 ">
                                    <h6 class="card-title">${video.title}</h6>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <!-- End List layout -->
    </div>
</div>
<!-- Script -->

<!-- End Script -->