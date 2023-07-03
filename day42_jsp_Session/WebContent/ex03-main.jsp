<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-main.jsp</title>
</head>
<body>
	<c:if test="${empty login }">
		<c:redirect url="ex03-form.jsp"/>
	</c:if>
	
	<h1>로그인 이후 메인화면</h1>
	<hr>
	
	<h3>ID : ${login.userId }</h3>
	<h3>Password : ******</h3>
	<h3>Name : ${login.userName }</h3>
	
	<a href="ex03-logout.jsp"><button>로그아웃</button></a>
</body>
</html>