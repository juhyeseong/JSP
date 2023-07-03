<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex04.Ex04DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dao" value="${Ex04DAO.getInstance() }"/>
<c:set var="list" value="${dao.selectAll() }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-list</title>
</head>
<body>
	<table border="1" cellpadding="10" cellspacing="0">
		<thead>
		<tr bgcolor="silver">
			<th>제목</th>
			<th>시작 날짜</th>
			<th>끝나는 날짜</th>
			<th>진행하는 날짜 수</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.title }</td>
			<td>${dto.sdate }</td>
			<td>${dto.edate }</td>
			<td>${dto.days }</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<a href="ex04-add.jsp"><button>추가</button></a>
</body>
</html>