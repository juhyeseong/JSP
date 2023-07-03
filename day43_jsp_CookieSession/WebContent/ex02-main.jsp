<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-main.jsp</title>
</head>
<body>
	<c:if test="${empty login }">
		<c:redirect url="/ex02-form.jsp"/>
	</c:if>
	
	<h1>로그인 성공 - 메인 페이지</h1>
	<hr>
	
	<ul>
		<li>id : ${login.userId }</li>
		<li>pw : ******</li>
		<li>name : ${login.userName }</li>
	</ul>
	
	<a href="ex02-logout.jsp"><button>로그아웃</button></a>
</body>
</html>