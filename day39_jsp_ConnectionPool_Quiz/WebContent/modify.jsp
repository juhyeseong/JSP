<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<c:set var="dto" value="${dao.selectOne(param.idx) }" />
	
	<fieldset>
		<legend>전화번호 수정</legend>
		
		<form action="modify_action.jsp" method="POST">
			<input type="number" name="idx" value="${dto.idx }" readonly>
			<input type="text" name="name" value="${dto.name }" placeholder="이름" required>
			<input type="text" name="phoneNumber" value="${dto.phoneNumber }" placeholder="전화번호 ex) 010-0000-0000" required>
			<input type="submit" value="로그인">
		</form>
	</fieldset>
</body>
</html>