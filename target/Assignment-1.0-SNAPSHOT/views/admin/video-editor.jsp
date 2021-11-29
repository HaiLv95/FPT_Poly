<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
<div class="container">
    <form action="" class="form-group">
        <div class="row">
            <div class="col-md-3 m-4">
                <div class="border border-3">
                    <div class="text-center" style="width: 400px; height: 230px;">
                        <img src="..." class="rounded" alt="..." style="width: 400px; height: 230px;">
                    </div>
                    <div class="mb-3">
                        <label for="formFileMultiple" class="form-label">Multiple files input example</label>
                        <input class="form-control" type="file" id="formFileMultiple" multiple>
                    </div>
                </div>
            </div>
            <div class="col-md-8 mt-4">
                <label for="" class="form-label">Youtube ID</label>
                <input type="text" class="form-control"> <br>
                <label for="" class="form-label">Youtube Title</label>
                <input type="text" class="form-control"><br>
                <label for="" class="form-label">View Count</label>
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
                <label for="" class="form-label">Description</label>
                <textarea class="form-control" rows="5"></textarea>
            </div>
            <div class="col-md-6 offset-3 mt-4">
                <button type="button" class="btn btn-primary me-4" style="width: 7rem;">Create</button>
                <button type="button" class="btn btn-success me-4" style="width: 7rem;">Update</button>
                <button type="button" class="btn btn-danger me-4" style="width: 7rem;">Delete</button>
                <button type="button" class="btn btn-warning me-4" style="width: 7rem;">Reset</button>
            </div>
        </div>
    </form>
</div>
<!-- Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- Script end -->
</body>

</html>