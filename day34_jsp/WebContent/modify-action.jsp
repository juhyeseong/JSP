<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<jsp:useBean id="dto" class="student.StudentDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<% int row = dao.update(dto); %>
	
	<script>
		if(<%=row %> != 0) {
			alert('수정 성공');
			location.href = '<%=cpath %>/list.jsp';
		}
		else {
			alert('수정 실패');
			history.go(-1);
		}
	</script>
</body>
</html>