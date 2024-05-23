<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일대일문의</title>
</head>
<body>

    <div class="container">
        <form action="/post" method="one_result">
            <div class="form-group row">
                <label for="otitle" class="col-sm-2 col-form-label"><strong>제목</strong></label>
                <div class="col-sm-10">
                    <input type="text" name="title" class="form-control" id="otitle" />
                </div>
            </div>
            <div class="form-group row">
                <label for="osecret" class="col-sm-2 col-form-label">비밀글설정</label>
                <div class="col-sm-10">
                    <input type="checkbox" name="osecret" class="form-control" id="osecret" />
                </div>
            </div>
            <div class="form-group row">
                <label for="ocontent" class="col-sm-2 col-form-label"><strong>내용</strong></label>
                <div class="col-sm-10">
                    <textarea type="text" name="content" class="form-control" id="ocontent"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-auto mr-auto"></div>
                <div class="col-auto">
                    <input class="btn btn-primary" type="submit" role="button" value="글쓰기" />
                </div>
            </div>
        </form>
    </div>

</body>
</html>
    