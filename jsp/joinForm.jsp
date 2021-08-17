<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>막컬리 :: 오늘의 장보기, 막컬리</title>

</head>

<body>

	<!-- <form action="join.jsp"> -->
		<div class="join"
			style="width: 800px; height: 400px; margin: 0px auto; ">

			<h1 align="center">회 원 가 입</h1>
			<h3 align="right">
				<font size='5' color='red'>*</font>:필수입력사항
			</h3>
			<p align="left">
		<input type ="button" value="About Member" onclick="winopen2()" style="border-color: blue;">
			
	</p>
			<hr width="100%" color='black'>
			<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<th>아이디<font color='red'>*</font></th>
					<td><input name="id" id="input" maxlength="10"
						placeholder="4자 이상 입력해주세요."></td>
					<td><input type="button" value="중복확인" onclick="winopen()"
						style="border-color: blue;"></td>
				</tr>

				<tr>
					<th>비밀번호<font color='red'>*</font></th>
					<td><input type="password" id='pw' name="pw" maxlength="15"
						placeholder="비밀번호를 입력해주세요."></td>
				</tr>

				<tr>
					<th>이름<font color='red'>*</font></th>
					<td><input name="name" id="name" maxlength="15"
						placeholder="이름을 입력해주세요."></td>

				</tr>
				<tr>
					<th>이메일<font color='red'>*</font></th>
					<td><input name="email" id="email" maxlength="30"
						placeholder="예:abc@naver.com"></td>
					<!--  <td><input type='button' value='중복확인' style="border-color: blue;"></td> -->
				</tr>

				<tr>
					<th>휴대폰<font color='red'>*</font></th>
					<td><input type="number" id="tel" name="tel" maxlength="11"
						placeholder="숫자만 입력해주세요."></td>
				</tr>

				<tr>
					<th>주소<font color='red'>*</font></th>
					<td><input name="address" id="address" placeholder="주소를 입력해주세요."></td>
				</tr>
				<!-- 생년월일, 성별 : 선택입력사항 -->
				<tr>
					<th>생년월일<font color='red'>*</font></th>
					<td><input type="number" id="birthday" name="birthday" maxlength="6"
						placeholder="예:940429"></td>
				</tr>

				<tr>
					<th>성별</th>
					<td colspan="3"><input type="radio" value="male" name="gender" id="gender">남자
									<input type="radio" value="female" name="gender" id="gender">여자
									<input type="radio" value="null" name="gender" id="gender">선택안함</td>
				</tr>

			</table>
			<hr width="100%" color="black">
			<p align="center">
				<input type="button" value="가입하기" onclick="join()" style=" border-color: blue;">
			</p>

		</div>
	<!-- </form> -->
	<script type="text/javascript">
function winopen() {
var value = document.getElementById('input').value;

if(value=="" || value.length<4){
	alert("아이디를 입력안하셨거나, 너무 짧습니다.");
}else
	 window.open("idCheck.jsp?id="+value); 
	}
	
function winopen2() {
		  /* window.open("ourMembers.jsp"); */ 
		  /* window.open("index0.jsp"); */ 
		  location.href = "index0.jsp" 
}
function join() {

	var id1 = document.getElementById("input").value;
	var pw1 = document.getElementById("pw").value;
	var name1 = document.getElementById("name").value;
	var email1 = document.getElementById("email").value;
	var tel1 = document.getElementById("tel").value;
	var address1 = document.getElementById("address").value;
	var birthday1 = document.getElementById("birthday").value;
	var gender1 = document.getElementById("gender").value;

	if (id1.length < 4 || id1 == "" || pw1 == "" || name1 == "" || email1 == "" || tel1 == "" || address1 == "" || birthday1.length!=6){
		alert("아이디가 너무 짧거나... 공백이 있거나.. 생년월일이 6자리가 아닙니다.")
	}else{
		/* location.href = "join.jsp?id="+id1+"&pw="+pw1+"&name="+name1+"&email="+email1+"&tel="+tel1+"&address="+address1+"&birthday="+birthday1+"&gender="+gender1 */
		location.href = "index2.jsp?id="+id1+"&pw="+pw1+"&name="+name1+"&email="+email1+"&tel="+tel1+"&address="+address1+"&birthday="+birthday1+"&gender="+gender1;
	}
}		  
		  

</script>
</body>
</html>
