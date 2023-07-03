<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<jsp:useBean id="dto" class="phonebook.PhoneBookDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="row" value="${dao.update(dto) }"/>
	
	<script>
		const row = ${row }
		
		if(row != 0) {
			alert('수정 성공 ~ ')
			location.href('${cpath }')
		}
		else {
			alert('수정 실패 ~ ')
			history.go(-1)
		}
	</script>
</body>
</html>