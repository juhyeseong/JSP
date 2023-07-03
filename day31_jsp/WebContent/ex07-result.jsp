<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-result.jsp</title>
</head>
<body>
	<h1>ex07-result, 결과 화면</h1>
	<hr>
	
	<h3>결과 : <%=session.getAttribute("msg") %></h3>
	<a href="ex07-form.jsp">다시 계산해보기</a>
</body>
</html>