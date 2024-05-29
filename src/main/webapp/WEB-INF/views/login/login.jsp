
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<html>
<head>
    <meta charset="UTF-8">
    <title>loginform</title>
    <link rel="stylesheet" href="/resources/css/login/login.css">
    <script>
        $(function (){
            $(".login_btn").click(function (){
                id=$("#id").val();
                var pwd=$("#pwd").val();if (id==""){
                    alert("아이디를 입력하세요");
                    $("#id").focus();
                    return;
                }
                if (pwd==""){
                    alert("비밀번호를 입력하세요");
                    $("#pwd").focus();
                    return;
                }
            })
        });
    </script>
</head>
<body>


<article id="form-signupin">
    <div>
        <form class="writeForm" method="post" action="/login_check">
            <h1>로그인</h1>
            <div>
                <input type="text"  name="id" placeholder="아이디" class="input_btn" required>
            </div>
            <div>
                <input type="password"  name="pwd" placeholder="비밀번호" class="input_btn" required>
            </div>
            <div>
                <input class="login_btn" type="submit" value="로그인">
            </div>
            <c:if test="${message == 'error'}">
                <div style="color:red";>아이디 또는 비밀번호가 일치하지 않습니다.</div>
            </c:if>
            <ul>
                <li>처음이신가요? <a href="signup" class="join_btn"> 회원가입</a></li>
            </ul>
        </form>
    </div>
</article>

</body>
</html>
