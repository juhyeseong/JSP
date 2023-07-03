<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<body>
	<div id="root">
		<h2>회원목록</h2>
		
		<table border="1" cellpadding="10" cellspacing="0">
			<thead>
			<tr>
				<th>idx</th>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>이메일</th>
				<th>데이트</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${dao.selectAll() }">
			<tr>
				<td>${dto.idx }</td>
				<td>${dto.userId }</td>
				<td>${dto.userPw }</td>
				<td>${dto.userName }</td>
				<td>${dto.age }</td>
				<td>${dto.gender }</td>
				<td>${dto.email }</td>
				<td>${dto.birth }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
			<form action="search.jsp">
				<p>
					<input type="text" name="search" placeholder="검색">
					<input type="submit" value="검색">
				</p>
			</form>
	</div>
</body>
</html>