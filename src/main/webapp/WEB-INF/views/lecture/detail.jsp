<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-21
  Time: 오후 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/lecture/detail.css">
</head>
<body>
    <article id="lecDetail">
        <c:set var="item" value="${dto}"/>
        <ul class="lec_title">
            <li>
                <div class="lecDetail_img">
                    <img class="lecList_img" src="/getImage/${item.lprofile}" alt="${item.lprofile}">
                </div>
            </li>
            <li class="lecDetail_intro">${item.lintro}</li>
            <li class="lecDetail_title">${item.ltitle}</li> <%--과목 이름--%>
            <li class="lecDetail_teacher">
                <span class="span1">${item.tsubject}</span> <span class="span2">${item.name} </span> 선생님
            </li>
            <div class="division-line"></div> <%-- 구분선 --%>
            <li class="lecDetail_etc">
                <span>${item.lgrade}학년</span>
                <span>총 ${item.lcount}강</span>
                <span>${item.lperiod}일</span>
            </li>
            <li class="lec_price">${item.lprice}원</li>

            <c:choose>
                <c:when test="${sessionScope.id == null}"> <%-- 로그인 안 한 상태 --%>
                    <li class="lec_result">
                        <a href="/index/login">로그인하기</a>
                    </li>
                </c:when>
                <c:when test="${sessionScope.id == 'admin' || sessionScope.id == tid}"> <%-- 관리자 & 과목 선생님--%>
                    <li class="lec_result">
                        <a href="/index/videoinsert/${item.lid}"> 강의 등록</a>
                        <a href="/index/video/${item.lid}">강의 보기</a>
                    </li>
                </c:when>
                <c:when test="${sessionScope.id == userid}"> <%-- 결제한 사람 --%>
                    <li class="lec_result">
                        <a href="/index/video/${item.lid}">강의 보기</a>
                    </li>
                </c:when>
                <c:when test="${sessionScope != null}"> <%-- 로그인은 했는데 결제는 안 한 상태--%>
                    <li class="lec_result">
                        <button type="button" id="go_cart">장바구니</button>
                        <button type="button" onclick="openWindow()">결제하기</button>
                    </li>
                </c:when>
                <c:otherwise>
                    무언가 오류가 있는 상태
                </c:otherwise>
            </c:choose>
            <br> <br>

        </ul>

        <%-- 강의 리스트 --%>
        <div class="class">
            <h3>강의 들어오는 자리</h3>
            <ul>
                <c:forEach var="video" items="${video}">
                    <li>${video.vtitle}</li>
                </c:forEach>
            </ul>
        </div>

        <%-- 교재 --%>
        <div class="book">
            <h3>함께 보면 좋은 교재</h3>
            <a href="${item.lbook}">구매하러 가기</a>
            <div>주의할 점 : 지금은 누르면 오류뜸 (링크 안 넣어서...), 책 링크 DB 만들기</div>
        </div>

        <div>
            <c:if test="${sessionScope.id == 'admin' || sessionScope.id == tid}">
                <button onclick="removeCheck()"> 강의 삭제</button> <%-- 강의 전체가 지워짐 --%>
            </c:if>
        </div>

    </article>


<script>

    document.getElementById('go_cart').onclick=function (){
        //fetch로 할거는 다 하고 이래이래해야할듯
        fetch('/insert_cart?lid='+'${item.lid}',{
            method   : "GET"
            , mode   : "cors"
            , headers: {
                'Accept': 'application/json'
            }
        }).then(response => {
            if (!response.ok) {
                return response.json().then(err => {
                    console.error('Server Error:', err);
                    throw new Error('Network response was not ok');
                });
            }
            console.log('별 문제 없기를');
        }).catch(error => {
            console.error('Error:', error);
        }).finally(()=>{
            if (confirm("장바구니에 추가되었습니다 \n 장바구니로 이동하시겠습니까?") == true){    //확인
                location.href='/index/mypage/cart';
            }else{   //취소
                return false;
            }
        });
    }

    function openWindow () {
        const options = 'width=320, height=625, top=50, left=50, scrollbars=no, resizable=no, location=no, toolbars=no, status=no, directories=no'
        window.open('/pay/purchase_one?lid=${item.lid}','_blank', options)
    }

    function removeCheck() {
        if (confirm("강의를 삭제하시겠습니까?") == true) {    // 정말 삭제할 건지 확인
            location.href='/lectureDelete/${item.lid}';
            location.href='/index/lecturelist'
        } else {   //취소
            return false;
        }
    }

</script>
</body>
</html>
