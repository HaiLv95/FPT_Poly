<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container">
    <c:url var="url" value="/admin"></c:url>
    <form enctype="multipart/form-data" method="post" class="form-group">
        <div class="row justify-content-md-center">
            <div class="col-md-3 m-4">
                <div class="border border-3">
                    <div class="text-center" style="width: 300px; height: 280px;">
                        <img src="${pageContext.request.contextPath}/photos/${video.poster}" class="rounded" id="poster" alt="..." style="width: 300px; height: 280px;">
                    </div>
                    <div class="mt-1">
                        <input class="form-control" type="file" id="choosePoster" name="poster" onchange="showPoster()" value="${video.poster}" required>
                    </div>
                </div>
            </div>
            <div class="col-md-8 mt-4">
                <label class="form-label">Youtube ID</label>
                <input type="text" class="form-control" value="${video.id}" name="id" readonly> <br>
                <label class="form-label">Youtube Title</label>
                <input type="text" class="form-control" value="${video.title}" maxlength="255" name="title" required><br>
                <label class="form-label">View Count</label>
                <input type="number" class="form-control" min="0" value="${video.views}" name="views" required><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="inlineCheckbox1" value="true" name="actives" ${video.actives ? 'checked':''}>
                    <label class="form-check-label" for="inlineCheckbox1" ${video.actives ? checked:""}>Active</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="inlineCheckbox2" value="false" name="actives" ${video.actives ? '':'checked'}>
                    <label class="form-check-label" for="inlineCheckbox2">In Active</label>
                </div>
            </div>
            <div class="col-md-11 ms-4">
                <label class="form-label">Description</label>
                <textarea class="form-control" rows="5" name="descriptions" maxlength="1000" required>${video.descriptions}</textarea>
            </div>
            <div class="col-md-6 mt-4">
                <button type="submit" class="btn btn-primary me-4" style="width: 7rem;" formaction="${url}/edit-video">Update</button>
                <button type="reset" class="btn btn-warning me-4" style="width: 7rem;">Reset</button>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        function showPoster() {
            var  fileSelected = document.getElementById('choosePoster').files;
            console.log("lenght", fileSelected)
            if (fileSelected.length > 0){
                var fileToLoad = fileSelected[0];
                var fileReader = new FileReader();
                fileReader.onload = function (fileLoaderEvent) {
                    var srcData = fileLoaderEvent.target.result;
                    var newImg = document.getElementById('poster');
                    newImg.src = srcData;
                    document.getElementById('poster').innerHTML = newImg.outerHTML;
                }
                fileReader.readAsDataURL(fileToLoad);
            }


        }
    </script>
</div>