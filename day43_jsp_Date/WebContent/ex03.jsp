<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>
	<h1>날짜 파라미터 입력받기</h1>
	<hr>
	
	<form method="POST" action="ex03-action.jsp">
		<p><input type="text" name="memo" placeholder="메모"></p>
		<p><input type="date" name="date"></p>
		<p><input type="submit"></p>
	</form>
</body>
</html>