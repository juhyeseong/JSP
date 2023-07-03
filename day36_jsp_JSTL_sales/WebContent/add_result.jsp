<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<jsp:useBean id="dto" class="sales.SalesDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<script>
		const row = ${dao.add(dto) }
		
		if(row != 0) {
			alert('추가 성공 ~ ')
			location.href = '${cpath}/list.jsp'
		}
		else {
			alert('추가 실패 ~ ')
			history.go(-1)
		}
	</script>
</body>
</html>