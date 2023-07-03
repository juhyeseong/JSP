<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<c:set var="member" value="<%=null %>" scope="session"/>
	<script>
		alert('로그아웃 ~ ')
		location.href = '${cpath }/login.jsp'
	</script>
</body>
</html>