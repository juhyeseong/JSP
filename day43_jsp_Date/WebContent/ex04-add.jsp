<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex04.Ex04DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dao" value="${Ex04DAO.getInstance() }"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>날짜 파라미터 입력받기</h1>
	<hr>
	
	<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
			<p><input type="text" name="title" placeholder="제목"></p>
			<p><input type="date" name="sdate"></p>
			<p><input type="date" name="edate"></p>
			<p><input type="submit"></p>
		</form>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="dto" class="ex04.Ex04DTO"/>
		<jsp:setProperty property="sdate" name="dto" value="${dao.getDate(param.sdate) }"/>
		<jsp:setProperty property="edate" name="dto" value="${dao.getDate(param.edate) }"/>
		<jsp:setProperty property="title" name="dto"/>
		<c:set var="row" value="${dao.insert(dto) }"/>
		<c:if test="${row != 0 }">
			<h3>추가 성공 ~ </h3>
		</c:if>
		<c:if test="${row == 0 }">
			<h3>추가 실패 ~ </h3>
		</c:if>
	</c:if>
	
	<a href="ex04-list.jsp"><button>리스트로</button></a>
</body>
</html>