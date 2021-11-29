function likeClick() {
    const like = document.getElementById("like");
    console.log("like", like);
}

function ShowToast() {
    console.log("showtoast");
    var myModalSuccess = document.getElementById('myModalSuccess')
    console.log("showtoast success", myModalSuccess);
    var myModalFailed = document.getElementById('myModalFailed')
    console.log("showtoast failed", myModalFailed);
    if (myModalSuccess != null) {
        var toast_success = new bootstrap.Toast(myModalSuccess);
        toast_success.show();
    } else {
        var toast_failed = new bootstrap.Toast(myModalFailed);
        toast_failed.show();
    }
}


