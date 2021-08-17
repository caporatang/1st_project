<%@page import="project01.JoinDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");

JoinDao dao = new JoinDao();
String result = dao.read(id);

if (result.equals("0")) {
	result = "0";
} else
	result = "1";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(result.equals("0")){%>
	<script type="text/javascript">
		alert("[사용 가능] 아이디")
		window.close();
	</script>
	<%}else if(result.equals("1") ){ %>
	<script type="text/javascript">
		alert("[사용 불가능] 아이디")
		window.close();
	</script>
	<%} %>
</body>
</html>