<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>
	<h1>EL Tag 연산자</h1>
	<hr>
	
	<h3>산술연산 : +, -, *, /, %</h3>
	<h3>비교연산 : >, <, >=, <=, ==, !=, gt, lt, ge, le, eq, ne</h3>
	<h3>논리연산 : and, or, not</h3>
	<h3>null 체크 : empty, not empty</h3>
	<h3>삼항연산 : A ? B : C</h3>
	
	<%
		String s1 = "12";
		String s2 = "23";
		pageContext.setAttribute("s1", s1);
		pageContext.setAttribute("s2", s2);
		
		System.out.println("s1 + s2 : " + (s1 + s2));
		// 자바에서는 문자열 + 연산은 append이지만
		// EL Tag에서는 문자열에 더하기 연산을 한다
		String s3 = "1234";
		pageContext.setAttribute("s3", s3);
	%>
	<h3>s1 + s2 : ${s1 + s2 }</h3>
	<h3>\${s1 != s2 } : ${s1 != s2 }</h3>
	<h3>\${s1 ne s2 } : ${s1 ne s2 }</h3>
	<h3>${s1 mod 2 eq 0 ? '짝수' : '홀수' }</h3>
	<h3>${s1 % 2 == 0 ? '짝수' : '홀수' }</h3>
	<h3>\${empty s3 } : ${empty s3 }</h3>
	<h3>\${empty s4 } : ${empty s4 }</h3>
	<br>
	<h3>s3 == null : <%=s3 == null %></h3>
	<h3>s4 == null : s4변수가 없어서 참조 불가</h3>
</body>
</html>