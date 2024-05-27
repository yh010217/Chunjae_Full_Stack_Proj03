window.onload = function () {


}

// 선생님 프로필 미리보기
document.addEventListener("DOMContentLoaded", function() {

    var fileInput = document.getElementById('file');
    var showDiv = document.getElementById('show');
    var img = showDiv.querySelector('img');

    fileInput.addEventListener('change', function (event) {
        var files = event.target.files;
        if (files && files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                img.src = e.target.result;
                showDiv.style.display = 'block';  // 이미지를 보여주기 위해 display 속성 변경
            };
            reader.readAsDataURL(files[0]); // 파일을 읽어서 데이터 URL로 변환
        }
    });
});

