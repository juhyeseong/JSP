<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<body>
	<c:if test="${pageContext.request.method == 'GET' }">
		<div id="root">
		<div>
			<fieldset>
				<legend>매출 추가</legend>
				
				<form method="POST">
					<p>
						<select name="product" required>
						<c:set var="productList" value="${productDao.selectAll() }"/>
						<c:forEach var="product" items="${productList }">
							<option value="${product.idx }">${product.name }</option>
						</c:forEach>
						</select>
					</p>
					<input type="number" name="cnt" placeholder="판매 수량" required>
					<input type="submit" value="추가">
				</form>
			</fieldset>
		</div>
	</div>
	</c:if>
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="dto" class="sales.SalesDTO"/>
		<jsp:setProperty property="*" name="dto"/>
		<c:set var="row" value="${salesDao.insert(dto) }"/>
		
		<script>
			const row = ${row }
			
			if(row != 0) {
				alert('추가 성공 ~ ')
				location.href = '${cpath }/salesList.jsp'
			}
			else {
				alert('추가 실패 ~ ')
				history.go(-1)
			}
		</script>
	</c:if>
</body>
</html>