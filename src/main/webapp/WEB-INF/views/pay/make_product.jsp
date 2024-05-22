<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-05-22
  Time: 오후 7:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<script>

    console.log('${lid}');
    console.log('${ltitle}');
    console.log('${price}');
    let str_price = '${price}';
    let int_price = parseInt(str_price);
    let sp_pname = '${lid}' + "_" + '${ltitle}';

    fetch('https://api.steppay.kr/api/v1/products', {
        method   : "POST"
        , mode   : "cors"
        , headers: {
            'Secret-Token'  : 'aee4d48d41817d0c804579817674db50d072f6b3d7503b4b7defaecbc0fa15bb'
            , 'Content-Type': 'application/json'
            , 'Accept'      : '*/*'
        }
        , body   : JSON.stringify({
            "type"          : "SOFTWARE",
            "status"        : "SALE",
            "enabledDemo"   : false,
            "demoPeriodUnit": "DAY",
            "useCombination": true,
            "name"          : sp_pname
        })
    }).then(response => {
        if (!response.ok) {
            return response.json().then(err => {
                console.error('Server Error:', err);
                throw new Error('Network response was not ok');
            });
        }
        return response.json();
    }).then(data => {
        console.log(data.name);
        console.log(data.id);
        console.log(data.code);

        //location.href = "/pay/success_product?email="+email_value+"&sp_uid=" + data.id;

        fetch('https://api.steppay.kr/api/v1/products/' + data.id + '/prices', {
            method   : "POST"
            , mode   : "cors"
            , headers: {
                'Secret-Token'  : 'aee4d48d41817d0c804579817674db50d072f6b3d7503b4b7defaecbc0fa15bb'
                , 'Content-Type': 'application/json'
                , 'Accept'      : '*/*'
            }
            , body   : JSON.stringify({
                "plan" : {
                    "name"       : "ONE_TIME-PRICE_PLAN",
                    "description": ""
                },
                "type" : "ONE_TIME",
                "price": int_price,  // 숫자로 입력
                "unit" : "case",
                //"basicServing": 100  // 숫자로 입력
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

            console.log(data.id);
            console.log(data.code);

            //이건 controller 에서 보내시고, 아직 PayController에서 조져야함. update query 조지는거.
            // (lid 통해 sp_pcode,sp_pplan)
            //location.href = "/lecdetail/" + '{lid}';
        }).catch(error => {
            console.error('Error:', error);
        });

    }).catch(error => {
        //location.href = '/pay/fail?error='+error;
    });

</script>

</body>
</html>
