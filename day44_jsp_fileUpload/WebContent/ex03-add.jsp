<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ex03-header.jsp" %>
<body>
	
	<c:if test="${pageContext.request.method == 'GET' }">
		<h3>추가</h3>
		
		<form method="POST" enctype="multipart/form-data">
			<p><input type="text" name="title" placeholder="제목" required></p>
			<p><input type="file" name="upload" required></p>
			<p><input type="submit"></p>
		</form>
	</c:if>
	<c:if test="${pageContext.request.method == 'POST' }">
		<c:set var="dto" value="${util.getUploadDTO(pageContext.request) }"/>
		<c:set var="row" value="${dao.insert(dto) }"/>
		<h3>${row != 0 ? '추가 성공' : '추가 실패' }</h3>
		<a href="${cpath }/ex03-list.jsp"><button>목록으로</button></a>
	</c:if>
	
</body>
</html>