<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="student.*, java.util.*"%>
<%
	StudentDAO dao = new StudentDAO();
	String cpath = request.getContextPath();
	// int row = 0;
	
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>day05</title>
<style>
	a {
	text-decoration: none;
	color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	h1 {
		text-align: center;
	}
	nav > ul {
		display: flex;
		justify-content: center;
		
		list-style: none;
		
		width: 800px;
		margin: 0 auto;
		padding: 0;
	}
	nav > ul > li {
		flex: 1;
		text-align: center;
	}
	form {
		display: flex;
		justify-content: center;
	}
	fieldset {
		width: 400px;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	p > input, p > select {
		cursor: pointer;
		width: 400px;
		height: 30px;
	}
	p > input[type="submit"] {
		height: 40px;
		background-color: darkgray;
		color: white;
		font-size: 18px;
		font-weight: bold;
	}
	th, td {
		text-align: center;
	}
	legend {
		font-size: 20px;
		font-weight: bold;
	}
</style>
</head>
<body>
<header>
	<h1><a href="<%=request.getContextPath() %>">day05</a></h1>
	
	<nav>
		<ul>
			<li><a href="<%=request.getContextPath() %>/list.jsp">목록</a></li>
			<li><a href="<%=request.getContextPath() %>/add.jsp">추가</a></li>
		</ul>
	</nav>
	<hr>
</header>