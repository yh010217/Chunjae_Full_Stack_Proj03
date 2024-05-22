<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-04-22
  Time: 오전 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
    <script defer src="/resources/js/addr.js"></script>
<%--    <script defer src="/resources/js/join_user.js"></script>--%>
<%--    <script defer src="/resources/js/userjoin.js"></script>--%>
    <link rel="stylesheet" href="/resources/css/login/join.css">
<%--    <script--%>
<%--            src="https://code.jquery.com/jquery-3.4.1.js"--%>
<%--            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="--%>
<%--            crossorigin="anonymous">--%>
<%--    </script>--%>
    <script>
        $(function (){
            $("#id_check").click(function (){
                let id=$("#id").val();
                $.ajax({
                    type:'post',
                    url:"/user/checkid",
                    data:{"id":id},
                    success:function (data){
                        if (data == "N"){
                            result="사용 가능한 아이디 입니다";
                            $("#id_check_result").html(result).css("color","green");
                            $("#pwd").trigger("focus");
                        }else {
                            result="이미 사용중인 아이디 입니다.";
                            $("#id_check_result").html(result).css("color","red");
                            $("#id").val("").trigger("focus");
                        }

                    },
                    error: function (error){alert(error);}
                });
            });
        });
    </script>

</head>
<body>

<div id="join">
    <h2>회원가입</h2>
    <form id="join_form" method="post" action="join_result">
<%--          onsubmit="return checkAll()">--%>
        <ul>
            <li>
                <div>
                <label for="id">아이디</label>
                <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요" required>
                <button type="button" name="id_check" id="id_check">중복확인</button>
<%--                        id="id_check" onclick="fn_id_check();" value="N">--%>
                <span id="id_check_result"></span>

<%--                <span class="id_check_re_1">사용 가능한 아이디입니다.</span>--%>
<%--                <span class="id_check_re_2">이미 존재하는 아이디입니다.</span>--%>
                </div>
            </li>
            <li>
                <label for="pwd">비밀번호</label>
                <input type="password" name="pwd" id="pwd" required>
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
                <input type="button"  id="sample6_postcode2" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" name="addr" id="sample6_address" placeholder="주소"><br>
                <input type="text" name="addr_detail" id="sample6_detailAddress" placeholder="상세주소">
                <input type="text" name="addr_extra" id="sample6_extraAddress" placeholder="참고항목">
            </li>
            <li>
                <label for="tel">휴대전화(-를 빼고 입력해주세요)</label>
                <input type="text" name="tel" id="tel" required>
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

<%--<script>--%>
<%--    $(document).ready(function(){--%>
<%--        //회원가입 버튼(회원가입 기능 작동)--%>
<%--        $("#joinBtn").click(function (){--%>
<%--            $("#join_form").attr("action","/member/join");--%>
<%--            $("#join_form").submit();--%>
<%--        });--%>
<%--    });--%>
<%--    //아이디 중복 검사--%>
<%--    $('#id_check').on("propertychange change keyup paste input", function (){--%>
<%--        console.log("keyup 테스트");--%>
<%--    });--%>
<%--</script>--%>




</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</html>
