
document.getElementById('user_chart').onclick = function () {


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
                    label      : 'My First Dataset',
                    data       :[res0.unit1,res0.unit2,res0.unit3,res0.unit4,res0.unit5,
                        res0.unit6,res0.unit7,res0.unit8,res0.unit9],
                }]
            }
        });
        container.appendChild(ctx2);
    }).catch(error => {
        console.error('Error:', error);
    });

}