<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script type="text/javascript" src="/resources/js/login/jquery-1.11.3.min.js"></script>
    <script defer src="/resources/js/login/addr.js"></script>
    <script defer src="/resources/js/login/pwd.js"></script>
    <link rel="stylesheet" href="/resources/css/login/join.css">


</head>
<body>

<div id="join">
    <h2>회원가입</h2>
    <form id="join_form" name="join_form" method="post" action="/join_result">
        <ul>
            <li>
                <div>
                    <label for="id">아이디</label>
                    <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" required>
                    <button type="button" name="id_check" id="id_check">중복확인</button>
                    <span id="id_check_result"></span>

                </div>
            </li>
            <li>

                <div class="signup-input-area">
                    <label for="pwd"><span class="required"></span>비밀번호</label>
                    <input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" required maxlength="20">
                </div>
                <div class="signup-input-area">
                    <input type="password" name="memberpwconfirm" id="memberpwconfirm" placeholder="비밀번호 확인해주세요" maxlength="20">
                </div>
                <span class="signup-message" id="pwmessage">영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</span>
            </li>
            <li>
                <label for="name">이름</label>
                <input type="text" name="name" id="name" required>
            </li>
            <li>
                <label for="nickname">닉네임</label>
                <input type="text" name="nickname" id="nickname" required>
                <button type="button" name="nickname_check2" id="nickname_check2">중복확인</button>
                <span id="nickname_check_result2"></span>

            </li>
            <li>
                <label>주소</label>
                <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호">
                <input type="button" id="sample6_postcode2" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" name="addr" id="sample6_address" placeholder="주소"><br>
                <input type="text" name="addr_detail" id="sample6_detailAddress" placeholder="상세주소">
                <input type="text" name="addr_extra" id="sample6_extraAddress" placeholder="참고항목">
            </li>
            <li>
                <label for="tel">전화번호</label>
                <input type="text" name="tel" id="tel" placeholder="(-없이 숫자만 입력)" maxlength="11" required>
                <span class="signUp-message" id="telMessage">전화번호를 입력해주세요.(- 제외)</span>
            </li>
            <li>
                <label for="email">이메일</label>
                <input type="email" name="email" id="email" required>
                <button type="button" name="email_check2" id="email_check2">중복확인</button>
                <span id="email_check_result2"></span>
            </li>
            <li>
                <label for="birthday">생년월일</label>
                <input type="date" name="birthday" id="birthday">
            </li>
            <li>
                <input type="submit" value="회원가입" id="joinBtn">
            </li>

        </ul>
    </form>
    <div id="down_btn">
        <a href="signup">이전</a>
    </div>
</div>
<div id="next">
    <a href="login">다음</a>
</div>



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수


                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }



                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script src="/resources/js/login/join.js"></script>
</body>
</html>
