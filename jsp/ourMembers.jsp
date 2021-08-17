<%@page import="project01.JoinDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//String id = request.getParameter("id");

JoinDao dao = new JoinDao();
String maleCount = dao.count("male");
String femaleCount = dao.count("female");
float maleCount1=Integer.parseInt(maleCount);
float femaleCount1=Integer.parseInt(femaleCount);

float malePercent=maleCount1/(maleCount1+femaleCount1)*100f;

float femalePercent=femaleCount1/(maleCount1+femaleCount1)*100f;


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Member</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>

<script type="text/javascript">
$(function () {
	
$('#b1').click(function() {
b1Tag=$('#five')
b1Val=b1Tag.val()
resultTag=$('#result')

	
	
if(b1Val.length!=5 ){
	alert('5글자 입력하라고요^^')
}else{
	resultTag.append(b1Val+'<br>')

}b1Tag.val('')
})
	
	
	
})//function() 
</script>

</head>
<body>
<div class="our"
			style="width: 800px; height: 400px; margin:0px auto;">
			<h1 align="center">막컬리의 회원은...</h1>
			<!-- 소수점 첫번째자리에서 반올림 -->
<hr color="black">
남자 회원 비율:<%=Math.round(malePercent) %>%<br>
여자 회원 비율:<%=Math.round(femalePercent) %>%
<hr color="black">
<h3>막컬리를 5글자로 표현해주세요! <br> 추첨을 통하여 할인쿠폰을 드립니다 . . .</h3>
<input maxlength="5" id=five>
<button id=b1 style="border-color: blue;" >전송</button>

<div id='result'></div>

</div>
</body>
</html>