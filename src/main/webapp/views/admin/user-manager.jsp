<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container-fluid">
    <!-- Content -->
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-user-list"
               href="#" role="tab" aria-controls="nav-video-list" aria-selected="false">User list
            </a>
            <a class="nav-link" id="nav-add-tab" data-bs-toggle="tab" data-bs-target="#nav-add"
               href="#" role="tab" aria-controls="nav-add" aria-selected="false">Add User
            </a>

        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-user-list" role="tabpanel" aria-labelledby="nav-user-list-tab">
            <jsp:include page="user-list.jsp"></jsp:include>
        </div>
        <div class="tab-pane fade" id="nav-add" role="tabpanel" aria-labelledby="nav-add-tab">
            <jsp:include page="user-add.jsp"></jsp:include>
        </div>
    </div>
    <!-- End Content -->
</div>
