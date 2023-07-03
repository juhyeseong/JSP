<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div id="root">
		<div>
			<fieldset>
				<legend>추가</legend>
				
				<form action="add_result.jsp" method="POST">
					<input type="date" name="sdate" required>
					<input type="text" name="title" placeholder="제목" required>
					<input type="text" name="memo" placeholder="내용" required>
					<input type="submit" value="추가">
				</form>
			</fieldset>
		</div>
	</div>
</body>
</html>