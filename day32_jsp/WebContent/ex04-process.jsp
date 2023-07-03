<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="circle" class="ex04.Circle"/>
	<jsp:setProperty property="*" name="circle"/>
	
	<%
		circle.calc();
		request.setAttribute("circle", circle);
		
//		RequestDispatcher rd = request.getRequestDispatcher("ex04-result.jsp");
//		rd.forward(request, response);
		
		// HTML없이 순수 자바 코드로 작성한다면, 포워드를 제외한 내용은 별도의 자바 클래스에서 구성할 수도 있다
	%>
	<jsp:forward page="ex04-result.jsp"/>
</body>
</html>