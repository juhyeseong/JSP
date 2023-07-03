<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div id="root">
		<div>
			<fieldset>
				<legend>영상 추가</legend>
				
				<form action="add_action.jsp" method="POST">
					<input type="text" name="channel" placeholder="채널" required>
					<input type="text" name="thumbnail" placeholder="썸네일" required>
					<input type="text" name="iframe" placeholder="영상" required>
					<input type="submit" value="추가">
				</form>
			</fieldset>
		</div>
	</div>
</body>
</html>