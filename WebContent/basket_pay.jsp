<%@page import="com.atg.Basket.dto.BasketDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<%
	BasketDto dto = (BasketDto)request.getAttribute("dto");
%>
<script type="text/javascript">
//결제하기 버튼 누르면
$(function(){
var IMP = window.IMP;
IMP.init("imp35514559");

// IMP.request_pay(param, callback) 호출
IMP.request_pay({ // param
	
  pg: "html5_inicis",
  pay_method: "card",
  merchant_uid: "merchant-"+new Date().getTime(),
  name: "<%=dto.getItemDto().getItem_name()%>",
  amount: <%=dto.getBas_count() * dto.getItemDto().getItem_price()%>,
  buyer_email: "<%=dto.getMemberDto().getMb_email()%>",
  buyer_name: "<%=dto.getMemberDto().getMb_name()%>",
  buyer_addr: "<%=dto.getMemberDto().getMb_addr()%>",

}, function (rsp) { // callback
  if (rsp.success) {
	// jQuery로 HTTP 요청
	alert("결제가 완료되었습니다.");
	
	window.location.href="Basketcontroller.do?command=paylist&mb_no=<%=dto.getMemberDto().getMb_no()%>&bas_no=<%=dto.getBas_no()%>&bas_pay=Y";
	
    } else {
      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
    }
  });
});	

</script>

</body>
</html>