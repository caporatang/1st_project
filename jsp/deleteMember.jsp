<%@page import="project01.JoinDao"%>
<%@page import="project01.JoinDto"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 1. 클라이언트가 전송한 데이터들을 가지고 와야한다. -->

<%
//자바 넣어주는 부분임. 동적인건 자바가 처리해야하니까.
//HttpServletRequest request= new HttpServletRequest(); ->이거 이미 톰캣이했음

String id = request.getParameter("id");
int result = 999;

	// 2. 서버가 받은 데이터를 dao를 통해서 db에 저장해야 한다.
	JoinDao dao = new JoinDao();
	result = dao.delete(id);
	session.setAttribute("id", id); /* 서버에 저장!! */

%>

<!-- 3. db처리에 따라 결과를 클라이언트에게 html로 알려준다.-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 결과</title>
</head>
<body>

	<%
	if (result == 0) {
	%>
	<script type="text/javascript">
		alert("삭제 실패")
		history.go(-1); /* 한칸뒤로 */
	</script>
	<%}else if(result ==1) {%>
	<script type="text/javascript">
		alert('[회원정보 삭제성공]\n<%=session.getAttribute("id")%>님 그동안 감사했습니다.')
		<%session.invalidate(); %>
		/* location.href = "loginPage.jsp"; /* 페이지 이동 */
		location.href = "index3.jsp"; /* 페이지 이동 */
	</script>
	<%}else{%>
	<script type="text/javascript">
	alert('모가')
	</script>
	<%}%>
		
	
	
	
	<br>
</body>
</html>