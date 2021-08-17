<%@page import="main.ListUpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.ListUpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
		ListUpDAO dao = new ListUpDAO();
		String id = "MM";
		ArrayList<ListUpDTO> list = dao.read(id);
	%>
		
       <div class="swiper-container menu_product_slide swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
	              <div class="swiper-wrapper" id="swiper-wrapper-b2f4aaad9a573d410" aria-live="polite" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
	            	 <%
					for(int i = 0; i <4; i++){
						ListUpDTO arr = list.get(i);
				%>
					<div class="swiper-slide swiper-slide-active" role="group" aria-label="1 / 8" style="width: 297.5px; margin-right: 30px;"><a href="kMeetInfo0.jsp?id=<%= arr.getProductNum()%>"><img src="./img/<%= arr.getProductPic() %>" alt="<%= arr.getProductName() %>"></a></div>	
				<%}%>
	             </div>
	         </div>
  			 <div class="swiper-container menu_product_text swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
	             <div class="swiper-wrapper" id="swiper-wrapper-4b5396e4dc9f39af" aria-live="polite" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
	             	<%
					for(int i = 0; i <4; i++){
						ListUpDTO arr = list.get(i);
				%>
	                <div class="swiper-slide swiper-slide-active" role="group" aria-label="1 / 8" style="width: 297.5px; margin-right: 30px;">
	                    <a href="kMeetInfo0.jsp?id=<%= arr.getProductNum()%>" class="menu_product_name"><%= arr.getProductName() %></a>
	                    <span class="menu_product_price"><%= arr.getProductPrice() %>원</span>
	                </div>	
				<%}%>
	             </div>
	         </div>
	         
	         
