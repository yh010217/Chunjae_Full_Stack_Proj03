const ctx = document.getElementById('myChart');

new Chart(ctx, {
    type: 'line',
    data: {
        labels  : [1, 2, 3, 4, 5, 6, 7],
        datasets: [
            {
                label      : 'My First Dataset',
                data       : [65, 59, 80, 81, 56, 55, 40],
                fill       : false,
                borderColor: 'rgb(75, 192, 192)',
                tension    : 0.1
            }
            , {
                label      : 'My Second Dataset',
                data       : [62, 50, 22, 77, 56, 80, 20],
                fill       : false,
                borderColor: 'rgb(192, 192, 192)',
                tension    : 0.05
            }
        ]
    }
});

document.getElementById('just_button').onclick = function () {

    //let hire_chart_data;
    fetch('/admin/chart_test/hire_chart', {
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
    }).then(data =>{
        let container =
            document.getElementById('myChartContainer');
        let before =
            document.getElementById('myChart');
        container.removeChild(before);

        let ctx2 = document.createElement('canvas');
        ctx2.id = 'myChart';

        new Chart(ctx2, {
            type: 'line',
            data: {
                labels  : [1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992],
                datasets: [
                    {
                        label : 'Female'
                        , data: [data.female.year1, data.female.year2, data.female.year3,
                            data.female.year4, data.female.year5, data.female.year6,
                            data.female.year7, data.female.year8]
                    }
                    ,
                    {
                        label : 'Male'
                        , data: [data.male.year1, data.male.year2, data.male.year3,
                            data.male.year4, data.male.year5, data.male.year6,
                            data.male.year7, data.male.year8]
                    }

                ]
            }
        });
                container.appendChild(ctx2);
    }).catch(error => {
        console.error('Error:', error);
    });

    /*
        .then(data => {
            let female_data = data.female;
            let year = 1985;
            console.log(female_data);
            console.log(female_data.year1);
            //console.log(female_data.year);
            console.log(data.male);
        })*/


    fetch("/user_chart"
        , {
            method   : 'GET'
            , headers: {
                "Content-Type": "application/x-www-form-urlencoded"
                , "Accept"    : "application/json"
            }
        })
        .then(res => {
            return res.json()
        }).then(data => {

        let container =
            document.getElementById('myChartContainer');
        let before =
            document.getElementById('myChart');
        container.removeChild(before);

        let ctx2 = document.createElement('canvas');
        ctx2.id = 'myChart';

        new Chart(ctx2, {
            type: 'line',
            data: {
                labels  : [1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992],
                datasets: [
                    {
                        label : 'Female'
                        , data: [data.female.year1, data.female.year2, data.female.year3,
                            data.female.year4, data.female.year5, data.female.year6,
                            data.female.year7, data.female.year8]
                    }
                    ,
                    {
                        label : 'Male'
                        , data: [data.male.year1, data.male.year2, data.male.year3,
                            data.male.year4, data.male.year5, data.male.year6,
                            data.male.year7, data.male.year8]
                    }

                ]
            }
        });
        container.appendChild(ctx2);
    });
}