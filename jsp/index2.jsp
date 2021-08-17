<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- icon Style -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <!-- swiper Style -->
    <link rel="stylesheet"href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <!-- common Style -->
    <link rel="stylesheet" href="css/style.css">
    <!-- jquery CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>막컬리::매일매일 신선한 장보기</title>
</head>
<body>
    <div id="wrap">
    	<!-- header 건들지마시오 -->
        <jsp:include page="header.jsp"></jsp:include>
 
        <div id="contents">
	        <!-- 이곳 안으로 편집해주시면 됩니다. 가운데 정렬은 class="container"걸어주시면 자동으로 걸립니다. -->
   			<jsp:include page="join.jsp"></jsp:include>
        </div>
        <!-- footer 건들지마시오 -->
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>

