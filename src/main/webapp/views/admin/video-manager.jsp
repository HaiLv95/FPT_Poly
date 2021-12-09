<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container-fluid">
    <!-- Content -->
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-video-list"
                    href="/admin/video-manager" role="tab" aria-controls="nav-video-list" aria-selected="false">Add Video
            </a>
            <a class="nav-link" id="nav-add-tab" data-bs-toggle="tab" data-bs-target="#nav-add"
                    href="#" role="tab" aria-controls="nav-add" aria-selected="false">Video list
            </a>

        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-video-list" role="tabpanel" aria-labelledby="nav-video-list-tab">
            <jsp:include page="add-video.jsp"></jsp:include>
        </div>
        <div class="tab-pane fade" id="nav-add" role="tabpanel" aria-labelledby="nav-add-tab">
            <jsp:include page="video-list.jsp"></jsp:include>
        </div>
    </div>
    <!-- End Content -->
</div>
