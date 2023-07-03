<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:set var="list" value="${dao.selectAll() }"/>
<body>
	<div id="root">
		<form action="search.jsp">
			<input type="number" name="month" min="1" max="12" placeholder="검색할 월">
			<p><input type="submit" value="검색"></p>
		</form>
		<c:forEach var="dto" items="${list }">
			<div><img src="${cpath }/image/${dto.pic }"></div>
			<div class="diary">
				<div class="Dright">내용 : ${dto.content }</div>
				<div class="Dleft">
					<div>${dto.writedate }</div>
					<div>${dto.ipaddr }</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>