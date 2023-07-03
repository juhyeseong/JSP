<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex07.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07.jsp</title>
</head>
<body>

	<h1>DAO와 연계하여 JSTML 사용하기</h1>
	<hr>

	<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
			<p>
				<input type="search" name="name" placeholder="이름 입력">
				<input type="submit" value="검색">
			</p>
		</form>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<c:set var="dao" value="<%=new StudentDAO() %>"/>
		<c:set var="list" value="${dao.search(param.name) }"/>
		
		<c:if test="${empty list }">
			<h3>검색 결과가 없습니다</h3>
		</c:if>
		
		<c:if test="${not empty list }">
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
				</tr>
				<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.name }</td>
					<td>${dto.age }</td>
					<td>${dto.gender }</td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
	</c:if>
</body>
</html>