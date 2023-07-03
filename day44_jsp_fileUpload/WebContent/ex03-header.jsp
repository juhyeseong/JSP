<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ex03-header.jsp --%>
<%@ page import="ex03.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="dao" value="${UploadDAO.getInstance() }"/>
<c:set var="util" value="${FileUtil.getInstance(pageContext.request) }"/>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>ex03 - DB와 연동하는 파일업로드</title>
<style>
	#root {
		display: flex;
		flex-flow: wrap;
	}
	.item {
		height: 300px;
		margin: 10px;
	}
	.image > img {
		height: 250px;
	}
</style>
</head>
<body>
	<h1>DB와 연동하는 파일업로드</h1>
	
	<nav>
		<ul>
			<li><a href="${cpath }/ex03-list.jsp">목록</a></li>
			<li><a href="${cpath }/ex03-add.jsp">추가</a></li>
		</ul>
	</nav>
</body>
</html>