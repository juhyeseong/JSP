<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<c:if test="${empty member }">
		<c:redirect url="login.jsp"/>
	</c:if>
	
	<script>
		const row = ${dao.delete(member.idx) }
		if(row != 0) {
			alert('탈퇴 성공');
			location.href = '${cpath }';
			<% session.setAttribute("member", null); %>
		}
		else {
			alert('탈퇴 실패');
			history.go(-1);
		}
	</script>
</body>
</html>