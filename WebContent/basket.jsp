<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Basket.dto.BasketDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template</title>

<!-- 부트스트랩 css -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<!-- 두개는 메뉴바 css -->
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/navbar.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- 두개는 순서 그대로!! 변경ㄴㄴ -->
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>

<!-- basket 관련 -->
<script type="text/javascript" src="resources/js/basket.js"></script>
<link rel="stylesheet" href="resources/css/basket.css">
<link rel="stylesheet" href="resources/css/Template.css">
    
</head>
<body>
<%
	RegisterDto LDto = (RegisterDto)session.getAttribute("LDto");
	List<BasketDto> list = (List<BasketDto>)request.getAttribute("list");
%>
   
	
		<!-- 메뉴바 -->
	<nav class="navbar navbar-light navbar-nav ">
		<a class="navbar-brand navbar-nav " href="main.jsp"><h1>AT-G</h1></a>
	</nav>
	<ul class="nav justify-content-end mt-1">
		<li class="nav-item mr-3">
		<%
		if(LDto != null){ //로그인이 되어있으면
		%>
		
		<%=LDto.getMb_name() %>님
		
		<%
		}
		%>
		</li>
		<li class="nav-item">
		<%
		if(LDto != null){
		%>
		<a class="mr-3" href="mypage.jsp">마이페이지</a>
		<%
		}else{
		%>
		<a class="mr-3" href="login.jsp">마이페이지</a>
		<%
		}
		%>
		</li>
		<li class="nav-item">
		<%
		if(LDto != null){ //로그인이 되어있으면
		%>
		<a class="mr-3" href="Basketcontroller.do?command=list&mb_no=<%=LDto.getMb_no()%>">장바구니</a>		
		<%
		}else{
		%>
		<a class="mr-3" href="login.jsp">장바구니</a>
		<%
		}
		%>
		</li>
		<li class="nav-item">
		<%
		if(LDto == null){
		%>
		<a class="mr-5" href="login.jsp">로그인</a>
		<%
		}else{
		%>
		<a class="mr-5" href="RegisterController.do?command=logout">로그아웃</a>
		<%
		}
		%>		
		</li>
	</ul>

	<div class="nav_cus sticky-top">
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-center dropdown sticky-top">
			<ul class="nav justify-content-center ">
				<li class="nav-item dropdown mr-5"><a
					class="nav-link text-white " id="navbarDropdown" href="">프로그램</a>
					<div class="dropdown-menu mt-2">
						<a class="dropdown-item" href="tutorial.jsp">튜토리얼</a> <a class="dropdown-item"
							href="program.jsp">루틴운동</a>
					</div></li>
				<li class="nav-item dropdown mr-5"><a
					class="nav-link text-white" id="navbarDropdown" href="">외부활동</a>
					<div class="dropdown-menu mt-2"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="public.jsp">공공체육시설</a>
						<a class="dropdown-item text-white" href="">-</a>
					</div></li>
				<li class="nav-item dropdown mr-5"><a
					class="nav-link text-white" id="navbarDropdown" href="">운동상품</a>
					<div class="dropdown-menu mt-2"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="itemsearch.jsp">운동기구찾기</a> <a
							class="dropdown-item" href="Itemcontroller.do?command=itemlist">상품판매</a>
					</div></li>
				<li class="nav-item dropdown mr-5"><a
					class="nav-link text-white" id="navbarDropdown" href="">커뮤니티</a>
					<div class="dropdown-menu mt-2"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="ReviewController.do?command=review_list&nt_no=1">리뷰</a> <a class="dropdown-item"
							href="">실시간 채팅</a>
					</div></li>
				<li class="nav-item dropdown "><a class="nav-link text-white" id="navbarDropdown" href="">고객지원</a>
					<div class="dropdown-menu mt-2" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="NoticeController.do?command=notice_list&nt_no=1">공지사항</a> 
						<a class="dropdown-item" href="qna_user.jsp">QnA</a>
					</div></li>
			</ul>
		</nav>
	</div>



   
   <!-- 내용 -->
   <section class="secssion">
   	
	 <h3 class="title">Shopping bag</h3>
	    
	        <div class="left">
				<form action="Basketcontroller.do" method="post">
					<input type="hidden" name="command" value="muldel">
					<input type="hidden" name="mb_no" value="<%=LDto.getMb_no()%>">
					<table class="table table-hover">
						<col width="10%">
						<col width="20%">
						<col width="30%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<thead>
							<tr>
								<th scope="col" class="text-center"><input type="checkbox" name="all" onclick="allChk(this.checked);"></th>
								<th scope="col" class="text-center">물품 사진</th>
								<th scope="col" class="text-center">물품 이름</th>
								<th scope="col" class="text-center">수량</th>
								<th scope="col" class="text-center">가격</th>
								<th scope="col" class="text-center">결제여부</th>
								<th scope="col" class="text-center">배송조회</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (list.size() == 0) {
							%>
							<tr>
								<td colspan="4">-------------장바구니에 담긴 상품이 없습니다-----------</td>
							</tr>
							<%
								} else {
								for (BasketDto dto : list) {
							%>
							<tr>
								<td scope="col" class="text-center pt-3 pb-1">
									<input type="checkbox" name="chk" id="bas_no" value="<%=dto.getBas_no()%>">
								</td>
								<td scope="col" class="text-center ">
									<img alt="d" name="item_url" src="<%=dto.getItemDto().getItem_url()%>" width="40px" height="40px">
								</td>
								<td scope="col" class="text-center pt-3 pb-1"><%=dto.getItemDto().getItem_name()%></td>
								<td scope="col" class="text-center pt-3 pb-1"><%=dto.getBas_count()%></td>
								<td scope="col" class="text-center pt-3 pb-1"><%=dto.getItemDto().getItem_price() * dto.getBas_count()%></td>
					
								<%
								if(dto.getBas_pay().equals("N")){
								%>
								<td scope="col" class="text-center"><input class="btn btn-secondary btn-sm text-center" type="button" id="pay" onclick="location.href='Basketcontroller.do?command=pay&mb_no=<%=LDto.getMb_no() %>&bas_no=<%=dto.getBas_no() %>'" value="결제하기"></td>
								<td scope="col"></td>
								<%
								}else{
								%>
								<td scope="col" class="text-center"><input class="btn btn-secondary btn-sm text-center" type="button" value="결제완료"></td>
								<td scope="col" class="text-center"><input class="btn btn-secondary btn-sm text-center" type="button" value="배송조회" onclick="location.href='trace.jsp'"></td>
								<%
								}
								%>
							</tr>
							<%
								}
							}
							%>
						</tbody>
						<tfoot>
							<tr>
								<td scope="col" colspan="7" align="right">
									<input class="btn btn-secondary btn-sm" type="submit" value="삭제하기"></td>
							</tr>
						</tfoot>
					</table>
				</form>

			</div>
	    
	
   </section>
   
   
  <!-- side bar -->
	<div id="side">
		<div class="sidebar" id="topbutton">
			<br /> <span class="t">Top</span>
		</div>
	</div>
	
	<!-- footer -->
	<footer class="footer">
       <div class="footer_info">
           <p>
               <br><a style='color:white;' href='https://github.com/mingyeungAA'>배민경 : https://github.com/mingyeungAA</a>
               <br><a style='color:white;' href='https://github.com/rjs2013'>박건후 : https://github.com/rjs2013</a>
               <br><a style='color:white;' href='https://github.com/yoonyongmin'>윤용민 : https://github.com/yoonyongmin</a>
               <br><a style='color:white;' href='https://github.com/jys1997'>정윤식 : https://github.com/jys1997</a>
               <br><a style='color:white;' href='https://github.com/duswn158'>유연주 : https://github.com/duswn158</a>
               <br><a style='color:white;' href='https://github.com/seungmin-coder'>오승민 : https://github.com/seungmin-coder</a>
           </p>
           
       </div>
   </footer>
    
</body>
</html>