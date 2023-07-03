<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:set var="list" value="${dao.selectAll() }"/>
	<div id="root">
		<h3>상품목록</h3>
		
		<table border="1" cellpadding="10" cellspacing="0">
			<thead>
			<tr bgcolor="silver">
				<th>No</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
				<th>상품 수량</th>
				<th>상품 상태</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${list }">
			<tr>
				<td class="param">${dto.idx }</td>
				<td>${dto.name }</td>
				<td>${dto.price }</td>
				<td>${dto.cnt }</td>
				<c:if test="${dto.status == 1 }">
					<td><button id="normal" onclick="handleDelete(this)">정상</button></td>
				</c:if>
				<c:if test="${dto.status == 0 }">
					<td><button id="cancel" onclick="handleDelete(this)">취소</button></td>
				</c:if>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		function handleDelete(button) {
			var param = button.parentNode.parentNode.querySelector('.param').innerText
			const msg = '${cpath }/changeStatus.jsp?idx=' + param
			
			if(confirm('상태를 변경하시겠습니까 ? ')) {
				location.href = msg
			}
			else {
				alert('변경을 취소하셨습니다 ~ ')
			}
		}
	</script>
</body>
</html>