<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp</title>
</head>
<body>
	<c:if test="${not empty login }">
		<c:redirect url="/ex02-main.jsp"/>
	</c:if>
	<h1>로그인 폼</h1>
	<hr>
	
	<form method="POST" action="ex02-action.jsp">
		<p><input type="text" name="userId" placeholder="ID" autofocus></p>
		<p><input type="password" name="userPw" placeholder="Password"></p>
		<p>
			<label>
				<input type="checkbox" name="autologin">
				자동 로그인
			</label>
		</p>
		<p><input type="submit" value="로그인"></p>
	</form>
</body>
</html>