<%@page import="login.LoginDAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="dao" value="<%=new LoginDAO() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-action.jsp</title>
</head>
<body>
	<c:set var="login" value="${dao.login(param.userId, param.userPw) }" scope="session"/>
	<c:redirect url="ex03-main.jsp"/>
</body>
</html>