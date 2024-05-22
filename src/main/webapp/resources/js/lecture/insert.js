document.getElementById("file").onchange=function () {
    if(this.files && this.files[0]) {
        let reader = new FileReader;
        reader.onload = function(data) {
            $(".thumbnail img").attr("src", data.target.result);
        }
        reader.readAsDataURL(this.files[0]);
    }
}