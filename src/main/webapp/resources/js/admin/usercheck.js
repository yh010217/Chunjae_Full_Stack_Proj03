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