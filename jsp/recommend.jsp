<%@page import="main.ListUpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.ListUpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ListUpDAO dao = new ListUpDAO();
	
	ArrayList<ListUpDTO> list = dao.read("B");

%>
<div class="recommend">
    <div class="container">
        <h2>이 상품이 <span class="main_color">Best Seller</span></h2>
        <div class="swiper-container Recommend_product">
            <div class="swiper-wrapper">
            	 <%
				for(int i = 0; i <8; i++){
					ListUpDTO arr = list.get(i);
			%>
				<div class="swiper-slide"><a href="kMeetInfo0.jsp?id=<%= arr.getProductNum()%>"><img src="./img/<%= arr.getProductPic() %>" alt="<%= arr.getProductName() %>"></a></div>	
			<%}%>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
         <div class="swiper-container recommend_product_text">
            <div class="swiper-wrapper">
            	<%
				for(int i = 0; i <8; i++){
					ListUpDTO arr = list.get(i);
			%>
				<div class="swiper-slide">
                    <a href="#" class="recommend_name"><%= arr.getProductName() %></a>
                    <span class="recommend_price"><%= arr.getProductPrice() %>원</span>
                </div>	
			<%}%>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
</div>