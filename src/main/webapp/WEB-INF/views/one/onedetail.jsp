<%--
  Created by IntelliJ IDEA.
  User: UENA
  Date: 2024-05-27
  Time: 오전 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="table">
    <div class="tr">
        <h3>문의내용</h3>
        <div class="th">제목 :${oneDetail.otitle}</div>
        <div class="th">내용 :${oneDetail.ocontent}</div>
        <div class="th">등록날짜: ${oneDetail.oregdate}</div>
        <div class="th">답변: ${oneDetail.oans}</div>
        <div class="th">작성자: ${oneDetail.owriter}</div>
    </div>
    <div class="oneform">
        <form method="post" action="/onedetail_result?lid=${lid}">
            <h3>일대일문의답변</h3>
            <input type="hidden" name="ono" value="${oneDetail.ono}"/>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">답변내용</label>
                <div class="col-sm-10">
                    <textarea type="text" name="oans" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">작성자</label>
                <div class="col-sm-10">
                    <input type="text" name="owriter" class="form-control" id="owriter"/>
                </div>
            </div>
            <div class="row">
                <div class="col-auto mr-auto"></div>
                <div class="col-auto">
                    <input class="btn btn-primary" type="submit" role="button" value="답변쓰기"/>
                </div>
            </div>
        </form>
        <div class="delete">
            <a href="/onelist/delete/${oneDetail.ono}?lid=${lid}">삭제하기</a>
        </div>
    </div>

</div>
</body>
</html>
