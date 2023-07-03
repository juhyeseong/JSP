<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div id="root">
		<div>
			<fieldset>
				<legend>추가</legend>
				
				<form action="add-action.jsp" method="POST" enctype="multipart/form-data">
					<input type="file" name="pic" required>
					<textarea name="content" placeholder="내용을 입력하세요" required></textarea>
					<input type="submit" value="추가">
				</form>
			</fieldset>
		</div>
	</div>
</body>
</html>