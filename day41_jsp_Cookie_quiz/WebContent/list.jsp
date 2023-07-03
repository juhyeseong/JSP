<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:set var="list" value="${dao.selectAll() }"/>
	<div id="rootL">
		<div id="listRoot">
			<c:forEach var="dto" items="${list }">
			<span>
				<a href="${cpath }/view.jsp?idx=${dto.idx }"><img src="${dto.thumbnail }"></a><br>
				<c:if test="${fn:length(dto.title) > 35 }">
					${fn:substring(dto.title, 0, 35) }...<br>
				</c:if>
				<c:if test="${fn:length(dto.title) <= 35 }">
					${dto.title }<br>
				</c:if>
				${dto.channel }
			</span>
			</c:forEach>
		</div>
	</div>
</body>
</html>