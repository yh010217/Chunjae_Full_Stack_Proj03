<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-21
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/lecture/list.css">
</head>
<body>
<article id="lecList">
    <%--<a href="/index/lectureinsert">추가하기</a>--%>
    <div class="lecList_top">
        <%-- 상단부 왼쪽--%>
        <div class="lecList_search">
            <h1>해영의 강의를 만나보세요.</h1>
            <div class="search">
                <label for="insert_search"></label>
                <input class="insert_search" id="insert_search" name="insert_search" type="text" placeholder="강의 제목을 입력하세요.">
                <img src="/resources/image/main/search.png" alt="search">
                <div id="search_result"></div>
            </div>
        </div>

        <%-- 상단부 오른쪽 --%>
        <div class="lecList_free">
            <h2>무료 강의</h2>
            <ul>
            <c:forEach var="freelist" items="${free}">
                <div class="freeList_li">
                    <li class="gradeli">${freelist.lgrade}학년</li>
                    <li><a href="/index/lecdetail/${freelist.lid}"> ${freelist.ltitle} </a></li>
                </div>
            </c:forEach>
            </ul>
        </div>
    </div>
    <%-- 전체 강의 리스트--%>
    <div class="all_lecture">

        <h2>전체 강의</h2>
        <ul>
        <c:forEach var="item" items="${list}">
            <li>
                <img class="lecList_img" src="/getImage/${item.lprofile}" alt="${item.ltitle}">
                <p class="li_2"> ${item.lgrade}학년 </p>
                <a class="li_3" href="/index/lecdetail/${item.lid}"> ${item.ltitle} </a>
                <p class="li_4"> ${item.lprice}원</p>
            </li>
        </c:forEach>
        </ul>
    </div>

</article>

<script>
    let typingTimer;
    let doneTypingInterval = 100;

    let searchInput = document.getElementById('insert_search');
    let result = document.getElementById('search_result');

    let lastSearchData = ''; // 마지막으로 검색한 데이터를 기억하기 위한 변수

    // 검색 결과를 보여주는 함수
    function showResults(data) {
        result.innerHTML = '';

        if (data.length === 0) {
            let noResultItem = document.createElement('li');
            noResultItem.textContent = "결과가 없습니다.";
            result.appendChild(noResultItem);
            result.classList.remove('search_result_active');
            result.classList.add('search_result_inactive');
            result.style.display = 'none'; // 검색 결과 숨기기
        } else {
            data.forEach(item => {
                let listItem = document.createElement('li');
                let link = document.createElement('a');
                link.href = '/index/lecdetail/' + item.lid;
                link.textContent = '[' + item.tsubject + '] ' + item.name + ' 선생님 > ' + item.ltitle ;
                console.log(link.textContent)
                listItem.appendChild(link);
                result.appendChild(listItem);
            });
            result.classList.add('search_result_active'); // 검색 결과가 있으면 활성 스타일 추가
            result.classList.remove('search_result_inactive'); // 비활성 스타일 제거
            result.style.display = 'block'; // 검색 결과 보이기
        }
    }

    // 검색어 입력란 이벤트 핸들러
    searchInput.onkeyup = function() {
        clearTimeout(typingTimer);
        typingTimer = setTimeout(function() {
            let search_data = searchInput.value.trim();
            if (search_data.length === 0) {
                result.innerHTML = '';
                result.classList.remove('search_result_active'); // 검색 결과가 없으면 활성 스타일 제거
                result.classList.add('search_result_inactive'); // 비활성 스타일 추가
                result.style.display = 'none'; // 검색 결과 숨기기
                return;
            }

            fetch("/listjson?insert_search=" + search_data, {
                method: "GET",
                headers: {'Accept': 'application/json'}
            }).then(response => {
                if (!response.ok) throw new Error('로드 실패');
                return response.json();
            }).then(data => {
                console.log(data, 'data');
                showResults(data); // 결과 표시 함수 호출
                lastSearchData = search_data; // 검색한 데이터 기억
            }).catch(error => {
                console.log(error);
                result.innerHTML = '';
                result.classList.remove('search_result_active');
                result.classList.add('search_result_inactive');
                result.style.display = 'none'; // 검색 결과 숨기기
            }).finally(() => console.log('finally'));
        }, doneTypingInterval);
    };

    // 검색 창 클릭 시 이전 결과 표시
    searchInput.addEventListener('focus', function() {
        if (lastSearchData.length > 0) {
            fetch("/listjson?insert_search=" + lastSearchData, {
                method: "GET",
                headers: {'Accept': 'application/json'}
            }).then(response => {
                if (!response.ok) throw new Error('로드 실패');
                return response.json();
            }).then(data => {
                showResults(data); // 이전 결과 표시
            }).catch(error => {
                console.log(error);
            });
        }
    });

    // 외부 클릭 시 검색 결과를 숨기는 코드
    function hideResults(event) {
        // 클릭한 요소가 검색 결과나 검색 입력창 자신이 아니라면
        if (event.target !== result && !result.contains(event.target) && event.target !== searchInput) {
            result.style.display = 'none'; // 검색 결과 숨기기
        }
    }

    document.addEventListener('click', hideResults);

</script>

</body>
</html>
