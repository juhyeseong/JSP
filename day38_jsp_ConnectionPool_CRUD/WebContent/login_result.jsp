<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<c:set var="member" value="${dao.login(param.userId, param.userPw) }" scope="session"/>
	<%
		int row = 0;
		String msg = "로그인 실패 ~ ";
	
		if(session.getAttribute("member") != null) {
			row = 1;
			msg = "로그인 성공 ~ ";
		}
	%>
	<script>
		const row = <%=row %>
		
		if(row != 0) {
			alert('<%=msg %>')
			location.href = '${cpath }'
		}
		else {
			alert('<%=msg %>')
			history.go(-1)
		}
	</script>
</body>
</html>