<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:set var="list" value="${dao.selectAll() }"/>
	<div id="root">
		<table border="1" cellpadding="10" cellspacing="0">
			<thead>
			<tr bgcolor="silver">
				<th>No</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>즐겨찾기</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.idx }</td>
				<td><a href="${cpath }/view.jsp?idx=${dto.idx }"><button>${dto.name }</button></a></td>
				<td>${dto.phoneNumber }</td>
				<c:if test="${dto.favorites == 0 }">
				<td><a href="favorites.jsp?idx=${dto.idx }"><button>☆</button></a></td>				
				</c:if>
				<c:if test="${dto.favorites == 1 }">
				<td><a href="favorites.jsp?idx=${dto.idx }"><button>★</button></a></td>	
				</c:if>
			</tr>			
			</c:forEach>
			</tbody>
		</table>
		<form action="search.jsp">
			<p><input type="text" name="search" placeholder="이름으로 검색"></p>
			<p><input type="submit" value="검색"></p>
		</form>
	</div>
</body>
</html>