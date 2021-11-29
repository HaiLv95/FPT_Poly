<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${page.title}</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <%--    <script src="${pageContext.request.contextPath}/views/js/content-view.js" type="text/javascript">--%>
    <%--        console.log("hello")--%>
    <%--    </script>--%>

</head>
<body onload="ShowToast()">
<c:url var="url" value="/"></c:url>
<div class="container-fluid">
    <!-- Thông báo -->

    <c:if test="${not empty msg}">
        <jsp:include page="/views/toast/toast_success.jsp"></jsp:include>
    </c:if>
    <c:if test="${not empty msgFailed}">
        <jsp:include page="/views/toast/toast_failed.jsp"></jsp:include>
    </c:if>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light  bg-success">
        <div class="container-fluid">
            <a class="navbar-brand" href="${url}Home">ONLINE INTERTAMENT</a>
            <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active"
                           aria-current="page" href="${url}Favorite">MY FAVORITE</a></li>
                </ul>
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                       role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: black">
                        MY ACCOUNT </a>
                    <ul class="dropdown-menu bg-light"
                        aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="${url}Sign-in">Login</a></li>
                        <li><a class="dropdown-item" href="${url}User/Forgot-password">Forgot Password</a></li>
                        <li><a class="dropdown-item" href="${url}User/Sign-up"> Registration</a></li>
                        <li><a class="dropdown-item" href="${url}Sign-out">Log Off</a></li>
                        <li><a class="dropdown-item" href="${url}Change-password">Change Password</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="${url}User/Edit-profile">Edit Profile</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!-- Navbar end -->
    <!-- Content -->
    <jsp:include page="${page.contentUrl}"></jsp:include>
    <!-- Content end -->
    <!-- Footer -->
    <div class="container-fluid">
        <footer class="py-3 my-4">
            <ul class="nav justify-content-center border-top pb-3 mb-3">
                <li class="nav-item"><a href="#"
                                        class="nav-link px-2 text-muted">Home</a></li>
                <li class="nav-item"><a href="#"
                                        class="nav-link px-2 text-muted">About</a></li>
            </ul>
            <p class="text-center text-muted">&copy; Hailvph13040</p>
        </footer>
    </div>
    <!-- Footer end -->
</div>
<!-- Script -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous">
</script>
<script src="${pageContext.request.contextPath}/views/js/content-view.js" type="text/javascript">
</script>
<!-- Script -->
</body>
</html>