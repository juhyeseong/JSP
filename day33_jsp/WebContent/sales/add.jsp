<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add.jsp</title>
</head>
<body>
	<h1>상품 추가</h1>
	<hr>
	
	<% 
		String path = application.getRealPath("img");	// 그림 파일이 담긴 폴더
//		System.out.println(path);
		File dir = new File(path);
		String[] list = dir.list();
		
		request.setCharacterEncoding("UTF-8");
	%>
	
	<form method="POST">
		<p><input type="text" name="name" placeholder="상품이름"></p>
		<p><input type="number" name="price" placeholder="가격"></p>
		<p>
			<select name="image">
				<% for(String fileName : list) { %>
					<option><%=fileName %></option>
				<% } %>
			</select>
		</p>
		<p>
			<input type="submit" value="등록">
			<a href="index.jsp"><input type="button" value="목록으로"></a>
		</p>
	</form>
	
	<% if(request.getMethod().equals("POST")) { %>
			<jsp:useBean id="user" class="snack.SnackDTO"/>
			<jsp:setProperty property="*" name="user"/>
			${list.add(user) }
	<% 		
			response.sendRedirect("index.jsp");
		} 
	%>
</body>
</html>