<%@page import="project01.JoinDto"%>
<%@page import="project01.JoinDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>막컬리 :: 오늘의 장보기, 막컬리</title>


</head>
<body>

	<div class="join" style="width: 800px; height: 400px; margin: 0px auto; background-color: aqua;">
		<h1 align="center">Fake Main</h1>
		<hr width="100%" color='black'>

		<p align="center">
			<%if(session.getAttribute("id")==null){%>
			로그인 해주세요^^<br>
			<input type="button" value="로그인" onclick="location='index3.jsp'" style="border-color: blue;">
			<%}else{%>
			<%=session.getAttribute("name")%> 회원님,안녕하세요<br><br>
			<input type="button" value="정보수정" onclick="location='index6.jsp?id=<%=session.getAttribute("id")%>'" style="border-color: blue;">
			<%} %>
		</p>
		<hr width="100%" color="black">
	</div>

</body>


</html>