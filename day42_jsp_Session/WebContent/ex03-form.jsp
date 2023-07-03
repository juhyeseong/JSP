<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-form.jsp</title>
</head>
<body>
	<c:if test="${not empty login }">
		<c:redirect url="ex03-main.jsp"/>
	</c:if>
	
	
	<h1>간단 로그인 구현(EL/JSTL, DAO/DTO)</h1>
	<hr>
	
	<form action="ex03-action.jsp" method="POST">
		<p><input type="text" name="userId" placeholder="ID"></p>
		<p><input type="password" name="userPw" placeholder="Password"></p>
		<p><input type="submit"></p>
	</form>
	<!-- 
		response.statusCode
		200 : OK
		3xx : redirect    (301, 302)
		4xx : client fault(401, 403, 404, 405)
		5xx : server fault
	 -->
</body>
</html>