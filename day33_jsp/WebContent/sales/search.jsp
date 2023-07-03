<%@page import="java.util.List"%>
<%@page import="snack.SnackDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#root {
		display: flex;
		flex-flow: wrap;
		width: 700px;
		margin: 20px auto;
		border: 2px solid black;
	}
	.item {
		box-sizing: border-box;
		width: 150px;
		margin: 10px;
		padding: 10px;
		cursor: pointer;
		
		display: flex;
		flex-direction: column;
		justify-content: center;
		
		text-align: center;
	}
	.image:hover {
		background-color: #eee;
	}
	.image > img {
		width: 100px;
	}
	#menu {
		margin-left: 650px;
	}
</style>
<body>
	<h1>검색 결과</h1>
	<hr>
	
	<%
		String search = request.getParameter("search");
		List<SnackDTO> list = (List<SnackDTO>)application.getAttribute("list");
		SnackDTO tmp = null;
		
		for(SnackDTO ob : list) {
			if(ob.getName().contains(search)) {
				tmp = new SnackDTO(ob.getName(), ob.getPrice(), ob.getImage());
			}
		}
	%>
	
	<% if(tmp != null) { %>
		<div id="root">
			<div class="item">
				<div class="image"><img src="img/<%=tmp.getImage() %>"></div>
				<div class="name"><%=tmp.getName() %></div>
				<div class="price"><%=String.format("%,d원", tmp.getPrice()) %></div>
			</div>
		</div>
		
		<div id="menu">	
			<a href="index.jsp"><button>목록으로</button></a>
		</div>
	<% } else { %>
		<h3>검색결과 없음</h3>
		<p><a href="index.jsp"><button>목록으로</button></a></p>
	<% } %>
</body>
</html>