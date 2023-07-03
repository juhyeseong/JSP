<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp</title>
</head>
<body>
	<h1>EL 태그 다양한 사용법</h1>
	<hr>
	
	<%
		pageContext.setAttribute("test", "test1");
		String test2 = request.getParameter("test2");
		if(test2 == null) {
			response.sendRedirect("ex06.jsp?test2=hello");
		}
	%>
	
	<a href="ex06.jsp?test2=hello"><button>클릭</button></a>
	<ul>
		<li>\${test } : ${test }</li>
		<li>\${param.test2 } : ${param.test2 }</li>
		<li>\${header.referer } : ${header.referer }</li>		<!-- Referer : 요청이 어디서 왔는가(유입 경로) -->
		<li>\${cookie.JSESSIONID.value } : ${cookie.JSESSIONID.value }</li>
		<li>\${pageContext.request } : ${pageContext.request }</li>
		<li>\${pageContext.session } : ${pageContext.session }</li>
		<li>\${pageContext.servletContext } : ${pageContext.servletContext }</li>
		<li>\${pageContext.request.contextPath } : ${pageContext.request.contextPath }</li>
		<li>\${pageContext.request.method } : ${pageContext.request.method }</li>
		<li>\${pageContext.request.remoteAddr } : ${pageContext.request.remoteAddr }</li>
		<hr>
		<%@ page import="java.util.*" %>
		<%
			Enumeration<String> headerNames = request.getHeaderNames();
		
			while(headerNames.hasMoreElements()) {	// sc.hasNextLine()
				String headerName = headerNames.nextElement();
				String header = request.getHeader(headerName);
				out.print("<li>" + headerName + " : " + header + "</li>");
			}
		%>
	</ul>
</body>
</html>