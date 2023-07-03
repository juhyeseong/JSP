<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<div id="root">
		<div>
			<fieldset>
				<legend>회원가입</legend>
				
				<form action="join_result.jsp" method="POST">
					<input type="text" name="userId" placeholder="아이디" required>
					<input type="password" name="userPw" placeholder="패스워드" required>
					<input type="text" name="userName" placeholder="이름">
					<input type="email" name="email" placeholder="이메일">
					<p>
						<select name="gender" required>
							<option value="">== 성별 ==</option>
							<option value="남성">남성</option>
							<option value="여성">여성</option>
						</select>
					</p>
					<input type="number" name="age" placeholder="나이">
					<input type="submit" value="회원가입">
				</form>
			</fieldset>
		</div>
		
		<div class="button">
			<p>
				<a href="${cpath }/index.jsp"><button>메인</button></a>
				<a href="${cpath }/login.jsp"><button>로그인</button></a>
			</p>
		</div>
	</div>
</body>
</html>