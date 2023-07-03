<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<body>
	<c:set var="search" value="<%=request.getParameter(\"search\") %>"/>
	<c:set var="list" value="${dao.search(search) }"/>
	<div id="root">
		<c:if test="${empty list }">
			<table border="1" cellpadding="10" cellspacing="0">
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
				<tr>
					<td colspan="8">검색 결과가 없습니다</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${not empty list }">
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
				<c:forEach var="dto" items="${list }">
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
		</c:if>
		<p><a href="${cpath }/index.jsp"><button>메인</button></a></p>
	</div>
	
</body>
</html>