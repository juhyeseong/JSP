<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<%
		int row = dao.delete(request.getParameter("name"));
	%>
	
	<script>
		if(<%=row %> != 0) {
			alert('삭제 성공');
			location.href = '<%=cpath %>/list.jsp';
		}
		else {
			alert('삭제 실패');
			history.go(-1);
		}
	</script>
</body>
</html>