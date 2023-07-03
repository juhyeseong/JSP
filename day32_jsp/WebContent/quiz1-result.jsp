<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1-result.jsp</title>
</head>
<style>
	legend {
		font-size: 25px;
		font-weight: bold;
	}
	fieldset {
		width: 500px;
		display: block;
	}
</style>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		
		// POST방식의 요청이 아니라면 quiz1.jsp로 보내기 
		if(request.getMethod().equals("POST") == false) {
			response.sendRedirect("quiz1.jsp");
		}
	%>
	
	<jsp:useBean id="dto" class="quiz1.Quiz1DTO"/>
	<jsp:setProperty property="*" name="dto"/>
		
	<fieldset>
		<legend>결과</legend>
		<h3>아이디 : <%=dto.getUserId() %></h3>
		<h3>패스워드 : <%=dto.getPw1() %></h3>
		<h3>패스워드 재확인 : <%=dto.getPw2() %></h3>
		<h3>이름 : <%=dto.getName() %></h3>
		<h3>출생년도 : <%=dto.getYyyy() %>년</h3>
		<h3>출생월 : <%=dto.getMm() %>월</h3>
		<h3>출생일 : <%=dto.getDd() %>일</h3>	
	</fieldset>
	
	<p><a href="quiz1.jsp"><button>뒤로가기</button></a></p>
</body>
</html>