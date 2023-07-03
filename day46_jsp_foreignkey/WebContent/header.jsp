<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.*" import="sales.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="productDao" value="${ProductDAO.getInstance() }"/>
<c:set var="salesDao" value="${SalesDAO.getInstance() }"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day17-product and sales</title>
<style>
#root {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
}
legend {
	font-size: 25px;
	font-weight: bold;
}
fieldset {
	width: 450px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}
select {
	cursor: pointer;
    width: 450px;
    height: 40px;
}
input {
	cursor: pointer;
    width: 450px;
    height: 40px;
    margin: 3px;
}
input[type="submit"] {
	width: 457px;
}
input[type="date"] {
	width: 300px;
}
.button{
	width: 997px;
	height: 100px;
	margin-left: 510px;
}
p {
	display: flex;
	height: 35px;
	padding-left: 0px;
}
button {
	cursor: pointer;
	border: 1px solid black;
	background-color: darkgray;
	color: white;
	font-size: 15px;
	font-weight: bold;
	
	width: 80px;
	height: 35px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.header {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		align-items: center;
		height: 130px;
}
.top {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 50%;
	height: 80px;
}
.top > span {
	font-size: 20px;
	text-align: center;
	font-weight: bold;
}
.bottom {
	display: flex;
	align-items: center;
	
	width: 1000px;
	height: 50px;
}
.bottom > span {
	display: flex;
	justify-content: space-around;
	align-items: center;
	width: 1000px;
	height: 50px;
}
.bottom > span > a {
	cursor: pointer;
	
	text-align: center;
	font-weight: bold;
	font-size: 20px;
	
	width: 200px;
}
span > a > button {
	cursor: pointer;
	border: 1px solid black;
	background-color: darkgray;
	color: white;
	font-size: 15px;
	font-weight: bold;
	
	width: 80px;
	height: 35px;
	margin: 0px 5px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.member > p > a > button {
	cursor: pointer;
	border: 1px solid black;
	background-color: darkgray;
	color: white;
	font-size: 15px;
	font-weight: bold;
	
	width: 110px;
	height: 40px;
	margin: 0px 5px;
	display: flex;
	justify-content: center;
	align-items: center;
}
th, td {
	border: 1px solid black;
	
	text-align: center;
	font-size: 30px;
}
a {
	all: unset;
}
a > button {
	cursor: pointer;
}
img {
	width: 400px;
	height: 400px;
}
.diary {
	width: 400px;
	display: flex;
	justify-content: space-between;
}
.Dright {
	width: 300px;
}
textarea {
	resize: none;
	padding: 10px;
	width: 430px;
	height: 200px;
}
</style>
</head>
<body>
	<div class="header">
		<div class="top">
			<h1>상품 판매 관리</h1>
		</div>
		<div class="bottom">
			<span>
				<a href="${cpath }/productList.jsp">상품 목록</a>
				<a href="${cpath }/productAdd.jsp">상품 추가</a>
				<a href="${cpath }/salesList.jsp">매출 목록</a>
				<a href="${cpath }/salesAdd.jsp">매출 추가</a>
			</span>
		</div>
	</div>
	<hr>