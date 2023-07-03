<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
	<c:set var="dto" value="${dao.selectOne(param.idx) }" />
	<div id="root">
		<table>
			<tr>
				<th>No</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>즐겨찾기</th>
			</tr>
			<tr>
				<td class="param">${dto.idx }</td>
				<td>${dto.name }</td>
				<td>${dto.phoneNumber }</td>
				<td>${dto.favorites }</td>
			</tr>
		</table>
		<div class="member">
			<p>
				<a href="${cpath }/modify.jsp?idx=${dto.idx }"><button>수정</button></a>
				<a href="${cpath }/delete.jsp?idx=${dto.idx }"><button>삭제</button></a>
			</p>
		</div>
	</div>
</body>
</html>