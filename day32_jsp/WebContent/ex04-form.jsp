<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-form.jsp</title>
</head>
<body>
	<h1>ex04-form.jsp (입력)</h1>
	<hr>
	
	<form action="ex04-process.jsp" method="POST">
		<p><input type="number" name="radius" placeholder="반지름" step="0.1"></p>
		<p><button>입력</button></p>
		<!-- form 태그 내부의 button 태그는 input type="submit" 을 대신할 수 있다 -->
	</form>
</body>
</html>