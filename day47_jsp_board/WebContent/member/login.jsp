<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<main>
		<h3>로그인</h3>
		
		<c:if test="${pageContext.request.method == 'GET' }">
		<form method="POST">
			<p><input type="text" name="userId" placeholder="ID" value="${cookie.userId.value }"
					required autofocus></p>
			<p><input type="password" name="userPw" placeholder="password" required></p>
			<p><label><input type="checkbox" name="storeId"
						${not empty cookie.userId ? 'checked' : ' ' }>ID 저장</label></p>
			<p><input type="submit" value="로그인"></p>
		</form>
		<div>
			<a href="${cpath }/member/join.jsp">아직 회원이 아니십니까?😣</a>
		</div>
		</c:if>
		<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="user" class="member.MemberDTO"/>
		<jsp:setProperty property="*" name="user"/>
		<c:set var="login" value="${memberDAO.login(user) }" scope="session"/>
		<%
			boolean flag1 = session.getAttribute("login") != null;
			boolean flag2 = request.getParameter("storeId") != null;
			
			Cookie c = new Cookie("userId", user.getUserId());
			c.setMaxAge(flag1 && flag2 ? 60 * 60 * 24 * 7 : 0);
			response.addCookie(c);
		%>
		<c:if test="${not empty login }">
			<c:set var="row" value="1"/>
		</c:if>
		<c:if test="${empty login }">
			<c:set var="row" value="0"/>
		</c:if>
		</c:if>
	</main>
	
	<script>
		const row = ${row }
		
		if(row == 1) {
			alert('로그인 성공 ~ ')
			location.href = '${cpath }'
		}
		else {
			alert('로그인 실패 ~ ')
			history.go(-1)
		}
	</script>
</body>
</html>