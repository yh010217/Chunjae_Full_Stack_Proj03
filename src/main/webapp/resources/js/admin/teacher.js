
window.onload = function () {

   document.getElementById('idCheck').onclick = function () {
        let nvalue = document.getElementById('id').value;

        fetch('/idcheck?id=' + nvalue, {
            method: "GET"
            , mode: "cors"
            , headers: {
                'Accept': 'application/json'
            }
        }).then(result => {
            return result.json()
        }).then(data => {
            let able = document.getElementById('id_check_result');

            if (data.result == 0) {
                able.innerHTML = '';
                let text = document.createTextNode('회원 가입 후 등록이 가능합니다.');
                able.appendChild(text);
            } else {
                able.innerHTML = '';
                let text = document.createTextNode('등록 가능한 ID 입니다.');
                able.appendChild(text);
            }
        });
    }

}


// 강사 프로필 미리보기
document.addEventListener("DOMContentLoaded", function() {


    let fileInput = document.getElementById('file');
    let showDiv = document.getElementById('show');
    let img = showDiv.querySelector('img');

    fileInput.addEventListener('change', function (event) {
        let files = event.target.files;
        if (files && files[0]) {
            let reader = new FileReader();
            reader.onload = function (e) {
                img.src = e.target.result;
                showDiv.style.display = 'block';  // 이미지를 보여주기 위해 display 속성 변경
            };
            reader.readAsDataURL(files[0]); // 파일을 읽어서 데이터 URL로 변환
        }
    });









});








