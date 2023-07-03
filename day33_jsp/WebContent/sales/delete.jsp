<%@page import="snack.SnackDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>
	<%
		List<SnackDTO> list = (List<SnackDTO>)application.getAttribute("list");
		final String name = request.getParameter("name");
		boolean result = list.removeIf(dto -> dto.getName().equals(name));
//		boolean result = false;
		
//		for(SnackDTO dto : list) {
//			if(dto.getName().equals(name)) {
//				list.remove(dto);
//				result = true;
//				break;
//			}
//		}
	%>
	
	<h3><%=result ? "삭제 성공" : "삭제 실패" %></h3>
	<a href="index.jsp"><button>목록으로</button></a>
</body>
</html>