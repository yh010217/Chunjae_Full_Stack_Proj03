$(document).ready(function (){
    $(".cencle").on("click",function (){
        location.href="/"
    })
    $("submit").on("click",function (){
        if ($("nickname".val()=="")){
            alert("닉네임을 입력해주세요")
            return false;
        }
        var nickname_check=$("nickname_check").val();
        if (nickname_check =="N"){
            alert("중복확인 버튼을 눌러누세요");
        }else if (nickname_check=="Y"){
            $("user_modifyform").submit();
        }
    });
})

let nickcheck=document.getElementById('nickname_check');
nickcheck.onclick=function (){
    let nvalue=document.getElementById('nickname').value;
    fetch('/nickcheck2?nickname='+nvalue,{
        method : "GET"
        ,mode  : "cors"
        ,headers :{
            'Accept' : 'application/json'
        }
    }).then(result => {
        return result.json()
    }).then(data => {
        let able = document.getElementById('nickname_check_result');
        if (data.result== 0){
            able.innerHTML = '';
            let text = document.createTextNode('사용가능');
            able.appendChild(text);
        }else {
            able.innerHTML='';
            let text=document.createTextNode('사용불가능');
            able.appendChild(text);
        }
    });
}
