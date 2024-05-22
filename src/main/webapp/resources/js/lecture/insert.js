document.getElementById("lprofile").onchange=function () {
    if(this.files && this.files[0]) {
        let reader = new FileReader;
        reader.onload = function(data) {
            $(".thumbnail img").attr("src", data.target.result).width(500);
        }
        reader.readAsDataURL(this.files[0]);
    }
}