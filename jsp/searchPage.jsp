<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="main.ListUpDTO"%>
<%@page import="main.ListUpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% 
    	String word = request.getParameter("word");
    	ListUpDAO dao = new ListUpDAO();
    	ListUpDTO dto = new ListUpDTO();
    	
    	ArrayList<ListUpDTO> list = dao.search(word);
    	
    	
    	//검색어 세션 저장
    	
    	//검색어에 세션 저장할 HashSet(스트링만 담는다.)
	    HashSet search = new HashSet<String>();
    	
    	//search세션이 없으면 세션을 생성해라.
    	if(session.getAttribute("search")==null){
    		session.setAttribute("search", search);
    	}
	    
    	//현재 세션의 값을 가져와보자.
    	HashSet<String> searchResult = (HashSet)session.getAttribute("search");
    		
    	//파라미터로 word 값이 있다면, 실행해라
    	if(word!=null){
    		if(searchResult.size()>=6){//세션의 갯수가 6개 이상이 되면 실행해라
    			//기존의 세션 저장된 값을 새 HashSet에 가져와라
        		HashSet<String> search1 = (HashSet)session.getAttribute("search");
    			//HashSet은 get을 못 사용하므로 iterator(반복자)를 사용하자.
    			Iterator iter = search1.iterator();
    			//세션의 값을 담을 ArrayList 생성(값 넣을 때 get을 사용하기 위해)
    			ArrayList<Object> arr = new ArrayList();
    			
    			while(iter.hasNext()){//iterator(반복자) 다음 값이 없을때까지 계속 반복한다.
    				//캐스팅으로 강제형변환 하여 String으로 변환한다.
    				String addIter = (String)iter.next();
    				//arr ArrayList에 값을 담는다.
    				arr.add(addIter);
    			}
    			
    			//arr ArrayList에 담긴 값을 하나씩 search HashSet에 담아준다.
				for(int i=0;i<arr.size(); i++) {
        			search.add(arr.get(i));
        		}
    			//search의 맨 앞 인덱스 번호의 단어를 삭제해라.
        		search.remove(arr.get(0));
    			//search HashSet의 맨 뒤에 파라미터로 받은 word를 추가해라.
        		search.add(word);
    			

    			
        	}else{//세션의 갯수가 6개 미만이라면 실행해라
        		//기존의 세션 저장된 값을 새 HashSet에 가져와서 담아라
        		HashSet<String> search1 = (HashSet)session.getAttribute("search");
    			Iterator iter = search1.iterator();
    			//기존 HashSet에 저장되어 있는 값을 while문으로 하나씩 arr ArrayList에 넣어라.
    			ArrayList<Object> arr = new ArrayList();
    			while(iter.hasNext()){
    				String addIter = (String)iter.next();
    				arr.add(addIter);
    			}
    			//arr ArrayList에 담긴 값을 하나씩 search HashSet에 담아준다.
				for(int i=0;i<arr.size(); i++) {
					search.add(arr.get(i));	
        		}
    			//search HashSet의 맨 뒤에 파라미터로 받은 word를 추가해라.
        		search.add(word);
        	}
    		//완성된 word HashSet를 search라는 이름을 가진 세션에 집어 넣자.
        	session.setAttribute("search", search);
    		    		
    	}else{//파라미터로 word 값이 없다면, 실행해라
    	
    		//기존의 세션 저장된 값을 새 HashSet에 가져와라
			Iterator iter = searchResult.iterator();
			//기존 HashSet에 저장되어 있는 값을 for문으로 하나씩 arr ArrayList에 넣어라.
			ArrayList<Object> arr = new ArrayList();
			while(iter.hasNext()){
				String addIter = (String)iter.next();
				arr.add(addIter);
			}
			//arr ArrayList에 담긴 값을 하나씩 search HashSet에 담아준다.
			for(int i=0;i<arr.size(); i++) {
				search.add(arr.get(i));
    		}
    		//완성된 word HashSet를 search라는 이름을 가진 세션에 집어 넣자.
        	session.setAttribute("search", search);
    	}
    	
    	
    	//나온 결과를 표현식의 값으로 꺼내기 위함
    	//세션값을 담았던 search HashSet에 iterator(반복자)를 사용하자.
		Iterator iter = search.iterator();
		//기존 HashSet에 저장되어 있는 값을 while문으로 하나씩 arr1 ArrayList에 넣어라.
		ArrayList<Object> arr1 = new ArrayList();
		while(iter.hasNext()){
			String addIter = (String)iter.next();
			arr1.add(addIter);
		}
    	
    	    	
    %>
    
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
   			<div class="search_page">
			    <div class="container">
			        <h2>검색 결과</h2>
			        <div class="search_box">
			        	<form action="searchPage.jsp">
				            <label>검색조건<input type="text" name="word" id="search" placeholder="검색어를 입력해주세요."></label>
				            <button class="btn_search_result"><i class="fas fa-search"></i></button>
			        	</form>
			        </div>
			        <div class="search_word">
			        	<%
			        	for(int i=0;i<search.size(); i++) {
			        	%>
			        	<span><a href="searchPage.jsp?word=<%= arr1.get(i) %>"><%= arr1.get(i) %></a></span>
			        	<%}%>
			        </div>
			        <p class="search_result">총 <span class="result_count">0<%= list.size() %></span>건이 검색되었습니다.</p>
			        <div class="search_list">
			            <ul>
			            	<%
			            		for(ListUpDTO loop :list){
			            	%>
			            	<li>
			                    <a href="kMeetInfo0.jsp?id=<%= loop.getProductNum()%>">
			                        <div class="img_box">
			                        	<img src="./img/<%= loop.getProductPic() %>" alt="<%= loop.getProductName()%>">
			                        </div>
			                        <div class="text_box">
			                            <p><%= loop.getProductName()%></p>
			                            <span><%= loop.getProductPrice()%>원</span>
			                        </div>
			                    </a>
			                </li>
							<%}%>
			            </ul>
			        </div>
			    </div>
			</div>
        </div>
        <!-- footer 건들지마시오 -->
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
    <script type="text/javascript">
		$('.btn_search_result').click(function(){
			var word = $('#search').val();
			if(word==""){
				alert('검색어를 입력해주세요');
				return false;	
			}else{
				return true;
			}
		});
		
		
    </script>
</body>
</html>