<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container text-center">
    <div class="row justify-content-md-center">
        <c:url var="url" value="/"></c:url>
        <main class="form-signin col-md-4">
            <!-- Thông báo -->
            <c:if test="${msg != null}">
                <jsp:include page="/views/toast/toast_success.jsp"></jsp:include>
            </c:if>
            <c:if test="${msgFailed != null}">
                <jsp:include page="/views/toast/toast_failed.jsp"></jsp:include>
            </c:if>
            <h1>${url}</h1>
            <%--  Form--%>
            <form action="${url}Sign-in" method="post">
                <img class="mb-4"
                     src="data:image/jpeg;base64,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"
                     alt="" width="72" height="57">
                <h1 class="h3 mb-3 fw-normal">Sign In</h1>

                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput"
                           name="username">
                    <label for="floatingInput">Username</label>
                </div>
                <div class="form-floating" style="margin-top: 1rem">
                    <input type="password" class="form-control" id="floatingPassword"
                           placeholder="Password" name="password">
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember"
                               name="remember"> Remember me
                    </label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                <a href="${url}sign-up" class="link-primary">Sign Up</a>
            </form>
        </main>
    </div>

</div>