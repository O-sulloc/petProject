<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 예약 리스트 페이지</h1>
${list}
<c:forEach items="${list}" var="vo">
${vo.id}
 </c:forEach>
</body>
</html>