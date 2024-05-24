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
</head>
<body>
  <article>
      <h2>동영상 등록하기</h2>
      <form method="POST" action="/videoAction/${item}" enctype="multipart/form-data">
          <label for="lid">강의명</label>
          <input type="text" id="lid" name="lid" value="${item}">

          <label for="file">동영상</label>
          <input type="file" id="file" name="file">
          <label for="vtitle">동영상 제목</label>
          <input type="text" id="vtitle" name="vtitle">
          <input type="submit" value="추가"/>
          <input type="reset" value="삭제"/>
      </form>
  </article>
</body>
</html>
