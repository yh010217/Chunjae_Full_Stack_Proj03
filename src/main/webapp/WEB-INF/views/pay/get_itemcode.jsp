<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<script>

    let order_code = '${param.order_code}';
    let status = '${param.status}';
    let lid_attached = '${lid_attached}';
    let lid_size = lid_attached.split('_').length;

    fetch('https://api.steppay.kr/api/v1/orders/'+order_code, {
        method   : "GET"
        , mode   : "cors"
        , headers: {
            'Secret-Token': 'aee4d48d41817d0c804579817674db50d072f6b3d7503b4b7defaecbc0fa15bb'
            , 'Accept'    : '*/*'
        }
    }).then(response => {
        if (!response.ok) {
            return response.json().then(err => {
                console.error('Server Error:', err);
                throw new Error('Network response was not ok');
            });
        }
        return response.json();
    }).then(data => {
        console.log(data);
        //items 에 뭔가 있음
        console.log(status);
        console.log(lid_attached);
        let order_item_code =[];
        for(let i = 0 ; i < lid_size ; i ++){
            order_item_code.push(data.items[i].code);
        }
        console.log(order_item_code);

        location.href = '/pay/success_cart_insert?lid_attached='+lid_attached+'&order_item_code='+order_item_code
        +'&order_code='+order_code;

    }).catch(error => {
        console.error('Error:', error);
    });

</script>

</body>
</html>
