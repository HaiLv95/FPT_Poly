<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container-fluid">
    <!-- Content -->
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-video-list"
                    type="button" role="tab" aria-controls="nav-video-list" aria-selected="false">Video list
            </button>
            <button class="nav-link" id="nav-edit-tab" data-bs-toggle="tab" data-bs-target="#nav-video-editor"
                    type="button" role="tab" aria-controls="nav-video-editor" aria-selected="true">Video Editor
            </button>
            <button class="nav-link" id="nav-add-tab" data-bs-toggle="tab" data-bs-target="#nav-add"
                    type="button" role="tab" aria-controls="nav-add" aria-selected="false">Add Video
            </button>

        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-video-list" role="tabpanel" aria-labelledby="nav-video-list-tab">
            <jsp:include page="video-list.jsp"></jsp:include>
        </div>
        <div class="tab-pane fade" id="nav-video-editor" role="tabpanel" aria-labelledby="nav-video-editor-tab">
            <jsp:include page="video-editor.jsp"></jsp:include>
        </div>
        <div class="tab-pane fade" id="nav-add" role="tabpanel" aria-labelledby="nav-add-tab">
            <jsp:include page="add-video.jsp"></jsp:include>
        </div>
    </div>
    <!-- End Content -->
</div>
<script type="text/javascript">
    function editVideo() {
        console.log("hello")
        var triggerEl = document.getElementById('nav-edit-tab');
        var tab = new bootstrap.Tab(triggerEl);
        tab.show();
    }
</script>