<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container">
    <form action="" class="form-group">
        <div class="row justify-content-md-center">
            <div class="col-md-3 m-4">
                <div class="border border-3">
                    <div class="text-center" style="width: 400px; height: 230px;">
                        <img src="..." class="rounded" alt="..." style="width: 400px; height: 230px;">
                    </div>
                    <div class="mb-3">
                        <label for="formFileMultiple" class="form-label">Hailvph13040@fpt.edu.vn</label>
                        <input class="form-control" type="file" id="formFileMultiple" multiple>
                    </div>
                </div>
            </div>
            <div class="col-md-8 mt-4">
                <label class="form-label">Youtube ID</label>
                <input type="text" class="form-control"> <br>
                <label class="form-label">Youtube Title</label>
                <input type="text" class="form-control"><br>
                <label class="form-label">View Count</label>
                <input type="number" class="form-control"><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="inlineCheckbox1" value="true" checked>
                    <label class="form-check-label" for="inlineCheckbox1">Active</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="inlineCheckbox2" value="false">
                    <label class="form-check-label" for="inlineCheckbox2">In Active</label>
                </div>
            </div>
            <div class="col-md-11 ms-4">
                <label class="form-label">Description</label>
                <textarea class="form-control" rows="5"></textarea>
            </div>
            <div class="col-md-6 mt-4">
                <button type="button" class="btn btn-primary me-4" style="width: 7rem;">Update</button>
                <button type="button" class="btn btn-danger me-4" style="width: 7rem;">Delete</button>
                <button type="button" class="btn btn-warning me-4" style="width: 7rem;">Reset</button>
            </div>
        </div>
    </form>
</div>