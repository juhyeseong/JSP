<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<main>
		<h3>회원가입</h3>
		<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
			<p><input type="text" name="userId" placeholder="ID"></p>
			<p><input type="password" name="userPw" placeholder="password"></p>
			<p><input type="text" name="userName" placeholder="name"></p>
			<p><input type="email" name="email" placeholder="email"></p>
			<p><input type="submit" value="회원가입"></p>
		</form>
		</c:if>
		<c:if test="${pageContext.request.method == 'POST' }">
			<jsp:useBean id="dto" class="member.MemberDTO"/>
			<jsp:setProperty property="*" name="dto"/>
			<c:set var="row" value="${memberDAO.insert(dto) }"/>
		</c:if>
	</main>
	
	<script>
		const row = ${row }
		
		if(row != 0) {
			alert('회원가입 성공 ~ ')
			location.href = '${cpath }/member/login.jsp'
		}
		else {
			alert('로그인 실패 ~ ')
			history.go(-1)
		}
	</script>
</body>
</html>