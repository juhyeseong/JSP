<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*" import="board.*" import="reply.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }"/>
<c:set var="boardDAO" value="${BoardDAO.getInstance() }"/>
<c:set var="replyDAO" value="${ReplyDAO.getInstance() }"/>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day18 - board</title>
<script src="${cpath }/js/function.js"></script>
<link type="text/css" rel="stylesheet" href="${cpath }/css/style.css">
</head>
<body>
	<header>
		<h1><a href="${cpath }">day18 - board</a></h1>
		<div id="loginInfo">
			<c:if test="${not empty login }">
				<p align="right">${login.userId } (${login.userName })</p>
			</c:if>
		</div>
	</header>
	<nav>
		<ul>
			<c:if test="${empty login }">
			<li><a href="${cpath }/member/login.jsp">로그인</a></li>
			</c:if>
			<c:if test="${not empty login }">
			<li><a href="${cpath }/member/logout.jsp">로그아웃</a></li>
			</c:if>
			<li><a href="${cpath }/board/list.jsp">게시판</a></li>
		</ul>
	</nav>