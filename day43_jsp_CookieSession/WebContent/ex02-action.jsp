<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-action.jsp</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="user" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="user"/>
	
	<%
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO login = dao.login(user);
		session.setAttribute("login", login);
		
		String autologin = request.getParameter("autologin");
		
		if(autologin != null) {
			Cookie c = new Cookie("JSESSIONID", session.getId());
			c.setMaxAge(60 * 60 * 24);
			response.addCookie(c);
		}
		
		response.sendRedirect("ex02-main.jsp");
	%>
</body>
</html>