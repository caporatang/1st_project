<%@page import="project01.JoinDao"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 1. 클라이언트가 전송한 데이터들을 가지고 와야한다. -->

<%
//자바 넣어주는 부분임. 동적인건 자바가 처리해야하니까.
//HttpServletRequest request= new HttpServletRequest(); ->이거 이미 톰캣이했음
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String result1 = "";


	JoinDao dao = new JoinDao();
	result1 = dao.read(id);
	String result2 = dao.name(id);
	session.setAttribute("id", id);
	session.setAttribute("name", result2);

%>

<!-- 3. db처리에 따라 결과를 클라이언트에게 html로 알려준다.-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인결과</title>
</head>
<body>

	<%if(result1.equals(pw)) {%>
	<script type="text/javascript">
		alert("[로그인성공]\n<%=session.getAttribute("name")%>님 안녕하세요^^ 메인으로 이동합니다.")
		/* location.href = "fakeMain.jsp" */
		location.href = "index.jsp"
	</script>
	<%}else {%>
	<script type="text/javascript">
		alert("아이디, 비밀번호가 일치하지 않습니다.")
		history.go(-1);
	</script>
	<%}%>
</body>
</html>