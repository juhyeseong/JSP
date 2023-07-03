<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:set var="list" value="${salesDao.selectAll() }"/>
	<div id="root">
		<h2>매출 목록</h2>
		<table border="1" cellpadding="10" cellspacing="0">
			<thead>
			<tr bgcolor="silver">
				<th>No</th>
				<th>판매 상품 이름</th>
				<th>판매 상품 가격</th>
				<th>판매 날짜</th>
				<th>판매 수량</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.idx }</td>
				<td>${dto.name }</td>
				<td>${dto.price }</td>
				<td>${dto.sdate }</td>
				<td>${dto.cnt }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>