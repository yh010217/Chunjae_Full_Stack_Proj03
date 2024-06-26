let fetchLectures = function (status) {

    fetch('/mypage/lecture', {
        method : 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => response.json())
        .then(data => {
            const lectures = data;
            const contentDiv = document.getElementById('list');
            contentDiv.innerHTML = '';

            lectures.forEach(lecture => {
                if (status === 'All' || status === 'Ongoing') {

                    if (lecture.status == 'Ongoing') {

                        const lectureElement = document.createElement('div');
                        lectureElement.innerHTML = `
                <ul class="lecture_box">
                  <li><p class="lecture_status">수강중</p></li>
                  <li>[${lecture.tsubject}] ${lecture.name} 선생님</li>
                  <li>${lecture.ltitle}</li>
                  <li class="t">수강 기간 : ${lecture.startDate} ~ ${lecture.endDate}</li>
                  <li class="play_btn t"><a href="/index/lecdetail/${lecture.lid}"><img src="/resources/image/icon-play.png" alt="play">온라인 강의 시청하기</a></li>
                </ul>
          `;
                        contentDiv.appendChild(lectureElement);

                    }else if(lecture.status == 'Completed'){

                        const lectureElement = document.createElement('div');
                        lectureElement.innerHTML = `
                <ul class="lecture_box">
                  <li><p class="lecture_status">수강 완료</p></li>
                  <li>[${lecture.tsubject}] ${lecture.name} 선생님</li>
                  <li>${lecture.ltitle}</li>
                  <li class="t">수강 기간 : ${lecture.startDate} ~ ${lecture.endDate}</li>
                  <li class="play_btn t"><a href="/index/lecdetail/${lecture.lid}"><img src="/resources/image/icon-play.png" alt="play">온라인 강의 시청하기</a></li>
                </ul>
          `;
                        contentDiv.appendChild(lectureElement);
                    }


                }
            });
        })
        .catch(error => console.error('Error:', error));
}

let fetchLectures2 = function (status) {

    fetch('/mypage/lecture2', {
        method : 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => response.json())
        .then(data => {
            const lectures = data;
            const contentDiv = document.getElementById('list');
            contentDiv.innerHTML = '';

            lectures.forEach(lecture => {
                if (status === 'All' || status === 'Completed') {
                    const lectureElement = document.createElement('div');
                    lectureElement.innerHTML = `
            <ul class="lecture_box">
              <li><p class="lecture_status">수강 완료</p></li>
              <li>[${lecture.tsubject}] ${lecture.name} 선생님</li>
              <li>${lecture.ltitle}</li>
              <li class="t">수강 기간 : ${lecture.startDate} ~ ${lecture.endDate}</li>
            </ul>
          `;
                    contentDiv.appendChild(lectureElement);
                }
            });
        })
        .catch(error => console.error('Error:', error));

}

window.onload = function () {
    fetchLectures('Ongoing');
}

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("all").addEventListener("click", function () {
        fetchLectures('All');
    });
    document.getElementById("ing").addEventListener("click", function () {
        fetchLectures('Ongoing');
    });
    document.getElementById("completed").addEventListener("click", function () {
        fetchLectures2('Completed');
    });
});