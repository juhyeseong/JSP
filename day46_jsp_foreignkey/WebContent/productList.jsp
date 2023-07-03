<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:set var="list" value="${productDao.selectAll() }"/>
	<div id="root">
		<h2>상품 목록</h2>
		<table border="1" cellpadding="10" cellspacing="0">
			<thead>
			<tr bgcolor="silver">
				<th>No</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.idx }</td>
				<td>${dto.name }</td>
				<td>${dto.price }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>