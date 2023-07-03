<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex03.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dao" value="${MemberDAO.getInstance() }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>
	<h1>싱글톤 + 커넥션풀</h1>
	<hr>
	
	<table border="1" cellpadding="10" cellspacing="0">
		<thead>
		<tr bgcolor="silver">
			<th>IDX</th>
			<th>USERID</th>
			<th>USERPW</th>
			<th>USERNAME</th>
			<th>EMAIL</th>
			<th>BIRTH</th>
			<th>GENDER</th>
			<th>AGE</th>
		</tr>
		</thead>
		<c:set var="list" value="${dao.selectAll() }"/>
		<c:forEach var="dto" items="${list }">
		<tbody>
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.userId }</td>
			<td>${dto.userPw }</td>
			<td>${dto.userName }</td>
			<td>${dto.email }</td>
			<td>${dto.birth }</td>
			<td>${dto.gender }</td>
			<td>${dto.age }</td>
		</tr>
		</tbody>
		</c:forEach>
	</table>
</body>
</html>