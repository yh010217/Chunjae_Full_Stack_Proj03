const checkobj={
    "memberpwconfirm":false
}
const pwd=document.getElementById("pwd");
const memberpwconfirm=document.getElementById("memberpwconfirm");
const pwmessage=document.getElementById("pwmessage");

pwd.addEventListener("input", ()=>{
    if (pwd.value.trim().length == 0){
        pwd.value="";
        pwmessage.innerText="영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요."
        pwmessage.classList.remove("confirm","error");//검정글씨
        checkobj.pwd=false
        return;
    }
    //정규표현식을 이용한 비밀번호 유효성 검사
    //영어 숫자, 특수문자 (!,@,#,-,_)6~20글자 사이
    const regEx= /^[A-Za-z0-9\!\@\#\-\_]{6,20}$/
    //입력한 비밀번호가 유요한 경우

    if(regEx.test(pwd.value)){
        checkobj.pwd=true;
        //비밀번호가 유효하게 작성된 상태에서
        // 비밀번호 확인이 입력되지 않았을 때
        if(memberpwconfirm.value.trim().length ==0){
            pwmessage.innerText="유효한 비밀번호 형식입니다.";
            pwmessage.classList.add("confirm");
            pwmessage.classList.remove("error");
        }else {
            //비밀번호가 유효하게 작성된 상태에서
            // 비밀번호 확인이 입력되어 있을 때

            //비밀번호 == 비밀번호 확인 (같은경우)
            if (memberpwconfirm.value == pwd.value){
                pwmessage.innerText="비밀번호가 일치 합니다.";
                pwmessage.classList.add("confirm");
                pwmessage.classList.remove("error");

                checkobj.memberpwconfirm=true;
            }else {//다른경우
                pwmessage.innerText="비밀번호가 일치하지 않습니다.";
                pwmessage.classList.remove("confirm");
                pwmessage.classList.add("error");
                checkobj.memberpwconfirm=false;
            }
        }
    }else {
        //유효하지 않은 경우
        pwmessage.innerText="비밀번호 형식이 유효하지 않습니다.";
        pwmessage.classList.add("error");
        checkobj.pwd=false;
    }
})
//비밀번호 확인 유효성 검사

memberpwconfirm.addEventListener("input",()=>{
    if (checkobj.pwd){ //비밀번호가 유효하게 작성된 경우에


        //비밀번호 == 비밀번호 확인(같은경우)
        if (memberpwconfirm.value==pwd.value){
            pwmessage.innerText="비밀번호가 일치합니다.";
            pwmessage.classList.add("confirm");
            pwmessage.classList.remove("error");

            checkobj.memberpwconfirm=true;
        }else { //다른경우
            pwmessage.innerText="비밀번호가 일치하지 않습니다.";
            pwmessage.classList.remove("confirm");
            pwmessage.classList.add("error");
            checkobj.memberpwconfirm=false;

        }

    }else { //비밀번호가 유효하지 않은 경우
        checkobj.memberpwconfirm=false;

    }
})

const tel=document.getElementById("tel");
const telMessage=document.getElementById("telMessage");

tel.addEventListener("input", ()=>{
    if (!tel.value.trim().length  ==0){
        //전화 번호가 입력되었을 때

        //정규식 유효성 검사

        const regEx=/^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;
        if (regEx.test(tel.value)){ //유효 0
            telMessage.innerText="유효한 전화번호입니다.";
            telMessage.classList.add("confirm");
            telMessage.classList.remove("error");
            checkobj.tel=true;

        }else { //무효
            telMessage.innerText="전화번호가 유효하지 않습니다.";
            telMessage.classList.add("error");
            telMessage.classList.remove("confirm");

            checkobj.tel=false;

        }

    }else {
        // 전화번화 입력되지 않았을 때
        telMessage.innerText="전화번호를 입력해주세요. (-제외)"
        telMessage.classList.remove("confirm","error");

        checkobj.tel=false;
    }
})
// 회원가입 form태그가 제출 되었을 때
document.getElementById("join_form").addEventListener("submit",(e)=>{
    //checkObj에 모든 value가 true인지 검사

    //(배열용 for 문)
    // for...of : 향상된 for  문
    //          -> interator (반복자) 속성을 지닌 배열, 유사배열 사용 가능

    //(객체용 for문)
    // for... in :
    // -> JS 객체가 가지고 있는 key를 순서대로 하나씩 꺼내는 반복문
    for (let key in  checkobj){
        if (!checkobj[key]){
            switch (key){
                case "pwd" : alert("비빌번호가 유효하지 않습니다."); break;
                case "tel" : alert("전화번호가 유효하지 않습니다."); break;
            }
            // 유효하지 않은 input태그로 focus이동
            // -key를 input의 id와 똑같이 설정
            document.getElementById(key).focus();
            // form 태그 기본 이벤트 제거
            e.preventDefault();
            return;//종료
        }

    }
})