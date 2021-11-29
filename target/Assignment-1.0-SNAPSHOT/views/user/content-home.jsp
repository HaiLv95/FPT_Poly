<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="container-fluid">
    <div class="row ms-4">
        <!-- Video content -->
        <c:forEach var="video" items="listVideos">
            <div class="card m-4" style="width:20rem;">
                <img src="https://images.unsplash.com/photo-1561154464-82e9adf32764?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
                     class="card-img-top" alt="..." style="max-height: 15rem;">
                <div class="card-body">
                    <h5 class="card-title">Video title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                        card's content.</p>
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
        </c:forEach>
        <!-- Video content end -->
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