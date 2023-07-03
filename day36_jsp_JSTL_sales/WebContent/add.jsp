<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div id="root">
		<div>
			<fieldset>
				<legend>추가</legend>
				
				<form action="add_result.jsp" method="POST">
					<input type="text" name="name" placeholder="상품이름" required>
					<input type="number" name="price" value="1000" min="1000" step="100" placeholder="상품가격" required>
					<input type="number" name="cnt" placeholder="상품수량" required>
					<input type="submit" value="추가">
				</form>
			</fieldset>
		</div>
	</div>
</body>
</html>