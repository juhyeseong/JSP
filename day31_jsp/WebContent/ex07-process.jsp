<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-process.jsp</title>
</head>
<body>
	<%
		String n1 = request.getParameter("n1");
		String n2 = request.getParameter("n2");
		
		int num1 = Integer.parseInt(n1);
		int num2 = Integer.parseInt(n2);
		int answer = num1 + num2;
		
		String msg = String.format("%d + %d = %d", num1, num2, answer);
		
		session.setAttribute("msg", msg);
	%>
	<a href="ex07-result.jsp">결과 확인</a>
</body>
</html>