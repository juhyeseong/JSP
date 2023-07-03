<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<% 
		String name = request.getParameter("name");
		session.setAttribute("name", name);
		StudentDTO dto = dao.selectOne(name);
		if(dto == null) {
			response.sendRedirect(cpath + "/list.jsp");
		}
		else {
	%>
	
	<form action="<%=cpath %>/modify-action.jsp" method="POST">
		<fieldset>
			<legend>수정</legend>
			<p><input type="text" name="name" placeholder="이름" value="<%=dto.getName() %>" required readonly="readonly"></p>
			<p><input type="number" name="age" placeholder="나이" value="<%=dto.getAge() %>" required autofocus></p>
			<p>
				<select name="gender" required>
					<option value="">== 성별 ==</option>
					<option value="남성" <%=dto.getGender().equals("남성") ? "selected" : "" %>>남성</option>
					<option value="여성" <%=dto.getGender().equals("여성") ? "selected" : "" %>>여성</option>
				</select>
			</p>
			<p><input type="submit" value="수정"></p>
		</fieldset>
	</form>
	<% } %>
</body>
</html>