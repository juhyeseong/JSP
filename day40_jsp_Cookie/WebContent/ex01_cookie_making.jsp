<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01_cookie_making</title>
</head>
<body>
<%
	String ip = request.getRemoteAddr();								// 원격컴퓨터 (접속자)의 IP주소를 문자열로 저장
	Cookie c1 = new Cookie("ipaddr", ip);								// 새로운 쿠키생성(쿠키이름, 쿠키값)
	c1.setMaxAge(60 * 60 * 24 * 7);										// 쿠키의 유효시간을 설정(시간이 지나면 쿠키 소멸)
	response.addCookie(c1);												// 클라이언트에게 보낼 응답에 쿠키를 같이 보냄
	
	// 쿠키는 파라미터와 마찬가지로 클라이언트에서 처리한다
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_hh:mm");
	Date date = new Date();												// 현재 날짜와 시간을 문자열로 생성
	String lastAccessedTime = sdf.format(date);
	Cookie c2 = new Cookie("lmt", lastAccessedTime);					// 마지막 접근 시간을 쿠키로 생성
	c2.setMaxAge(60 * 60 * 24 * 7);										// 쿠키 유효시간  설정
	response.addCookie(c2);												// 응답에 쿠키를 같이 보냄
	
	// 클라이언트에게 보내줄 응답에 쿠키를 같이 포함시켜서 보내는 작업
	// 쿠키는 클라이언트가 보관하다가, 다음번 요청에 같이 포함되어서 서버로 넘어온다
	// 따라서, 쿠키를 방금 보낸 시점에서는 쿠키를 확인할 수 없고, 보통 리다이렉트를 이용하여 주소를 갱신시킨다
	
	response.sendRedirect("ex02_cookie_check.jsp");
%>
</body>
</html>