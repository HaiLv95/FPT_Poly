<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="container">
    <c:url var="url" value="/admin"></c:url>
    <form enctype="multipart/form-data" method="post" class="form-group">
        <div class="row">
            <div class="col-md-3 m-4">
                <div class="border border-3">
                    <div class="text-center" id="poster" style="width: 300px; height: 280px;">
                    </div>
                    <div class="mt-1">
                        <input class="form-control" type="file" id="choosePoster" name="poster" onchange="showPoster()">
                    </div>
                </div>
            </div>
            <div class="col-md-8 mt-4">
                <label class="form-label">Youtube ID</label>
                <input type="text" class="form-control" name="id"> <br>
                <label class="form-label">Youtube Title</label>
                <input type="text" class="form-control" name="title"><br>
                <label class="form-label">View Count</label>
                <input type="number" class="form-control" name="views"><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="inlineCheckbox1" name="actives" value="true" checked>
                    <label class="form-check-label" for="inlineCheckbox1">Active</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="inlineCheckbox2" name="actives" value="false">
                    <label class="form-check-label" for="inlineCheckbox2">In Active</label>
                </div>
            </div>
            <div class="col-md-11 ms-4">
                <label class="form-label">Description</label>
                <textarea class="form-control" rows="5" name="descriptions"></textarea>
            </div>
            <div class="col-md-6 offset-3 mt-4">
                <button type="submit" formaction="${url}/add-video" class="btn btn-primary me-4" style="width: 7rem;">Create</button>
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
                    var newImg = document.createElement('img');
                    newImg.src = srcData;
                    newImg.style = "width: 300px; height: 280px;";
                    document.getElementById('poster').innerHTML = newImg.outerHTML;
                }
                fileReader.readAsDataURL(fileToLoad);
            }


        }
    </script>
</div>
