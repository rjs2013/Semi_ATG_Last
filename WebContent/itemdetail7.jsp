<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Basket.dto.BasketDto"%>
<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Item.dto.ItemDto"%>
<%@page import="com.atg.Item.biz.ItemBizImpl"%>
<%@page import="com.atg.Item.biz.ItemBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!-- itemdetail -->
<link rel="stylesheet" href="resources/css/itemdetail.css">
<script type="text/javascript" src="resources/js/itemdetail.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>


</head>
<body>

<%
	ItemDto dto = (ItemDto)request.getAttribute("dto");
	BasketDto bdto = new BasketDto();
	int item_no = Integer.parseInt(request.getParameter("item_no"));
	RegisterDto LDto = (RegisterDto)session.getAttribute("LDto");
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
 
   	<div id="banner_box">
   		<div class="list_view">
   			<img src="resources/img/dumbel.jpg"/>
   		</div>
   		<div class="list_box">
			<img class="banner_list" src="resources/img/GYMBALL.jpg"/>
			<img class="banner_list" src="resources/img/dumbel2.jpg"/>
			<img class="banner_list" src="resources/img/dumbel3.jpg"/>
		</div>
	</div>

	
	<form action="Basketcontroller.do" method="post">
	<input type="hidden" name="command" value="gobasket">
	<%
		if(LDto == null){ //로그인이 안되어있으면	
	%>
		<input type="hidden" name="mb_no" value="0">
	<%
		}else{  //로그인이 되어있으면,
	%>
		<input type="hidden" name="mb_no" value="<%=LDto.getMb_no()%>">
	<%
		}
			
	%>
	
		<div class="item_pay">
			<input type="hidden" name="item_url" value="<%=dto.getItem_url()%>">
			<input type="hidden" name="item_no" value="<%=dto.getItem_no() %>">
			
	   		<h3><input type="text" style='border:none;text-align:left;' name="item_name" readonly="readonly" value="<%=dto.getItem_name()%>"></h3>
			<h4 style='float:right;'><input type="text" style='border:none;text-align:right;' name="item_price" readonly="readonly" value="<%=dto.getItem_price() %>">원</h4>
			<br><br>	<div class="item_box">
					택배
				</div><br/>
				<div class="pay_sum1">
					<select name="count" id="countA" style='float:left;margin:10px;'>
						<option class="cnt" value="1">1</option>
						<option class="cnt" value="2">2</option>
						<option class="cnt" value="3">3</option>
						<option class="cnt" value="4">4</option>
						<option class="cnt" value="5">5</option>
						<option class="cnt" value="6">6</option>
						<option class="cnt" value="7">7</option>
						<option class="cnt" value="8">8</option>
						<option class="cnt" value="9">9</option>
						<option class="cnt" value="10">10</option>
						
					</select>
					<div class="pay_text">원</div>
					<input type="text" name="price" readonly="readonly" value="<%=dto.getItem_price() %>" class="price"/>
					<div></div>
				</div><br/>
			<div class="pay_box">
				<div><input id="question1" type="submit" value="문의하기"></div>
				<div><input id="add" type="submit" value="장바구니"></div>		
				<div><input id="pay1" type="submit" value="바로구매"></div>
			</div>
		</div>
	</form>
	
	<br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	
	<div class="item_detail">
		<h1>제품 상세설명</h1><br/>
		

		<img src="resources/img/gymball_1.jpg" class=""/>
	
		<img src="resources/img/gymball_4.jpg" class=""/>
		
		
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