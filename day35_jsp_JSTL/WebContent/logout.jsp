<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<body>
	<c:remove var="member" scope="session"/>
	
	<script>
		alert('로그아웃 ~ ')
		location.href = '${cpath }/login.jsp'
	</script>
</body>
</html>