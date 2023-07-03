<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="phonebook.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="dao" value="${PhoneBookDAO.getInstance() }"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day08-member</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="header">
		<div class="left">
			<h1>전화번호부</h1>
		</div>
		<div class="right">
			<c:if test="${empty member }">
				<span>
					<a href="${cpath }"><button>메인</button></a>
					<a href="${cpath }/add.jsp"><button>추가</button></a>
				</span>
			</c:if>
		</div>
	</div>
	<hr>
