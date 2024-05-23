<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-05-22
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<script>
    console.log('${dto.email}');
    console.log('${dto.name}');
    let email_value = '${dto.email}';
    fetch('https://api.steppay.kr/api/v1/customers', {
        method   : "POST"
        , mode   : "cors"
        , headers: {
            'Secret-Token'  : 'aee4d48d41817d0c804579817674db50d072f6b3d7503b4b7defaecbc0fa15bb'
            , 'Content-Type': 'application/json'
            , 'Accept'      : '*/*'
        }
        , body   : JSON.stringify({
            "name" : "${dto.name}",
            "email": "${dto.email}"
        })
    }).then(response => {
        if (!response.ok) {
            return response.json().then(err => {
                console.error('Server Error:', err);
                throw new Error(err+'Network response was not ok');
            });
        }
        return response.json();
    }).then(data => {
        console.log(data.name);
        console.log(data.id);

        location.href = "/pay/success_customer?email="+email_value+"&sp_uid=" + data.id;
    }).catch(error => {
        location.href = '/pay/fail?error='+error;
    });

</script>

</body>
</html>
