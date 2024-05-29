<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일대일문의</title>
    <link rel="stylesheet"  href="/resources/css/one/oneinsert.css">
</head>
<body>

    <div class="oneinsert_form">
        <div id="form">
            <form method="post" action="/one_result">
                <h1>일대일 문의 게시판</h1>
                <div class="form-group row">
                    <label for="otitle" class="col-sm-2 col-form-label">제목</label>
                    <input type="text" name="otitle" class="form-control" id="otitle" />
                </div>
                <div class="form-group row">
                    <label for="osecret" class="col-sm-2 col-form-label">비밀글설정</label>
                    <input type="checkbox" name="osecret" class="form-control" id="osecret" />
                </div>
                <div class="form-group row">
                    <label for="ocontent" class="col-sm-2 col-form-label">내용</label>
                    <textarea type="text" name="ocontent" class="form-control" id="ocontent"></textarea>
                </div>
<%--                <input type="hidden" name="owriter" class="form-control" value="${sessionScope.id}"/>--%>
                <input type="hidden" class="form-control" id="uid" name="uid" value="${uid}"/>
                <input type="hidden" class="form-control" id="lid" name="lid" value="${lid}"/>
                <input id="append" type="submit" role="button" value="글쓰기" />

            </form>
        </div>

    </div>

</body>
</html>
    