<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-23
  Time: 오후 5:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h2>해영 대표 강사진</h2>
  <div class="tea_list">
    <%-- 필요한 것 : 사진, 과목, 선생 이름, 소개--%>
    <c:forEach var="item" items="${list}">
      ${item.tprofile}
      <a href="/index/teacher/${item.tid}" style="color: #00AE68"> ${item.name}선생님 </a>
      ${item.tsubject}
      ${item.tintro}
    </c:forEach>
  </div>
</body>
</html>
