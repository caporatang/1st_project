<%@page import="java.util.ArrayList"%>
<%@page import="main.ListUpDTO"%>
<%@page import="main.ListUpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ListUpDAO dao = new ListUpDAO();
	ArrayList<ListUpDTO> list = dao.read("N");
%>
<div class="new_product">
    <div class="container">
        <h2><a href="category2.jsp?id=N">신상품<i class="fas fa-chevron-right"></i><a></h2>
        <div class="swiper-container new_product_slide">
            <div class="swiper-wrapper">
            <%
				for(int i = 0; i <8; i++){
					ListUpDTO arr = list.get(i);
			%>
				<div class="swiper-slide">
					<a href="kMeetInfo0.jsp?id=<%= arr.getProductNum()%>">
						<img src="./img/<%= arr.getProductPic() %>" alt="<%= arr.getProductName() %>">
					</a>
				</div>	
			<%}%>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
        <div class="swiper-container new_product_text">
            <div class="swiper-wrapper">
        	<%
				for(int i = 0; i <8; i++){
					ListUpDTO arr = list.get(i);
			%>
				<div class="swiper-slide">
                    <a href="#" class="new_product_name"><%= arr.getProductName() %></a>
                    <span class="new_product_price"><%= arr.getProductPrice() %>원</span>
                </div>	
			<%}%>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
</div>