<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<fieldset class="frame">
		<h3>글 읽기</h3>
		
		<c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
		
		<h4>${dto.title }</h4>
		<h5>
		<span class="writer">${dto.userId }</span>
		 | <fmt:formatDate value="${dto.writeDate }" pattern="yyyy-MM-dd a hh:mm"/>
		 | ${dto.ipaddr }</h5>
		<c:if test="${not empty dto.fileName }">
			<img src="${cpath }/upload/${dto.fileName }" width="300">
		</c:if>
		<p>${dto.content }</p>
	</fieldset>
	
	<div class="flex">
		<div>
			<a href="${cpath }/board/list.jsp"><button>목록</button></a>
		</div>
		<div>
			<a class="modify confirm" href="${cpath }/board/modify.jsp?idx=${dto.idx }"><button>수정</button></a>
			
			<a class="delete confirm" href="${cpath }/board/delete.jsp?idx=${dto.idx }">
				<button>삭제</button></a>
		</div>
	</div>
	
	<%--
		GET vs POST
		POST 1) queryString(X)
			 2) size 4KB over
			 3) multipart (not letter)
	 --%>
	
	<fieldset class="frame">
		<form method="POST">
			<textarea name="content" placeholder="바르고 고운말을 사용합시다"></textarea>
			<input type="hidden" name="idx" value="${dto.idx }">
			<input type="submit" value="작성">
		</form>
		
		<c:set var="replyList" value="${replyDAO.select(param.idx) }"/>
		<c:forEach var="reply" items="${replyList }">
		<div class="reply">
			${reply.userId } || <fmt:formatDate value="${reply.writeDate }" pattern="yyyy-MM-dd a hh:mm"/>
			<p>${reply.content }</p>
		</div>
		</c:forEach>
	</fieldset>
	
	<script>
		
	</script>
	
	<%-- view.jsp에서 POST요청 시 댓글 작성을 처리하게 만들었음 --%>
	<c:if test="${pageContext.request.method == 'POST' }">
		<c:if test="${empty login }">
		<c:redirect url="/member/login.jsp"/>
		</c:if>
		<jsp:useBean id="replyDTO" class="reply.ReplyDTO"/>
		<jsp:setProperty property="*" name="replyDTO"/>
		<jsp:setProperty property="board" name="replyDTO"
						 value="${param.idx }"/>
		<jsp:setProperty property="writer" name="replyDTO"
						 value="${login.idx }"/>
		<jsp:setProperty property="ipaddr" name="replyDTO"
						 value="${pageContext.request.remoteAddr }"/>
		<jsp:setProperty property="userAgent" name="replyDTO"
						 value="${header['User-Agent'] }"/>
		<c:set var="row" value="${replyDAO.insert(replyDTO) }"/>
		
		<script>
			const row = '${row }'
			
			if(row != 0) {
				alert('댓글 작성 완료 ~ ')
				location.href = '${cpath }/board/view.jsp?idx=${param.idx }'
			}
			else {
				alert('댓글 작성 실패 ~ ')
				history.go(-1)
			}
		</script>
	</c:if>
	
	
	<script>
//		const link = document.querySelector('a.delete')
		const textarea = document.querySelector('textarea[name="content"]')
		const btnList = document.querySelectorAll('a.confirm')
		const login = '${login.userId }'
		const cpath = '${cpath }'
		
		textarea.onfocus = loginCheck
		btnList.forEach(btn => btn.onclick = confirmHandler)
	</script>
</body>
</html>