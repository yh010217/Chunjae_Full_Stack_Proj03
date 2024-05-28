

let upage_func = function (page) {
    document.querySelector('#recent_table thead').innerHTML = '';
    document.querySelector('#recent_table tbody').innerHTML = '';
    document.querySelector('.table_paging').innerHTML = '';

    fetch('/admin/recent/user/' + page, {
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
        return response.json();
    }).then(result => {
        console.log(result);

        let th1 = document.createElement('th');
        th1.classList.add('table_user_id');
        let th1text = document.createTextNode('ID');
        th1.appendChild(th1text)
        let th2 = document.createElement('th');
        th2.classList.add('table_user_name');
        let th2text = document.createTextNode('이름');
        th2.appendChild(th2text)
        let th3 = document.createElement('th');
        th3.classList.add('table_user_email');
        let th3text = document.createTextNode('이메일');
        th3.appendChild(th3text)
        let th4 = document.createElement('th');
        th4.classList.add('table_user_join');
        let th4text = document.createTextNode('가입일');
        th4.appendChild(th4text)
        let th5 = document.createElement('th');
        th5.classList.add('table_user_sp');
        let th5text = document.createTextNode('sp_uid');
        th5.appendChild(th5text)
        let thtr = document.createElement('tr');
        thtr.appendChild(th1);
        thtr.appendChild(th2);
        thtr.appendChild(th3);
        thtr.appendChild(th4);
        thtr.appendChild(th5);
        let thead = document.querySelector('#recent_table thead');
        thead.appendChild(thtr);

        let list_size = result.user_list.length;
        for (let i = 0; i < list_size; i++) {
            let td1 = document.createElement('td');
            td1.classList.add('table_user_id');
            let td1text = document.createTextNode(result.user_list[i].id);
            td1.appendChild(td1text);
            let td2 = document.createElement('td');
            td2.classList.add('table_user_name');
            let td2text = document.createTextNode(result.user_list[i].name);
            td2.appendChild(td2text);
            let td3 = document.createElement('td');
            td3.classList.add('table_user_email');
            let td3text = document.createTextNode(result.user_list[i].email);
            td3.appendChild(td3text);
            let td4 = document.createElement('td');
            td4.classList.add('table_user_join');
            let td4text = document.createTextNode(result.user_list[i].joindate);
            td4.appendChild(td4text);
            let td5 = document.createElement('td');
            td5.classList.add('table_user_sp');
            let td5text = document.createTextNode(result.user_list[i].sp_uid);
            td5.appendChild(td5text);
            let tdtr = document.createElement('tr');
            tdtr.appendChild(td1);
            tdtr.appendChild(td2);
            tdtr.appendChild(td3);
            tdtr.appendChild(td4);
            tdtr.appendChild(td5);
            let tbody = document.querySelector('#recent_table tbody');
            tbody.appendChild(tdtr);
        }

        let paging_div = document.querySelector('.table_paging');


        let block_start = result.block_start;
        let block_end = result.block_end;

        if (result.prev) {
            let button_tag = document.createElement('button');
            button_tag.classList.add('page_button');
            button_tag.onclick = function(){
                upage_func(block_start - 1);
            }
            let button_text = document.createTextNode('이전');
            button_tag.appendChild(button_text);
            paging_div.appendChild(button_tag);
        }

        for (let i = block_start; i <= block_end; i++) {
            let button_tag = document.createElement('button');
            button_tag.classList.add('page_button');
            button_tag.onclick = function(){
                upage_func(i);
            }
            let button_text = document.createTextNode(i);
            button_tag.appendChild(button_text);
            paging_div.appendChild(button_tag);
        }

        if (result.next) {
            let button_tag = document.createElement('button');
            button_tag.classList.add('page_button');
            button_tag.onclick = function(){
                upage_func(block_end + 1);
            }
            let button_text = document.createTextNode('다음');
            button_tag.appendChild(button_text);
            paging_div.appendChild(button_tag);
        }
        let where_text = document.createTextNode(page+'/'+result.total);
        let where_span = document.createElement('span');
        where_span.appendChild(where_text);
        where_span.classList.add('where_page');
        paging_div.appendChild(where_span);

    }).catch(error => {
        console.error('Error:', error);
    });
}



let ruser_button = document.getElementById('user_recent');

ruser_button.onclick = function(){
    upage_func(1);
}

