<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%!
	public int getCommaCount(String s) {
		int count = 0;
		for(int i = 0; i < s.length(); i++) {
			char ch = s.charAt(i);
			if(ch == ',') {
				count += 1;
			}
		}
		return count;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-view.jsp</title>
</head>
<body>
	
	<h1>단일 조회 및 쿠키 생성</h1>
	<hr>
	
	<h3>idx : ${param.idx }</h3>
	<%
		String idx = request.getParameter("idx");
	
		Cookie[] cs = request.getCookies();
		String value = "";
		for(int i = 0; cs != null && i < cs.length; i++) {
			if(cs[i].getName().equals("recent")) {
				value = URLDecoder.decode(cs[i].getValue(), "UTF-8");
			}
		}
		if("".equals(value)) {	// 만약 쿠키에 내용이 없거나, 쿠키가 없으면
			value = idx;		// 방금 성택한 idx 하나를 그대로 대입한다(콤마 없음)
		}
		else if(value.contains(idx)) {	// 조건에서 쿠키가 포함하는 것이 아니라
										// 쿠키를 배열화했을 때 idx가 포함되어야 함
										// 20번이 쿠키에 포함된 경우, 2를 클릭해도 변경이 발생
	//		value = value.replace(idx, "");
			ArrayList<String> list = new ArrayList<>(Arrays.asList(value.split(",")));
			list.remove(idx);	// 기존 쿠키 리스트에서 선택된 idx만 제거하고
			value = idx;		// idx를 맨 앞에 배치한 다음
			for(String s : list.subList(0, 4)) {	// 리스트에서 0, 1, 2, 3 만 더한다
				value += "," + s;
			}
		}
		else if(getCommaCount(value) >= 4) {	// idx를 포함하지 않고, 값이 5개 있으면
			value = value.substring(0, value.lastIndexOf(","));	// 마지막 콤마 이후를 제거
			value = idx + "," + value;	// 선택값 + , + 기존값
		}
		else {
			value = idx + "," + value;
		}
		System.out.println(value);
		Cookie c = new Cookie("recent", URLEncoder.encode(value, "UTF-8"));
		c.setMaxAge(60 * 5);
		response.addCookie(c);
	%>
	<h3>recent : ${URLDecoder.decode(cookie.recent.value, 'UTF-8') }</h3>
	
	<a href="ex07.jsp"><button>목록으로</button></a>

</body>
</html>