<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<form action="<%=cpath %>/add-action.jsp" method="POST">
		<fieldset>
			<legend>추가</legend>
			<p><input type="text" name="name" placeholder="이름" required autofocus></p>
			<p><input type="number" name="age" placeholder="나이" required></p>
			<p>
				<select name="gender" required>
					<option value="">== 성별 ==</option>
					<option value="남성">남성</option>
					<option value="여성">여성</option>
				</select>
			</p>
			<p><input type="submit" value="추가"></p>
		</fieldset>
	</form>
</body>
</html>