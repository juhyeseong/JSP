<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-popup.jsp</title>
</head>
<body>

<h3>공지사항</h3>

<fieldset style="height: 250px; margin: 10px auto;">
	내용
</fieldset>

<form method="POST">
	<div style="display: flex; justify-content: space-between;">
		<div>
			<label>
			<input type="checkbox" name="donotPopup">2분 동안 열지 않습니다
			</label>
		</div>
		<div>
			<input type="submit" value="닫기">
		</div>
	</div>
</form>
<%
	if(request.getMethod().equals("POST")) {
		String donotPopup = request.getParameter("donotPopup");
		if(donotPopup != null) {
			Cookie c = new Cookie("donotPopup", donotPopup);
			c.setMaxAge(60);
			response.addCookie(c);
		}
		%>
		<script>
			window.close()
		</script>
		<%
	}
		
%>

<script>
	
</script>

</body>
</html>