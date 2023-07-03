<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ex03-header.jsp" %>
	<h3>목록</h3>
	
	<div id="root">
		<c:set var="list" value="${dao.selectAll() }"/>
		<c:forEach var="dto" items="${list }">
			<div class="item">
				<div>${dto.title }</div>
				<div class="image"><img src="${cpath }/image/${dto.uploadFile }"></div>
			</div>
		</c:forEach>
	</div>
</body>
</html>