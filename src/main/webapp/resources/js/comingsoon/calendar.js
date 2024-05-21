document.addEventListener('DOMContentLoaded', function () {

    fetch("/comingsoon"
        , {
            method   : "GET"
            , headers: {
                "Accept": "application/json"
            }
        }).then((response) => {
        if (!response.ok)
            throw new Error('not load');
        return response.json();
    }).then((data) => {
        console.log(data);

    }).catch(err => {
        console.log(err);
    });


    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView    : 'dayGridMonth'
        , headerToolbar: {
            left    : 'today'
            , center: 'title'
            , right : 'prev,next'
        }
        , events  : data
    });
    calendar.render();
});






