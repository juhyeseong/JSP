<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-form.jsp</title>
</head>
<body>
	<h1>두 정수의 덧셈</h1>
	<hr>
	
	<form action="ex07-process.jsp">
		<p>
			<input type="number" name="n1" min="0" max="100" placeholder="n1">
			+
			<input type="number" name="n2" min="0" max="100" placeholder="n2">
			<input type="submit" value="=">
		</p>
	</form>
</body>
</html>