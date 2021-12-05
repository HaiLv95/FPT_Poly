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
                    <a href="#" class="mt-1"><img src="${pageContext.request.contextPath}/photos/${video.poster }"
                            class="card-img-top" alt="..." style="height: 15rem;"></a>
                    <div class="card-body">
                        <div style="height: 10rem">
                            <a href="#" class="link-dark" style="text-decoration: none">
                                <h6 class="card-title"> ${fn:toUpperCase(video.title)} </h6>
                            </a>
                        </div>
                        <button class="btn btn-primary ms-4">
                            Like
                            <span class="material-icons">
                            thumb_up
                        </span>
                        </button>
                        <button class="btn btn-success ms-4">Share
                            <span class="material-icons">
                            share
                        </span>
                        </button>
                    </div>
                </div>
            <!-- Video content end -->
        </c:forEach>
    </div>
    <!-- Change page  -->
    <div class="row justify-content-md-center">
        <div class="col-md-auto">
            <button class="btn btn-outline-secondary">
                    <span class="material-icons">
                        skip_previous
                    </span>
            </button>
            <button class="btn btn-outline-secondary">
                    <span class="material-icons">
                        arrow_left
                    </span>
            </button>
            <button class="btn btn-outline-secondary">
                    <span class="material-icons">
                        arrow_right
                    </span>
            </button>

            <button class="btn btn-outline-secondary">
                    <span class="material-icons">
                        skip_next
                    </span>
            </button>
        </div>
    </div>
    <!-- End Change page -->
</div>
<!-- Script -->

<!-- Script end -->