<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div id="root">
		<div>
			<fieldset>
				<legend>전화번호 추가</legend>
				
				<form action="add_action.jsp" method="POST">
					<input type="text" name="name" placeholder="이름" required>
					<input type="text" name="phoneNumber" placeholder="전화번호 ex) 010-0000-0000" required>
					<input type="submit" value="추가">
				</form>
			</fieldset>
		</div>
	</div>
</body>
</html>