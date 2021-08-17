<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String sId = "apple"; // 세션의 id를 꺼내주고 ! 
		String pId = "p100";//request.getParameter("pId"); // 이걸로 앞페이지에서 다 받아와야한다.
		String amount = "2000";
		int amount2 =Integer.parseInt(amount);
		String pName = "맠컬리상품";
		String cost1=request.getParameter("cost");
		int cost2= Integer.parseInt(cost1);

	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
	function pay() {

		
		var IMP = window.IMP; // 생략가능
		IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		//IMP.request_pay({json}, function(x) {})
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '<%= pName %>',
			amount : <%= cost2 %>,
			buyer_email : 'iamport@siot.do',
			buyer_name : '<%= sId %>', //아이디
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if ( rsp.success ) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					console.log(msg)
					location.href = "pay02.jsp?sId=<%= sId %>&pId=<%= pId %>&pName=<%= pName %>&amount=<%= amount2 %>"
					alert('결제가 성공적으로 완료 되었습니다. ')
					location.href="index.jsp";
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					console.log(msg)
					alert('결제가 취소되었습니다.')
					location.href="basket.jsp";
				}
		});
	}
	 //pay end
	 pay()
		</script>	
	</head>
</html>

