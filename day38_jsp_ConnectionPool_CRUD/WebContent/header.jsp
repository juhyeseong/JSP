<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="dao" value="${MemberDAO.getInstance() }"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day08-member</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="header">
		<div class="left">
		<c:if test="${empty member }">
			<span>user : 없음</span>
		</c:if>
		<c:if test="${not empty member }">
			<span>user : ${member.userName }</span>
		</c:if>
		</div>
		<div class="right">
			<c:if test="${empty member }">
				<span>
					<a href="${cpath }"><button>메인</button></a>
					<a href="${cpath }/login.jsp"><button>로그인</button></a>
					<a href="${cpath }/join.jsp"><button>회원가입</button></a>
				</span>
			</c:if>
			<c:if test="${not empty member }">
				<span>
					<a href="${cpath }"><button>메인</button></a>
					<c:if test="${member.idx == 2 }">
					<a href="${cpath }/list.jsp"><button>목록</button></a>
					</c:if>
					<a href="${cpath }/logout.jsp"><button>로그아웃</button></a>
					<a href="${cpath }/member.jsp"><button>회원정보</button></a>
				</span>
			</c:if>
		</div>
	</div>
	<hr>
