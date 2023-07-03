<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<jsp:useBean id="dto" class="student.StudentDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<% 
		int row = dao.insert(dto);
	%>
	
	<script>
		if(<%=row %> != 0) {
			alert('추가 성공');
			location.href = '<%=cpath %>/list.jsp';
		}
		else {
			alert('추가 실패');
			history.go(-1);
		}
	</script>
</body>
</html>