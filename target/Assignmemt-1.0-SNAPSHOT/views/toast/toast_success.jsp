<%--
  Created by IntelliJ IDEA.
  User: hai95
  Date: 11/25/2021
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="position-fixed top-0 end-0 p-3" style="z-index: 11">
    <div class="toast align-items-center text-white bg-primary border-0" role="alert" aria-live="assertive"
         aria-atomic="true" id="myModalSuccess">
        <div class="d-flex">
            <div class="toast-body">
                ${msg}
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"
                    aria-label="Close"></button>
        </div>
    </div>
</div>