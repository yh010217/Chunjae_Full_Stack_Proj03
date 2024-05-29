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
    <link rel="stylesheet" href="/resources/css/one/onedatail.css">
</head>
<body>
<div id="wrap">
<h1>일대일 문의</h1>
    <div id="line"></div>
    <div class="oneform">
        <div class="td">
        <h3>문의내용</h3>
        <ul>
            <li class="otitle">제목 :${oneDetail.otitle}</li>
            <li class="oregdate">등록날짜: ${oneDetail.oregdate}</li>
            <li class="ocontent">문의: ${oneDetail.ocontent}</li>

        </ul>
<%--        <div class="td"></div>--%>
<%--        <div class="td">내용 :${oneDetail.ocontent}</div>--%>
<%--        <div class="td">등록날짜: ${oneDetail.oregdate}</div>--%>
<%--        <div class="td">답변: ${oneDetail.oans}</div>--%>
<%--        <div class="td">작성자: ${oneDetail.owriter}</div>--%>
    </div>
    <div class="ans">
        <form method="post" action="/onedetail_result?lid=${lid}">
            <h3>일대일문의답변</h3>
            <input type="hidden" name="ono" value="${oneDetail.ono}"/>
            <div class="form-group row">
                <label for="oans">답변내용</label>
                <div class="col-sm-11">
                    <textarea rows="30" cols="100" name="oans" id="oans"></textarea>
                </div>
                <div class="col-sm-10">
                    <label class="col-sm-2 col-form-label">작성자</label>
                    <input type="text" name="owriter" class="form-control" id="owriter"/>
                </div>
                <div class="col-auto">
                    <input id="append" type="submit" role="button" value="답변쓰기"/>
                </div>
            </div>
        </form>

          </div>
        <a class="delete" href="/onelist/delete/${oneDetail.ono}?lid=${lid}">삭제하기</a>
   </div>
</div>
</body>
</html>
