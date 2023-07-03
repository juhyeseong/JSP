<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<script>
		const row = ${dao.join(dto) }
		
		if(row != 0) {
			alert('가입 성공 ~ ')
			location.href = '${cpath }/login.jsp'
		}
		else {
			alert('가입 실패 ~ ')
			history.go(-1)
		}
	</script>
</body>
</html>