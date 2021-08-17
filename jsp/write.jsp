<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- icon Style -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
  <!-- common Style -->
  <link rel="stylesheet" href="css/style.css">
  <!-- jquery CDN -->
 	<link rel = "stylesheet" href = "css/write.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="js/index.js"></script>
<title>Insert title here</title>
</head>
<body>
  <div id="wrap">
  	<!-- header 건들지마시오 -->
    <jsp:include page="header.jsp"></jsp:include>
     <div id="contents">
	     <div class= "container">
				<div class = "row">
				
					<form action = "check.jsp">
						<table class = "writetable" style = "text-align: center; border: 1px soild #DDDDDD">
						<thead>
						<tr>
						<th colspan= "2" style= "background-color : #EEEEEE; text-align : center;">글쓰기</th>
						
						</tr>
						</thead>
						<tbody>
						
						
						
						
						<select name="noticeKinds" id="noticeKinds">
						<option value="order">주문</option>
						<option value="pay">결제</option>
						</select>
						<tr>
						<td><input type = "text" class="title" placeholder = "제목을 작성하세요" name = "noticeTitle" maxlength="50"></td>
						</tr>
						<tr>
						<td><input type = "date" class="date" placeholder = "날짜를 선택해주세요" name = "noticeDate" maxlength="50"></td>
						</tr>
						<tr>
						<td><input type = "text" class="id" name = "noticeWriter" maxlength="50" value = "apple"></td>
						</tr>
						
						
						
						<tr>
						<td><textarea class="content" placeholder = "내용을 작성하세요" name = "noticeContent" maxlength="2048" cols= "50"></textarea></td>
						</tr>
						
						
						</table>
						
						<button class ="btn">글쓰기</button>
							
					</form>
				</div>
			</div>
    <!-- footer 건들지마시오 -->
    <jsp:include page="footer.jsp"></jsp:include>
  </div>
</body>
</html>