<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div id="root">
		<h3>목록</h3>
		<table border="1" cellpadding="10" cellspacing="0">
			<thead>
			<tr bgcolor="silver">
				<th>No</th>
				<th>날짜</th>
				<th>제목</th>
				<th>내용</th>
				<th>삭제</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${dao.selectAll() }">
			<tr>
				<td class="param">${dto.idx }</td>
				<td>${dto.sdate }</td>
				<td>${dto.title }</td>
				<td>${dto.memo }</td>
				<td><button onclick="handleDelete(this)">삭제</button></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		function handleDelete(button) {
			var param = button.parentNode.parentNode.querySelector('.param').innerText
			const msg = '${cpath }/delete.jsp?idx=' + param
			
			if(confirm('삭제하시겠습니까 ? ')){
				location.href = msg
			}
			else {
				alert('삭제를 취소합니다 ~ ')
			}
		}
	</script>
</body>
</html>