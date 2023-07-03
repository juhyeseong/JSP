<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<c:set var="userId" value="<%=request.getParameter(\"userId\") %>"/>
	<c:set var="userPw" value="<%=request.getParameter(\"userPw\") %>"/>
	<c:set var="member" value="${dao.login(userId, userPw) }" scope="session"/>
	
	<script>
		var member = ${dao.login(userId, userPw) != null ? 1 : 0 }
		
		if(member != 0) {
			alert('${member.userName }님 로그인 ~ ')
			location.href = '${cpath }/index.jsp';
		}
		else {
			alert('로그인 실패 ~ ')
			history.go(-1)
		}
	</script>
</body>
</html>