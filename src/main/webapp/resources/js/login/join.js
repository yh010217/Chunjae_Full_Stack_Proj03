let id_check = document.getElementById('id_check');
id_check.onclick = function () {
    let id_value = document.getElementById('id').value;
    fetch('checkId2?id=' + id_value, {
        method   : "GET"
        , mode   : "cors"
        , headers: {
            'Accept': 'application/json'
        }
    }).then(result => {
        return result.json()
    }).then(data => {
        let able = document.getElementById('id_check_result');

        if (data.result == 0) {
            able.innerHTML = '';
            let text = document.createTextNode('사용가능');
            able.appendChild(text);
        } else {
            able.innerHTML = '';
            let text = document.createTextNode('사용불가능');
            able.appendChild(text);
        }
    });
}


let ncheck = document.getElementById('nickname_check2');
ncheck.onclick = function () {
    let nvalue = document.getElementById('nickname').value;

    fetch('nickcheck?nickname=' + nvalue, {
        method   : "GET"
        , mode   : "cors"
        , headers: {
            'Accept': 'application/json'
        }
    }).then(result => {
        return result.json()
    }).then(data => {
        let able = document.getElementById('nickname_check_result2');

        if (data.result == 0) {
            able.innerHTML = '';
            let text = document.createTextNode('사용가능');
            able.appendChild(text);
        } else {
            able.innerHTML = '';
            let text = document.createTextNode('사용불가능');
            able.appendChild(text);
        }
    });

}

let echeck = document.getElementById('email_check2');
echeck.onclick = function () {

    let evalue = document.getElementById('email').value;
    if (!evalue.includes('@')) {

        let able = document.getElementById('email_check_result2');

        able.innerHTML = '';
        let text = document.createTextNode('이메일 형식에 맞춰주세요');
        able.appendChild(text);
    }
    else{
        fetch('echeck?email=' + evalue, {
            method   : "GET"
            , mode   : "cors"
            , headers: {
                'Accept': 'application/json'
            }
        }).then(result => {
            return result.json()
        }).then(data => {
            let able = document.getElementById('email_check_result2');

            if (data.result == 0) {
                able.innerHTML = '';
                let text = document.createTextNode('사용가능');
                able.appendChild(text);
            } else {
                able.innerHTML = '';
                let text = document.createTextNode('사용불가능');
                able.appendChild(text);
            }
        });
    }
}
