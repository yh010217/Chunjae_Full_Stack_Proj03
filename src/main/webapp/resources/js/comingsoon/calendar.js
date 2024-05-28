document.addEventListener('DOMContentLoaded', function () {

    var calendarEl = document.getElementById('calendar');

    // '/comingsoon/event' 에서 이벤트 데이터를 가져옴
    fetch("/comingsoon/event")
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            // 응답을 Json 형식으로 변환
            return response.json();
        })
        .then(data => { // FullCalendar를 초기화하고 이벤트 데이터를 설정
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth'
                ,selectable: true
                ,headerToolbar: {
                    left: 'today',
                    center: 'title',
                    right: 'prev,next'
                }
                ,events: data   // title, start 값 들어옴
                ,dateClick: function(info) { // 날짜 클릭 시 실행
                    // 선택된 날짜에 해당하는 이벤트 데이터 필터링
                    var clickedDate = info.dateStr; // YYYY-MM-DD
                    var filteredEvents = data.filter(event => event.start.startsWith(clickedDate));

                    // 이벤트 목록을 HTML로 변환하여 표시
                    var eventList = document.getElementById('eventList'); // 이벤트 목록을 표시할 요소의 ID
                    eventList.innerHTML = ''; // 이전 목록 내용 클리어

                    // 필터링된 이벤트를 목록으로 추가
                    filteredEvents.forEach(event => {

                        var li = document.createElement('li');
                        li.classList.add('center-align'); // CSS 클래스 추가
                        // 제목, 날짜, 선생님 이름, 과목
                        li.innerHTML = `${event.start} 
                                        <a id="teacher" href="/index/lecdetail/${event.lid}">                 
                                        ${event.name} 선생님
                                        </a> 
                                         <a id="title" href="/index/lecdetail/${event.lid}">    
                                        ${event.title}
                                        </a>`;
                        eventList.appendChild(li);
                    });
                }
                ,locale : 'ko'
                ,dayCellContent : function (info) {
                    var number = document.createElement("a");
                    number.classList.add("fc-daygrid-day-number");
                    number.innerHTML = info.dayNumberText.replace("일","");
                    if(info.view.type === "dayGridMonth") {
                        return {
                            html: number.outerHTML
                        };
                    }
                    return {
                        domNodes: []
                    };
                }
                ,eventContent: function(arg) { // 과목별 배경색 설정
                    var colors = {
                        '영어': '#259a64',
                        '수학': '#67c7ee',
                        '국어': 'lightCoral',
                        '기타': 'lightGoldenRodYellow'
                    };

                    var backgroundColor = colors[arg.event._def.extendedProps.subject] || 'white'; // 과목에 따른 배경색 설정, 매칭되는 색상이 없으면 기본값으로 'white' 설정

                    // 이벤트 내용과 배경색을 설정한 HTML 요소 반환
                    return { html: `<div class='fc-event-main' style='background-color: ${backgroundColor};'>${arg.event.title}</div>` };
                }
            });
            // 캘린더를 화면에 렌더링
            calendar.render();
        })
        .catch(error => {
            console.error('fetch error:', error);
        });
});