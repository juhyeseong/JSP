<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<c:set var="row" value="${dao.chageFavorites(param.idx) }"/>

	<<c:redirect url="index.jsp"/>
</body>
</html>