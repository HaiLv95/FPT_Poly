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
    <style>
        html, body {
            max-width: 100%;
            overflow-x: hidden;
        }
    </style>
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
            <%-- Navbar content --%>
            <c:choose>
                <c:when test="${sessionScope.user.admin}">
                    <jsp:include page="/views/admin/admin-navbar.jsp"></jsp:include>
                </c:when>
                <c:otherwise>
                    <jsp:include page="user-navbar.jsp"></jsp:include>
                </c:otherwise>
            </c:choose>
            <%-- Navbar content --%>
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
<script src="${pageContext.request.contextPath}/views/js/content-view.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/views/js/change-password.js" type="text/javascript"></script>
<!-- Script -->
</body>
</html>