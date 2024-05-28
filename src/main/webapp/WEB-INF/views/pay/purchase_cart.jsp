<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        iframe{
            width: 300px;
            height: 600px;
        }
    </style>
</head>
<body>
<div id="purchase_window"></div>
<script>

    let sp_uid = '${sp_uid}';
    let int_sp_uid = parseInt(sp_uid);
    let order_arr = [];
    let order_item ={};
</script>
<c:forEach var="lec" items="${lec_hmlist}">
    <script>
        order_item = {
            "currency"       : "KRW",
            "productCode"    : "${lec.sp_pcode}",
            "minimumQuantity": 1,
            "priceCode"      : "${lec.sp_pplan}"
        }
        order_arr.push(order_item);
    </script>
</c:forEach>
<script>
    console.log(order_arr);

    let fitems = [];


    fetch('https://api.steppay.kr/api/v1/orders', {
        method   : "POST"
        , mode   : "cors"
        , headers: {
            'Secret-Token'  : 'aee4d48d41817d0c804579817674db50d072f6b3d7503b4b7defaecbc0fa15bb'
            , 'Content-Type': 'application/json'
            , 'Accept'      : '*/*'
        }
        , body   : JSON.stringify({
            "items"     : order_arr,
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
    }).then(data => {
        console.log(data.orderId);
        console.log(data.orderCode);
        console.log(data.items);

        let oid = data.orderId;

        let ifr = document.createElement('iframe');
        ifr.src = 'https://api.steppay.kr/api/public/orders/'
            + oid + '/pay?successUrl=http://localhost:8080/pay/'+'${lid_attached}'+'/success_cart';

        let divp = document.getElementById('purchase_window');
        divp.appendChild(ifr);

    }).catch(error => {
        console.log(error);
        location.href='/pay/fail?error='+error;
    });

</script>
</body>
</html>
