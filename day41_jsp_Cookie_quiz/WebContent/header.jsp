<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="youtubeList.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="dao" value="${YoutubeListDAO.getInstance() }"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day12</title>
<style>
#root {
	height: 500px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
#rootL{
	display: flex;
	justify-content: space-around;
}
#listRoot {
	width: 1000px;
	display: flex;
	flex-wrap: wrap;
}
#listLRoot {
	width: 1000px;
	font-size: 30px;
}
#listLRoot > p {
	font-size: 20px;
}
#recentRoot {
	width: 500px;
	justify-content: center;
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
		justify-content: space-around;
		align-items: center;
		height: 100px;
}
.left {
	display: flex;
	align-items: center;
	width: 50%;
	height: 100px;
}
.left > span {
	margin-left: 30px;
	
	font-size: 20px;
	text-align: center;
	font-weight: bold;
}
.right {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	
	width: 50%;
	height: 100px;
}
.right > span {
	display: flex;
	align-items: center;
	height: 35px;
	margin-right: 25px;
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
	cursor: pointer;
}
a > button {
	cursor: pointer;
}
span {
	width: 300px;
	height: 250px;
	margin: 10px;
}
img {
	width: 300px;
	height: 200px;
}
div > a > img {
	width: 100px;
	height: 50px;
}
</style>
</head>
<body>
	<div class="header">
		<div class="left">
			<h1>
				<a href="${cpath }">Day12</a>
			</h1>
		</div>
		<div class="right">
			<span>
				<a href="${cpath }/list.jsp"><button>목록</button></a>
				<a href="${cpath }/add.jsp"><button>추가</button></a>
			</span>
		</div>
	</div>
	<hr>
