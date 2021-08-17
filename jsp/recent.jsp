<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("recent")==null){
		ArrayList<String[]> recent = new ArrayList();
		session.setAttribute("recent", recent);
	}
	ArrayList<String[]> result1 = (ArrayList)session.getAttribute("recent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.recent_product{
		/* 다른 애들보다 맨 앞에 있음. 맨 위 레이어라 생각하면 됨 */
		z-index : 1000;
		/* 화면 특정 위치에 아예 고정 시켜버리는거. 스크롤 영향 안받음 */
		position : fixed;
		/* position 건 애들은 top, bottom, left, right로 위치 조절함 */
		right: 0;
		/* Y축 정 가운데 위치하게 하는 방법 이 두가지를 사용함 */
  		top: 50%;
    	transform: translateY(-50%);
	}
	.recent_product ul{
		width: 100px;
	    background: #371bb1;
	    color : #fff;
	    display: inline-block;
	    padding: 10px;
	    border-radius: 10px;
}
	}
	.recent_product li{
		float : left;
	}
	.recent_product a{
		display : block;
	}
	
	.recent_product a img{
		width : 80px;
	}
</style>
</head>
<body>
	<div class="recent_product">

		<ul>
			<span>최근 본 상품</span>
		<%
			for(int i=0;i< result1.size(); i++) {
		%>	
			<li><a href="<%= result1.get(i)[0] %>"><img src="<%= result1.get(i)[1] %>"></a></li>
	<%}%>
		</ul>
	</div>
</body>
</html>