let ppage_func = function (page){

    document.querySelector('#recent_table thead').innerHTML = '';
    document.querySelector('#recent_table tbody').innerHTML = '';
    document.querySelector('.table_paging').innerHTML = '';

    fetch('/admin/recent/pay/' + page, {
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
        return response.json();
    }).then(result => {
        console.log(result);

        let th1 = document.createElement('th');
        th1.classList.add('table_pay_title');
        let th1text = document.createTextNode('강의제목');
        th1.appendChild(th1text)
        let th2 = document.createElement('th');
        th2.classList.add('table_pay_time');
        let th2text = document.createTextNode('결제일');
        th2.appendChild(th2text)
        let th3 = document.createElement('th');
        th3.classList.add('table_pay_price');
        let th3text = document.createTextNode('가격');
        th3.appendChild(th3text)
        let th4 = document.createElement('th');
        th4.classList.add('table_pay_order');
        let th4text = document.createTextNode('sp_order');
        th4.appendChild(th4text)
        let th5 = document.createElement('th');
        th5.classList.add('table_pay_user');
        let th5text = document.createTextNode('유저');
        th5.appendChild(th5text)
        let thtr = document.createElement('tr');
        thtr.appendChild(th4);
        thtr.appendChild(th1);
        thtr.appendChild(th2);
        thtr.appendChild(th5);
        thtr.appendChild(th3);

        let thead = document.querySelector('#recent_table thead');
        thead.appendChild(thtr);

        let list_size = result.pay_list.length;
        for (let i = 0; i < list_size; i++) {
            let td1 = document.createElement('td');
            td1.classList.add('table_pay_title');
            let td1text = document.createTextNode(result.pay_list[i].ltitle);
            td1.appendChild(td1text);
            let td2 = document.createElement('td');
            td2.classList.add('table_pay_time');
            let td2text = document.createTextNode(result.pay_list[i].ptime);
            td2.appendChild(td2text);
            let td3 = document.createElement('td');
            td3.classList.add('table_pay_price');
            let td3text = document.createTextNode(result.pay_list[i].lprice);
            td3.appendChild(td3text);
            let td4 = document.createElement('td');
            td4.classList.add('table_pay_order');
            let td4text = document.createTextNode(result.pay_list[i].sp_ocode);
            td4.appendChild(td4text);
            let td5 = document.createElement('td');
            td5.classList.add('table_pay_user');
            let td5text = document.createTextNode(result.pay_list[i].user);
            td5.appendChild(td5text);
            let tdtr = document.createElement('tr');
            tdtr.appendChild(td4);
            tdtr.appendChild(td1);
            tdtr.appendChild(td2);
            tdtr.appendChild(td5);
            tdtr.appendChild(td3);
            let tbody = document.querySelector('#recent_table tbody');
            tbody.appendChild(tdtr);
        }

        let paging_div = document.querySelector('.table_paging');


        let block_start = result.block_start;
        let block_end = result.block_end;

        if (result.prev) {
            let button_tag = document.createElement('button');
            button_tag.classList.add('page_button');
            button_tag.onclick = function(){
                ppage_func(block_start - 1);
            }
            let button_text = document.createTextNode('이전');
            button_tag.appendChild(button_text);
            paging_div.appendChild(button_tag);
        }

        for (let i = block_start; i <= block_end; i++) {
            let button_tag = document.createElement('button');
            button_tag.classList.add('page_button');
            button_tag.onclick = function(){
                ppage_func(i);
            }
            let button_text = document.createTextNode(i);
            button_tag.appendChild(button_text);
            paging_div.appendChild(button_tag);
        }

        if (result.next) {
            let button_tag = document.createElement('button');
            button_tag.classList.add('page_button');
            button_tag.onclick = function(){
                ppage_func(block_end + 1);
            }
            let button_text = document.createTextNode('다음');
            button_tag.appendChild(button_text);
            paging_div.appendChild(button_tag);
        }
        let where_text = document.createTextNode(page+'/'+result.total);
        let where_span = document.createElement('span');
        where_span.appendChild(where_text);
        where_span.classList.add('where_page');
        paging_div.appendChild(where_span);


    }).catch(error => {
        console.error('Error:', error);
    });
}

let rpay_button = document.getElementById('pay_recent');

rpay_button.onclick=function (){
    ppage_func(1);
}
