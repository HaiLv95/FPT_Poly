<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="container-fluid">
    <div class="row justify-content-md-center mt-4">
        <!-- Video layout -->
        <div class="col-md-7">
            <div class="card mb-3">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/Rcg2ljKWTuw"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                        additional content.
                        This content is a little bit longer.</p>
                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    <div class="row justify-content-end">
                        <div class="col-md-4">
                            <button class="btn btn-primary ms-4" onclick="likeClick()">
                                Like
                                <span class="material-icons">
                                        thumb_up
                                    </span>
                            </button>
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
                    <form action="" class="form-group">
                        <div class="modal-body">
                            <label class="form-label">Share to:</label>
                            <input class="form-control" type="email" placeholder="email">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">Send</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End Dialog Share -->
        <!-- List layout -->
        <div class="col-md-4 m-2">
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="https://images.unsplash.com/photo-1561154464-82e9adf32764?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
                             class="img-fluid rounded-start m-2" alt="..." style="width: 360px;max-height: 120px;">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End List layout -->
    </div>
</div>
<!-- Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="./js/content-view.js"></script>
<!-- End Script -->