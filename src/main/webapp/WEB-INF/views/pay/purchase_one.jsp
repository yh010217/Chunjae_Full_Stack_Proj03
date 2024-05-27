<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-05-23
  Time: 오전 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        iframe{
            width:300px;
            height: 600px;
        }
    </style>
</head>
<body>
<div id="purchase_window"></div>
<script>

    //주문서를 만드는 과정부터 시작
    let str_sp_uid = '${sp_uid}';
    let int_sp_uid = parseInt(str_sp_uid);

    fetch('https://api.steppay.kr/api/v1/orders', {
        method   : "POST"
        , mode   : "cors"
        , headers: {
            'Secret-Token'  : 'aee4d48d41817d0c804579817674db50d072f6b3d7503b4b7defaecbc0fa15bb'
            , 'Content-Type': 'application/json'
            , 'Accept'      : '*/*'
        }
        , body   : JSON.stringify({
            "items"     : [
                {
                    "currency"       : "KRW",
                    "productCode"    : "${sp_pcode}",
                    "minimumQuantity": 1,
                    "priceCode"      : "${sp_pplan}"
                }
            ],
            "customerId": int_sp_uid
        })
    }).then(response => {
        // 응답 전체를 로그로 출력
        console.log('Response:', response);

        if (!response.ok) {
            return response.json().then(err => {
                console.error('Server Error:', err);
                throw new Error('Network response was not ok');
            });
        }
        return response.json();
    })
        .then(data => {
            console.log(data.orderId);
            console.log(data.orderCode);
            console.log(data.items);

            let oid = data.orderId;

            let ifr = document.createElement('iframe');
            ifr.src = 'https://api.steppay.kr/api/public/orders/'
                +oid+'/pay?successUrl=http://localhost:8080/pay/'+'${lid}'+'/success_one';

            let divp = document.getElementById('purchase_window');
            divp.appendChild(ifr);

        })
        .catch(error => {
            console.log(error);
            //location.href='/pay/fail?error='+error;
        });

</script>

</body>
</html>
