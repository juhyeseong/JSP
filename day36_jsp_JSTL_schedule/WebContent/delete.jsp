<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<c:set var="idx" value="<%=request.getParameter(\"idx\") %>"/>
	<script>
		const row = ${dao.delete(param.idx) }
		
		if(row != 0) {
			alert('삭제 성공 ~ ')
			location.href = '${cpath }/list.jsp'
		}
		else {
			alert('삭제 실패 ~ ')
			history.go(-1)
		}
	</script>
</body>
</html>