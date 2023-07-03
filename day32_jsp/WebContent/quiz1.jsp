<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
</head>
<body>
	<h1>회원가입 처리하기</h1>
	<hr>
	
	<fieldset>
		아래 form 형식에 맞는 자바 빈즈 클래스를 작성하세요<br>
		이후 quiz1-result.jsp에서 입력받은 내용을 출력하세요
	</fieldset>
	
	<form action="quiz1-result.jsp" method="POST">
		<p><input type="text" name="userId" placeholder="ID"></p>
		<p><input type="password" name="pw1" placeholder="password"></p>
		<p><input type="password" name="pw2" placeholder="password 재확인"></p>
		<p><input type="text" name="name" placeholder="이름"></p>
		<p><input type="number" name="yyyy" placeholder="출생년도"></p>
		<p>
			<select name="mm">
				<% for(int i = 1; i <= 12; i++) { %>
				<option><%=i %></option>
				<% } %>
			</select>
		</p>
		<p><input type="number" name="dd" min="1" max="31" placeholder="출생일"></p>
		<p><input type="submit" value="가입신청"></p>
	</form>
</body>
</html>