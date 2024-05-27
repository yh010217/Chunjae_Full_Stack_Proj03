<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${pistatus eq 'one'}">
    <script>


        console.log('${hm.lprice}');
        console.log('${hm.sp_oitem}');

        let str_price = '${hm.lprice}';
        let lprice = parseInt(str_price);
        let sp_ocode = '${hm.sp_oitem}';

        fetch('https://api.steppay.kr/api/v1/orders/' + sp_ocode + '/cancel', {
            method: "PATCH"
            , mode: "cors"
            , headers: {
                'Secret-Token': 'aee4d48d41817d0c804579817674db50d072f6b3d7503b4b7defaecbc0fa15bb'
                , 'Content-Type': 'application/json'
                , 'Accept': '*/*'
            }
            , body: JSON.stringify({
                "requestPrice": lprice,
                "reason": "just"
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

            //사실 data 필요없음. 그냥 piid로 location 보내면 만사 해결
            location.href='/pay/refund_success/'+'${piid}';
        }).catch(error => {
            location.href = '/pay/fail?error=' + error;
        });

    </script>
</c:if>
<c:if test="${pistatus eq 'cart'}">
    <script>
        let str_price = '${hm.lprice}';
        let lprice = parseInt(str_price);
        let sp_ocode = '${hm.sp_ocode}';
        let sp_oitem = '${hm.sp_oitem}'

        fetch('https://api.steppay.kr/api/v1/orders/' + sp_ocode + '/cancel', {
            method: "PATCH"
            , mode: "cors"
            , headers: {
                'Secret-Token': 'aee4d48d41817d0c804579817674db50d072f6b3d7503b4b7defaecbc0fa15bb'
                , 'Content-Type': 'application/json'
                , 'Accept': '*/*'
            }
            , body: JSON.stringify({
                'order_item': sp_oitem,
                "requestPrice": lprice,
                "reason": "just"
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
            location.href='/pay/refund_success/'+'${piid}';
        }).catch(error => {
            location.href = '/pay/fail?error=' + error;
        });

    </script>
</c:if>

</body>
</html>
