<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-result.jsp</title>
</head>
<body>
	<%!	// 선언부에서 프로그램 진행을 위한 필드 및 메서드를 작성
		private String[] idArray = 	 { "itbank", "test", "admin" };
		private String[] pwArray = 	 { "it", 	 "1234", "admin" };
		private String[] nameArray = { "원종래",  "테스트", "관리자" };
		
		public String login(String userid, String userpw) {
			String answer = null;
			
			for(int i = 0; i < idArray.length; i++) {
				if(userid.equals(idArray[i])) {
					if(userpw.equals(pwArray[i])) {
						answer = nameArray[i];
						break;
					}
				}
			}
			
			return answer;
		}
	%>
	
	<%	// 스크립틀릿
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		String username = login(userid, userpw);
		String msg = username == null ? "로그인 실패" : username + "님, 환영합니다";
	%>
	
	<h1>ex06-form, 결과 화면</h1>
	<hr>
	
	<h3><%=msg %></h3>
	<a href="ex06-form.jsp"><button>뒤로 가기</button></a>
</body>
</html>