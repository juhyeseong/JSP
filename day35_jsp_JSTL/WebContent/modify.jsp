<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Member1DTO dto = (Member1DTO)session.getAttribute("member"); %>
<%@ include file="header.jsp" %>
	<c:if test="${empty member }">
		<c:redirect url="login.jsp"/>
	</c:if>
	
	<div id="root">
		<fieldset>
			<legend>수정</legend>
			
			<form action="modify_result.jsp" method="POST">
				<input type="text" name="userId" placeholder="아이디" value="${member.userId }" readonly="readonly" required>
				<input type="password" name="userPw" placeholder="패스워드" value="${member.userPw }" required>
				<input type="text" name="userName" placeholder="이름" value="${member.userName }" readonly="readonly">
				<input type="email" name="email" placeholder="이메일" value="${member.email }">
				<input type="text" value="${member.gender }" readonly="readonly">
				<input type="number" name="age" placeholder="나이" value="${member.age }">
				<input type="submit" value="수정">
			</form>
		</fieldset>
	</div>
</body>
</html>