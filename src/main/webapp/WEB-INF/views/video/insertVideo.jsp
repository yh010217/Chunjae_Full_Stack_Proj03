<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-23
  Time: 오후 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/video/videoInsert.css">
</head>
<body>
  <article id="insertVideo">
      <h2>동영상 등록하기</h2>
      <form method="POST" action="/videoAction/${item}" enctype="multipart/form-data">
          <ul>
              <li>
                  <label for="file">동영상</label>
                  <input type="file" id="file" name="file">
              </li>
              <li>
                  <label for="lid">강의코드</label>
                  <input type="text" id="lid" name="lid" value="${item}" readonly>
              </li>
              <li>
                  <label for="vtitle">동영상 제목</label>
                  <input type="text" id="vtitle" name="vtitle" placeholder="강의 제목을 입력하세요.">
              </li>
              <li>
                  <input type="submit" value="추가"/>
                  <input type="reset" value="삭제"/>
              </li>
          </ul>
      </form>
  </article>
</body>
</html>
