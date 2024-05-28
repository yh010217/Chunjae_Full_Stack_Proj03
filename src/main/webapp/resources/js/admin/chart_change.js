window.onload = function () {
    upage_func(1);

    const ctx = document.getElementById('myChart');
    let labels_user = [];
    let data_user = [];
    for (let i = 8; i >= 1; i--) {
        labels_user.push(i + '달 전');
    }
    labels_user.push('최근');

//let hire_chart_data;
    fetch('/admin/chart/user', {
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
        //hire_chart_data = response.json();
        return response.json();
    }).then(res => {
        let container =
            document.getElementById('myChartContainer');
        let before =
            document.getElementById('myChart');
        container.removeChild(before);

        let ctx2 = document.createElement('canvas');
        ctx2.id = 'myChart';
        let res0 = res[0];
        console.log(res0);
        console.log(res0.unit1);
        new Chart(ctx2, {
            type: 'line',
            data: {
                labels  : labels_user,
                datasets: [{
                    label      : 'USER',
                    data       : [res0.unit1, res0.unit2, res0.unit3, res0.unit4, res0.unit5,
                        res0.unit6, res0.unit7, res0.unit8, res0.unit9],
                    borderColor: '#469B72',
                    tension    : 0.1
                }]
            }
        });
        container.appendChild(ctx2);
    }).catch(error => {
        console.error('Error:', error);
    });
}


let u_button = document.getElementById('user_chart');

u_button.onclick = function () {

    let selected_button = document.querySelector('.site_chart .selected');

    if(selected_button != null){
        selected_button.classList.toggle('selected');
    }
    u_button.classList.toggle("selected");

    const ctx = document.getElementById('myChart');
    let labels_user = [];
    for (let i = 8; i >= 1; i--) {
        labels_user.push(i + '달 전');
    }
    labels_user.push('최근');

    //let hire_chart_data;
    fetch('/admin/chart/user', {
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
        //hire_chart_data = response.json();
        return response.json();
    }).then(res => {
        let container =
            document.getElementById('myChartContainer');
        let before =
            document.getElementById('myChart');
        container.removeChild(before);

        let ctx2 = document.createElement('canvas');
        ctx2.id = 'myChart';
        let res0 = res[0];
        console.log(res0);
        console.log(res0.unit1);
        new Chart(ctx2, {
            type: 'line',
            data: {
                labels  : labels_user,
                datasets: [{
                    label: 'USER',
                    data : [res0.unit1, res0.unit2, res0.unit3, res0.unit4, res0.unit5,
                        res0.unit6, res0.unit7, res0.unit8, res0.unit9],
                    borderColor: '#469B72',
                    tension    : 0.1
                }]
            }
        });
        container.appendChild(ctx2);
    }).catch(error => {
        console.error('Error:', error);
    });

}



let per_week_button = document.getElementById('per_week_chart');

per_week_button.onclick = function () {

    let selected_button = document.querySelector('.site_chart .selected');

    if(selected_button != null){
        selected_button.classList.toggle('selected');
    }
    per_week_button.classList.toggle("selected");


    const ctx = document.getElementById('myChart');
    let labels_pay = [];
    for (let i = 6; i >= 1; i--) {
        labels_pay.push(i + '일 전');
    }
    labels_pay.push('오늘');

    fetch('/admin/chart/pay', {
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
        //hire_chart_data = response.json();
        return response.json();
    }).then(res => {
        let container =
            document.getElementById('myChartContainer');
        let before =
            document.getElementById('myChart');
        container.removeChild(before);

        console.log(res);
        let ctx2 = document.createElement('canvas');
        ctx2.id = 'myChart';
        let res0 = res[0];
        console.log(res0);
        console.log(res0.unit1);
        new Chart(ctx2, {
            type: 'line',
            data: {
                labels  : labels_pay,
                datasets: [{
                    label: 'PAY',
                    data : [res0.unit1, res0.unit2, res0.unit3, res0.unit4, res0.unit5,
                        res0.unit6, res0.unit7],
                    borderColor: '#469B72',
                    tension    : 0.1
                }]
            }
        });
        container.appendChild(ctx2);
    }).catch(error => {
        console.error('Error:', error);
    });
}

