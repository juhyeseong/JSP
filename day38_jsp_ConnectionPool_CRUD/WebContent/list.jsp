<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:if test="${empty member }">
	<c:redirect url="login.jsp"/>
</c:if>
	<div id="root">
		<table border="1" cellpadding="10" cellspacing="0">
			<thead>
			<tr>
				<th>No</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>생년월일</th>
			</tr>
			</thead>
			<tbody>
			<c:set var="list" value="${dao.selectAll() }"/>
			<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.idx }</td>
				<td>${dto.userId }</td>
				<td>${dto.email }</td>
				<td>${dto.userName }</td>
				<td>${dto.age }</td>
				<td>${dto.gender }</td>
				<td>${dto.birth }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>