<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-result.jsp</title>
</head>
<body>
	<h1>결과</h1>
	<hr>
	
	<pre><%=request.getAttribute("circle") %></pre>
	<div style="width: ${circle.radius * 2}px;
				height: ${circle.radius * 2}px;
				border-radius: 50%;
				background-color: skyblue;">
	</div>
</body>
</html>