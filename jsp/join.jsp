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
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String email = request.getParameter("email");
String tel = request.getParameter("tel");
String address = request.getParameter("address");
String birthday = request.getParameter("birthday");
String gender = request.getParameter("gender");
String result = "";
int result2=999;


	// 2. 서버가 받은 데이터를 dao를 통해서 db에 저장해야 한다.
		
	JoinDto bag = new JoinDto();
	bag.setId(id);
	bag.setPw(pw);
	bag.setName(name);
	bag.setEmail(email);
	bag.setTel(tel);
	bag.setAddress(address);
	bag.setBirthday(birthday);
	bag.setGender(gender);

	JoinDao dao = new JoinDao();
	result2 = dao.create(bag);
	session.setAttribute("id", id); /* 서버에 저장!! */
	session.setAttribute("name", name);
	

%>

<!-- 3. db처리에 따라 결과를 클라이언트에게 html로 알려준다.-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입결과</title>
</head>
<body>

	<%if(result2==0){%> <!-- 0번은 sql 결과가 0. 아이디 안만들어진것. -->
	<script type="text/javascript">
	alert("가입실패. 아이디가 중복된 것 같습니다.")
	history.go(-1); /* 한칸뒤로 */
	</script>
	<%}else if(result2==1){%>
	<script type="text/javascript">
	alert("[가입 성공]\n<%=session.getAttribute("name")%>님 가입을 축하드립니다.\n로그인페이지로 이동합니다.")
	location.href="index3.jsp" /* 페이지 이동 */
 	</script>
	<%}%>
<br>
</body>
</html>