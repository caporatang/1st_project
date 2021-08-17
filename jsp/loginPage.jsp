<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%session.invalidate(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>막컬리 :: 오늘의 장보기, 막컬리</title>
</head>
<body>

	<form action="login.jsp">
		<div class="join"
			style="width: 800px; height: 400px; margin:0px auto; ">
			<h1 align="center">로 그 인</h1>
			<hr width="100%" color='black'>
			<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<th>아이디</th>
					<td><input name="id" id="id" placeholder="아이디를 입력해주세요."></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input name="pw" type="password" id="pw" placeholder="비밀번호를 입력해주세요."></td>
				</tr>
			</table>
			<hr width="100%" color="black">
			<p align="center">
				<input type="button" onclick="winopen()" value="로그인" style="border-color: blue;">
			</p>
		</div>
	</form>
	 <!-- <input type="button" value="공백확인" onclick="winopen()" style="border-color: blue;"> -->
	 
	<!-- <p align="center">
		<button onclick="location='joinForm.jsp'" style="border-color: blue;">회원가입</button>
	</p> -->
<script type="text/javascript">
function winopen() {
var id = document.getElementById("id").value;
var pw = document.getElementById("pw").value;
	if(id=="" || pw==""){
		alert("아이디 또는 비번을 입력 안하셨습니다~");
	}else{
 	/* window.open("login.jsp?id="+id+"&pw="+pw); */ 
 	location.href="index4.jsp?id="+id+"&pw="+pw; /* 페이지 이동 */
	} 
}

</script>
</body>

</html>