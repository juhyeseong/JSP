<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex01.Test"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>
	<h1>EL Tag로 인스턴스 필드와 정적 필드에 접근하여 출력하기</h1>
	<hr>
	
	<%
		Test test = new Test();
	
		request.setAttribute("test", test);
	%>
	
	<h3>${test.value1 }</h3>
	<h3>${Test.getValue2() }</h3>
</body>
</html>