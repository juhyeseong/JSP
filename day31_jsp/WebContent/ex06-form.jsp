<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-form.jsp</title>
</head>
<body>
	<h1>ex06-form, 로그인 화면</h1>
	<hr>
	
	<form method="POST" action="ex06-result.jsp">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="password" required></p>
		<p><input type="submit" value="로그인"></p>
	</form>
</body>
</html>