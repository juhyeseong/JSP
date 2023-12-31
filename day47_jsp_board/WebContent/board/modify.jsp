<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<main>
		<h3>새 글 수정</h3>
		<c:if test="${empty login }">
			<c:redirect url="/member/login.jsp"/>
		</c:if>
		
		<c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
		<h4>dto : ${dto }</h4>
		
		<form method="POST" enctype="multipart/form-data">
			<p>
				<input type="text" name="writerName" value="${login.userId }" readonly>
				<input type="hidden" name="writer" value="${login.idx }">
			</p>
			<p>
				<input type="text" name="title" placeholder="제목" value="${dto.title }" autofocus>
				<input type="hidden" name="idx" value="${dto.idx }">
			</p>
			<p>
				<textarea name="content" placeholder="내용을 작성하세요">${dto.content }</textarea>
			</p>
			<p>
				<input type="file" name="upload"><br>
				<sub>
					현재 첨부 파일 : ${not empty dto.fileName ? dto.fileName : '없음' }
					<input type="hidden" name="delete" value="${dto.fileName }">
					<label><input type="checkbox" name="deleteFile">첨부파일 삭제</label>
				</sub>
			</p>
			<p><input type="submit" value="수정완료"></p>
		</form>
		
		<c:if test="${pageContext.request.method == 'POST' }">
			<c:set var="fileUtil" value="${FileUtil.getInstance() }"/>
			<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }"/>
			<c:set var="row" value="${boardDAO.update(dto) }"/>
			<c:redirect url="/board/view.jsp?idx=${dto.idx }"/>
			
			<script>
				const row = '${row }'
				
				if(row != 0) {
					alert('수정 완료 ~ ')
					location.href = '${cpath }/board/list.jsp?idx=${dto.idx }'
				}
				else {
					alert('수정 실패 ~ ')
					history.go(-1)
				}
			</script>
		</c:if>
	</main>
		
	
</body>
</html>