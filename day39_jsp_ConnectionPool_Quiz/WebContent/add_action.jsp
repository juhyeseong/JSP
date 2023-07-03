<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<c:set var="row" value="${dao.add(param.name, param.phoneNumber) }"/>

	<script>
		const row = ${row }
		
		if(row != 0) {
			alert('추가 성공 ~ ')
			location.href('${cpath }')
		}
		else {
			alert('추가 실패 ~ ')
			history.go(-1)
		}
	</script>
</body>
</html>