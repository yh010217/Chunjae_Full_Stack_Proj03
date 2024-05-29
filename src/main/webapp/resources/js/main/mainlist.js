let typingTimer;
let doneTypingInterval = 100;

let searchInput = document.getElementById('main_search');
let result = document.getElementById('result_search');

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
            let link1 = document.createElement('a');
            link1.href = '/index/lecdetail/' + item.lid;
            link1.textContent = ' [강의 제목] ' + item.ltitle ;

            let link2 = document.createElement('a');
            link2.href = '/index/teacher/' + item.tid;
            link2.textContent = '[' + item.tsubject + '] ' + item.name

            listItem.appendChild(link2);
            listItem.appendChild(link1);
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

        fetch("/mainlistjson?main_search=" + search_data, {
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
        fetch("/mainlistjson?main_search=" + lastSearchData, {
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