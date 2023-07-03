<%@page import="member1.Member1DAO"%>
<%@page import="member1.Member1DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="dao" value="<%=new Member1DAO() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06 (member1)</title>
</head>
<link rel="stylesheet" href="style.css">
<body>
	<div class="header">
		<div class="left">
			<span>user : ${not empty member ? member.userName : '없음' }</span>
		</div>
		<div class="right">
			<c:if test="${not empty member }">
				<span>
					<a href="${cpath }/logout.jsp"><button>로그아웃</button></a>
					<a href="${cpath }/member.jsp"><button>회원정보</button></a>
				</span>
			</c:if>
			<c:if test="${empty member }">
				<span>
					<a href="${cpath }/login.jsp"><button>로그인</button></a>
					<a href="${cpath }/join.jsp"><button>회원가입</button></a>
				</span>
			</c:if>
		</div>
	</div>
	<hr>