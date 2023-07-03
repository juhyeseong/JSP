<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<c:set var="idx" value="<%=request.getParameter(\"idx\") %>"/>
	<script>
		const row = ${dao.changeStatus(param.idx) }
		
		if(row != 0) {
			location.href = '${cpath }/list.jsp'
		}
		else {
			history.go(-1)
		}
	</script>
</body>
</html>