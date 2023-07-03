<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div id="root">
		<div>
			<fieldset>
				<legend>로그인</legend>
				
				<form action="login_result.jsp" method="POST">
					<input type="text" name="userId" placeholder="아이디" required>
					<input type="password" name="userPw" placeholder="패스워드" required>
					<input type="submit" value="로그인">
				</form>
			</fieldset>
		</div>
		
		<div class="button">
			<p>
				<a href="join.jsp"><button>회원가입</button></a>
			</p>
		</div>
	</div>
</body>
</html>