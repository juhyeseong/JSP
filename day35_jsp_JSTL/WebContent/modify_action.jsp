<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<jsp:useBean id="dto" class="member1.Member1DTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<script>
		const row = ${dao.update(member) }
		
		if(row != 0) {
			alert('회원정보 수정 성공 ~ ')
			location.href = '${cpath }/member.jsp'
		}
		else {
			alert('회원정보 수정 실패 ~ ')
			history.go(-1)
		}
	</script>
</body>
</html>