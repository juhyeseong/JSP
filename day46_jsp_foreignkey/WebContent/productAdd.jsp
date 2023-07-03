<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<body>
	<c:if test="${pageContext.request.method == 'GET' }">
		<div id="root">
		<div>
			<fieldset>
				<legend>상품 추가</legend>
				
				<form method="POST">
					<input type="text" name="name" placeholder="이름" required>
					<input type="number" name="price" min="10" step="10" placeholder="가격" required>
					<input type="submit" value="추가">
				</form>
			</fieldset>
		</div>
	</div>
	</c:if>
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="dto" class="product.ProductDTO"/>
		<jsp:setProperty property="*" name="dto"/>
		<c:set var="row" value="${productDao.insert(dto) }"/>
		
		<script>
			const row = ${row }
			
			if(row != 0) {
				alert('추가 성공 ~ ')
				location.href = '${cpath }/productList.jsp'
			}
			else {
				alert('추가 실패 ~ ')
				history.go(-1)
			}
		</script>
	</c:if>
</body>
</html>