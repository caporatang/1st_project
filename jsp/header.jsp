<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
	Object idInfo = session.getAttribute("id");
 	String idString = (String)idInfo;
 %>
<header class="row">
      <div class="notice_header">
          <div class="container">
              <a href="bbs.jsp"><p>지금 가입하시면 신선한 상품을 빠르게 배송해드려요.<i class="fas fa-angle-right"></i></p></a>
          </div>
      </div>
      <div class="list_header">
          <div class="container">
              <ul class="list_menu">
	               	<%
	               	if(session.getAttribute("id")==null){%>
	                   <li><a href="index1.jsp">회원가입</a></li>
	                   <li><a href="index3.jsp">로그인</a></li>
	               	<%}
	               	else{%>
	               	<li><a href="#"><%=session.getAttribute("name")%>님</a></li>
	                   <li><a href="index6.jsp?id=<%=idString %>">정보수정</a></li>
	                   <%}%>
	                <li><a href="bbs.jsp">공지사항</a></li>
               </ul>
          </div>
      </div>
      <div class="logo_header">
          <div class="container">
              <h1>
                  <a href="index.jsp"><span class="blind">막컬리 logo</span><img src="img/logo.png" alt="logo"></a>
              </h1>
          </div>
      </div>

  </header>
  <nav>
      <div class="container">
          <ul id="gnb">
              <li class="total_menu"><a href="#"><i class="fas fa-bars"></i> 전체 카테고리</a>
                  <div class="sub_nav">
                      <ul class="sub_gnb">
                          <li><a href="category.jsp?id=M"><i class="fas fa-drumstick-bite"></i>정육·계란</a>
                              <ul class="sub_lnb">               
                                  <li><a href="category.jsp?id=MM">국내산 소고기</a></li>
                                  <li><a href="category.jsp?id=MI">수입산 소고기</a></li>
                                  <li><a href="category.jsp?id=MP">돼지고기</a></li>
                                  <li><a href="category.jsp?id=ME">계란</a></li>
                                  <li><a href="category.jsp?id=MC">닭·오리</a></li>
                                  <li><a href="category.jsp?id=MK">양념육·돈까스</a></li>
                              </ul>
                          </li>
                          <li><a href="category.jsp?id=S"><i class="fas fa-fish"></i>해산물·생선</a>
                              <ul class="sub_lnb">               
                                  <li><a href="category.jsp?id=SA">생선</a></li>
                                  <li><a href="category.jsp?id=SB">어패류</a></li>
                                  <li><a href="category.jsp?id=SC">갑각류</a></li>
                              </ul>
                          </li>
                          <li><a href="category.jsp?id=V"><i class="fas fa-carrot"></i>채소</a>
                              <ul class="sub_lnb">               
                                  <li><a href="category.jsp?id=VA">친환경</a></li>
                                  <li><a href="category.jsp?id=VB">고구마·당근·감자</a></li>
                                  <li><a href="category.jsp?id=VC">시금치·쌈채소·나물</a></li>
                                  <li><a href="category.jsp?id=VD">브로콜리·파프리카·양배추</a></li>
                                  <li><a href="category.jsp?id=VE">양파·대파·마늘·배추</a></li>
                                  <li><a href="category.jsp?id=VF">오이·호박·고추</a></li>
                                  <li><a href="category.jsp?id=VG">냉동·간편채소</a></li>
                              </ul>
                          </li>
                          <li><a href="category.jsp?id=F"><i class="fas fa-apple-alt"></i>과일</a>
                              <ul class="sub_lnb">               
                                  <li><a href="category.jsp?id=FA">친환경</a></li>
                                  <li><a href="category.jsp?id=FB">제철 과일</a></li>
                                  <li><a href="category.jsp?id=FC">국산 과일</a></li>
                                  <li><a href="category.jsp?id=FD">수입 과일</a></li>
                              </ul>
                          </li>
                          <li><a href="category.jsp?id=L"><i class="fas fa-egg"></i>견과·쌀</a>
                              <ul class="sub_lnb">               
                                  <li><a href="category.jsp?id=LA">견과류</a></li>
                                  <li><a href="category.jsp?id=LB">쌀·잡곡</a></li>
                              </ul></li>
                      </ul>
                  </div>
              </li>
              <li><a href="category2.jsp?id=N">신상품</a></li>
              <li><a href="category2.jsp?id=B">베스트</a></li>
              <li><a href="category2.jsp?id=C">알뜰쇼핑</a></li>
          </ul>
          <div id="side_search">
              <form action="searchPage.jsp">
                  <input type="text" placeholder="검색어를 입력해주세요." name="word" id="word">
                  <button type="submit" class="btn_main_search"><span class="blind">검색</span><i class="fas fa-search"></i></button>
              </form>
          </div>
          <div id="sub_menu">
              <a href="basket.jsp"><i class="fas fa-shopping-cart"></i></a>
          </div>
      </div>
  </nav>
  
  <script>
	
	$('.btn_main_search').click(function(){
		var word = $('#word').val();
		if(word==""){
			alert('검색어를 입력해주세요');
			return false;	
		}else{
			return true;
		}
	});
  </script>