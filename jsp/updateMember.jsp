<%@page import="project01.JoinDto"%>
<%@page import="project01.JoinDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%String id = request.getParameter("id"); %>	

	<% 
	JoinDao dao = new JoinDao();
	JoinDto bag = new JoinDto();
	bag = dao.readMemberInfo(id);
	
	%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>막컬리 :: 오늘의 장보기, 막컬리</title>

</head>

<body>

	<!-- <form action="update.jsp"> -->
		<div class="join"
			style="width: 800px; height: 400px; margin:0px auto; ">
			
			<h1 align="center"><%=session.getAttribute("name")%>님의 개인정보수정</h1>
			<h3 align="right">
				<font size='5' color='red'>*</font>:필수입력사항
			</h3>
				<p align="left"><input type="button" value="탈퇴하기"  onclick="winopen2()" style="border-color: blue;">	</p>
			<hr width="100%" color='black'>
			<table style="margin-left: auto; margin-right: auto;">
			 	<tr>
					<th>아이디</th>
					 <td><input name="id" id="input" value="<%=session.getAttribute("id")%>" readonly ></td>
				</tr> 

				<!-- <tr>
					<th>현재 비밀번호<font color='red'>*</font></th>
					<td><input name="pw" maxlength="15"></td>
				</tr>
 -->				
				<tr>
					<th>새 비밀번호<font color='red'>*</font></th>
					<td><input type="password" id="pw" name="pw" maxlength="15"></td>
				</tr>
				
				<tr>
					<th>새 비밀번호 확인<font color='red'>*</font></th>
					<td><input type="password" id="pw2" name="pw2" maxlength="15"></td>
				</tr>

				<!-- <tr>
					<th>이름<font color='red'>*</font></th>
					<td><input name="name" maxlength="15" placeholder="이름을 입력해주세요."></td>

				</tr> -->
				<tr>
					<th>이메일<font color='red'>*</font></th>
					<td><input name="email" id="email" value="<%=bag.getEmail() %>" maxlength="30"></td>
					<!--  <td><input type='button' value='중복확인' style="border-color: blue;"></td> -->
				</tr>

				<tr>
					<th>휴대폰<font color='red'>*</font></th>
					<td><input type="number" id="tel" value="<%=bag.getTel() %>" name="tel" maxlength="11"></td>
				</tr>

				<tr>
					<th>주소<font color='red'>*</font></th>
					<td><input name="address" id="address" value="<%=bag.getAddress() %>" ></td>
				</tr>
<!-- 생년월일, 성별 : 선택입력사항 -->
				<tr>
					<th>생년월일<font color='red'>*</font></th>
					<td><input type="number" id="birthday" name="birthday" value="<%=bag.getBirthday() %>" maxlength="6"></td>
				</tr>

				<!-- <tr>
					<th>성별</th>
					<td colspan="3"><input type="radio" value="male" name="gender">남자
						<input type="radio" value="female" name="gender">여자
						<input type="radio" value="null" name="gender">선택안함</td>
				</tr> -->

			</table>
			<hr width="100%" color="black">
			<p align="center">
				<!-- <button type="submit" style="border-color: blue;">회원정보수정</button> -->
				<input type="button" value="수정하기" onclick="before()" style="border-color: blue;">
			</p>

		</div>
	<!-- </form> -->

<script type="text/javascript">

function winopen2() {
	var id1 = document.getElementById("input").value;
	if(confirm('진짜 탈퇴하실꺼에요????????')){
		location.href = "index8.jsp?id="+id1
	}
}

 function before() {
		var id1 = document.getElementById("input").value;
		var pw1 = document.getElementById("pw").value;
		var pw2 = document.getElementById("pw2").value;
		/* var name1 = document.getElementById("name").value; */
		var email1 = document.getElementById("email").value;
		var tel1 = document.getElementById("tel").value;
		var address1 = document.getElementById("address").value;
		var birthday1 = document.getElementById("birthday").value;
		/* var gender1 = document.getElementById("gender").value; */
	
	if (pw1 == "" || pw2 == "" || email1 == "" || tel1 == "" || address1 == "" || birthday1.length!=6 || pw1!=pw2){
		alert('공백이 존재하거나, 생년월일이 6자리가 아니거나,\n새 비밀번호가 일치하지 않습니다.')	
	}
	else{
		if(confirm('정말로 변경하시겠습니까?'))
			/* location.href = "update.jsp?id="+id1+"&pw="+pw1+"&pw2="+pw2+"&email="+email1+"&tel="+tel1+"&address="+address1+"&birthday="+birthday1 */	
			location.href = "index7.jsp?id="+id1+"&pw="+pw1+"&pw2="+pw2+"&email="+email1+"&tel="+tel1+"&address="+address1+"&birthday="+birthday1	
	}//젤큰if문	
 }//before()
	

</script>
</body>
</html>
