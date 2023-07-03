<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<c:if test="${empty member }">
		<c:redirect url="login.jsp"/>
	</c:if>

	<div id="root">
		<h2>회원정보</h2>
		
		<table border="1" cellpadding="10" cellspacing="0">
			<thead>
			<tr>
				<th>idx</th>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>이메일</th>
				<th>데이트</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>${member.idx }</td>
				<td>${member.userId }</td>
				<td>${member.userPw }</td>
				<td>${member.userName }</td>
				<td>${member.age }</td>
				<td>${member.gender }</td>
				<td>${member.email }</td>
				<td>${member.birth }</td>
			</tr>
			</tbody>
		</table>
		
		<div class="member">
			<p>
				<a href="${cpath }/index.jsp"><button>메인</button></a>
				<a href="${cpath }/modify.jsp"><button>회원정보수정</button></a>
				<a><button id="delete">회원탈퇴</button></a>
			</p>
		</div>
	</div>
	
	<script>
		const button = document.getElementById('delete');
		
		button.onclick = function() {
			if(confirm('탈퇴하시겠습니까 ? ')){
				location.href = 'delete.jsp';
			}
			else {
				alert('탈퇴를 취소합니다 ~ ');
			}
		}
	</script>
</body>
</html>