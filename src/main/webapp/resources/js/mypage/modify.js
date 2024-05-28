window.onload = function () {
    
    let nickcheck = document.getElementById('nicknameCk');
    nickcheck.onclick = function () {
        let nvalue = document.getElementById('nickname').value;

        fetch('/nickcheck?nickname=' + nvalue, {
            method: "GET"
            , mode: "cors"
            , headers: {
                'Accept': 'application/json'
            }
        }).then(result => {
            return result.json()
        }).then(data => {
            let able = document.getElementById('nickname_check_result');

            if (data.result == 0) {
                able.innerHTML = '';
                let text = document.createTextNode('사용 가능한 닉네임입니다.');
                able.appendChild(text);
            } else {
                able.innerHTML = '';
                let text = document.createTextNode('이미 존재하는 닉네임입니다.');
                able.appendChild(text);
            }
        });

    }

    let emailcheck = document.getElementById('emailCk');
    emailcheck.onclick = function () {

        let evalue = document.getElementById('email').value;
        if (!evalue.includes('@')) {

            let able = document.getElementById('email_check_result2');

            able.innerHTML = '';
            let text = document.createTextNode('이메일 형식에 맞춰주세요.');
            able.appendChild(text);
        } else {
            fetch('/echeck?email=' + evalue, {
                method: "GET"
                , mode: "cors"
                , headers: {
                    'Accept': 'application/json'
                }
            }).then(result => {
                return result.json()
            }).then(data => {
                let able = document.getElementById('email_check_result');

                if (data.result == 0) {
                    able.innerHTML = '';
                    let text = document.createTextNode('사용 가능한 이메일입니다.');
                    able.appendChild(text);
                } else {
                    able.innerHTML = '';
                    let text = document.createTextNode('이미 존재하는 이메일입니다.');
                    able.appendChild(text);
                }
            });
        }


    }
}