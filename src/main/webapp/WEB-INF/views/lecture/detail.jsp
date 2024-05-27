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
                <c:when test="${sessionScope.id == 'admin'}">
                    <a href="/index/videoinsert/${item.lid}"> 강의 등록... 나중에 수정할래(클릭됨)</a>
                    <p>나중에 해당 선생님도 클릭할 수 있다는... 쿼리를 짜야 함... 할 게 많네... </p>
                </c:when>
                <c:otherwise>
                    아 아직 작업 안 함~~~! 쿼리짜~~~~!@!!
                </c:otherwise>
            </c:choose>
            <li class="lec_result">
                <button type="button" id="go_cart">장바구니</button>
                <a href="/pay/purchase_one?lid=${item.lid}">결제하기</a>
            </li>
            <br> <br>

        </ul>

        <%-- 강의 리스트 --%>
        <div class="class">
            <h3>강의 들어오는 자리</h3>
            <a href="/index/video/${item.lid}">누르면 플레이어 페이지로 이동</a>
            <p>바꿔야 할 것 => 수강 신청한 애들만 들어갈 수 있게 해야 함. 신청 안 했으면 경고창 띄우기</p>

            <br> <br>
            <ul>
                <c:forEach var="video" items="${video}">
                    <c:choose>
                        <c:when test="${video == '' || video == null || video.equals('')}">
                            <li>등록된 강의가 없습니다.</li>
                        </c:when>
                        <c:otherwise>
                            <li>${video.vtitle}</li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
        </div>

        <%-- 교재 --%>
        <div class="book">
            <h3>함께 보면 좋은 교재</h3>
            <a href="${item.lbook}">구매하러 가기</a>
            <div>주의할 점 : 지금은 누르면 오류뜸 (링크 안 넣어서...), 책 링크 DB 만들기</div>
        </div>
        <%-- 일대일문의--%>
        <div class="one">
            <c:choose>
            <%--관리자 로그인시 리스트가 보이도록--%>
                <c:when test="${sessionScope.id == 'admin'}">
                    <ul>
                        <li>
                            <h3>일대일문의답변</h3>
                            <a href="/index/onelist">일대일문의리스트</a>
                        </li>
                    </ul>
                </c:when>
            <%--로그인시 등록하기--%>
                <c:when test="${sessionScope.id != null || !sessionScope.id == 'admin'}">
                    <ul>
                        <li>
                            <h3>일대일문의</h3>
                            <a href="/index/oneinsert?lid=${item.lid}">일대일문의 등록하기</a>
                        </li>
                    </ul>
                </c:when>
            </c:choose>

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
</script>
</body>
</html>
