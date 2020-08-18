<%@page import="com.atg.Register.dto.RegisterDto"%>
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

<link rel="stylesheet" href="resources/css/navbar.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 두개는 순서 그대로!! 변경ㄴㄴ -->
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>

<!-- program 관련 -->
<link rel="stylesheet" href="resources/css/program.css">
<script type="text/javascript" src="resources/js/program.js"></script>    
    
<script type="text/javascript">
	function showPopup() {
		window.open("upperbody.jsp", "PopupWin", "width=1000, height=1200");
	}
	function showPopup1() {
		window.open("lowerbody.jsp", "PopupWin1", "width=1000, height=1200");
	}
</script>    
</head>
<body>
<%
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
						<a class="dropdown-item" href="ReviewController.do?command=review_list">리뷰</a> <a class="dropdown-item"
							href="chat.jsp">실시간 채팅</a>
					</div></li>
				<li class="nav-item dropdown "><a class="nav-link text-white" id="navbarDropdown" href="">고객지원</a>
					<div class="dropdown-menu mt-2" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="NoticeController.do?command=notice_list">공지사항</a> 
						<a class="dropdown-item" href="qna_user.jsp">QnA</a>
					</div></li>
			</ul>
		</nav>
	</div>


   
   <!-- 내용 -->
   <section class="secssion">
   	<div id="window1" class="wheelView" style="background-image: url('resources/img/back1.jpg')">
   		<div class="wheelBox">
  	 		<div class="movie_box">
  	 			<video width="600px" height="400" poster="" controls>
					<source src="resources/video/upperbody.mp4" type="video/mp4">
				</video>
  	 		</div>
  	 		<div class="movie_box"><%
		if(LDto != null){
		%>
		<a class="pointer" onclick="showPopup()"><div class="text_box">#1 Start</div></a>	
		<%
		}else{
		%>
		<a class="pointer" onclick="location.href='login.jsp'"><div class="text_box">#1 Start</div></a>	
		<%
		}
		%>
 		  	
 		  	<p class="workout_text">자꾸 민소매만 입고싶어지는 운동!</p>
 		  	<p class="workout_text">섹시하고 탄탄한 가슴,어깨,팔만들기! [덤벨 6분]</p>
 		  	</div>
 		</div>
   	</div>
   	
   	<div id="window2" class="wheelView" style="background-image: url('resources/img/back2.jpg')">
   		<div class="wheelBox">
   			<div class="movie_box">
  	 			<video width="600px" height="400" poster="" controls>
					<source src="resources/video/lowerbody.mp4" type="video/mp4">
				</video>
  	 		</div>
 	  		<div class="movie_box">
 	  	<%
 	  	if(LDto != null){
		%>
			<a class="pointer" onclick="showPopup1()"><div class="text_box">#2 Start</div></a>			
		<%
		}else{
		%>
			<a class="pointer" onclick="location.href='login.jsp'"><div class="text_box">#2 Start</div></a>			
		<%
		}
		%>
 		  		
 		  	<p class="workout_text">하루10분 투자로 하체와 힙업을 한번에 </p>
 		  	<p class="workout_text">(칼로리소모 끝판왕) 하체운동루틴 [오늘의루틴]</p>
 		  	</div>
 	  	</div>
   	</div>
   	<!-- 
   	<div id="window3" class="wheelView" style="background-image: url('resources/img/back3.jpg')">
   		<div class="wheelBox">
   			<div class="movie_box">
  	 			<iframe class="movie_style" src="https://www.youtube.com/embed/rRzxEiBLQCA"></iframe>
  	 		</div>
 	  		<div class="text_box">#3</div>
 	  	</div>
   	</div>
   	
   	<div id="window4" class="wheelView" style="background-image: url('resources/img/back4.jpg')">
   		<div class="wheelBox">
   			<div class="movie_box">
  	 			<iframe class="movie_style" src="https://www.youtube.com/embed/rRzxEiBLQCA"></iframe>
  	 		</div>
 	  		<div class="text_box">#4</div>
 	  	</div>
   	</div>
	 -->
   </section>
   
   <div id="side">
   	<div class="sidebar"><span class="t">1:1</span></div>
   	<div class="sidebar" id="topbutton"><span class="t">Top</span></div>
   </div>
   
   <footer class="footer">
       <div class="footer_info">
           <p>
               <span>사업자번호</span> : 0000-0000-0000
           </p>
           <p>
               <span>위치</span> : 서울시 강남구 테헤란로 14번길 남도빌딩
           </p>
           <p>
               <span>연락처</span> : 000-0000-0000
           </p>
       </div>
   </footer>   
    
</body>
</html>