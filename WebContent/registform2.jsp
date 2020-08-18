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
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/navbar.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- 두개는 순서 그대로!! 변경ㄴㄴ -->
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>
	
<!-- registform2 관련 -->
<script type="text/javascript" src="resources/js/registform.js"></script>
<link rel="stylesheet" href="resources/css/registform.css">
<link rel="stylesheet" href="resources/css/Template.css">
    
</head>
<body>
 <%
	 RegisterDto LDto = (RegisterDto)session.getAttribute("LDto");
	 
	 //네이버 관련
	 String id = (String)request.getAttribute("id");
	 String email = (String)request.getAttribute("email");
	 String name = (String)request.getAttribute("name");
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
   	
	<h3>회원가입 form</h3>
	
	<form action="Registercontroller.do" method="post">
		<input type="hidden" name="command" value="insert"/>
		<table class="table table-sm" >
		<col width="100">
		<col width="500">
			<tr>
				<th class="text-center">이름</th>
				<td scope="col">
					<input type="text" required="required" autofocus="autofocus" width="500px" name="name" value="<%=(String)request.getAttribute("name")%>">
				</td>
			</tr>
			<tr>
				<th class="text-center">성별</th>
           		 <td>
          		 		<input type="radio" name="gender" value="M" required="required"/> 남 
            			<input class="ml-4" type="radio" name="gender" value="F" required="required"/> 여 
        	    </td>
			</tr>
			<tr>
				<th class="text-center">아이디</th>
				<td>
					<input type="text" required="required" name="id"  maxlength="20" value="<%=(String)request.getAttribute("naverCode")%>">
					<input class="btn btn-secondary btn-sm" type="button" value="아이디 중복 확인"  onclick="idCheck();">
				</td>
			</tr>
			<tr>
				<th class="text-center">비밀번호</th>
				<td>
					<input type="password" id="password1" required="required" min="4" maxlength="12" name="pw">
				</td>
			</tr>
			<tr>
				<th class="text-center">비밀번호 확인</th>
				<td><input type="password" id="password2" placeholder="비밀번호확인" required="required" min="4" maxlength="12"></td>
			</tr>
			<tr>
				<th class="text-center">이메일</th>
				<td>
					<input type="email"  id="email"    maxlength="50" autocomplete="off" name="email" class="" placeholder="이메일을 입력해주세요" required="required"> 
					<button class="btn btn-secondary btn-sm" id="echeck" onclick="emailCheck();">이메일중복</button>
				</td>
			</tr>
			<tr >
				<th class="text-center">주소</th>
				<td>
					<input type="text" id="sample6_postcode" class="addr1" name="addr1" placeholder="우편번호" readonly="readonly">
					<input class="btn btn-secondary btn-sm" type="button" onclick="sample6_execDaumPostcode()"    value="우편번호 찾기" ><br>
					<input type="text" id="sample6_address"  class="addr1" name="addr2" placeholder="주소" readonly="readonly"><br>
					<input type="text" id="sample6_detailAddress"  class="addr1" name="addr3" placeholder="상세주소" required="required">
				</td>
			</tr>
		<tr>
			<td colspan="2" align="right">
				<input class="btn btn-secondary btn-sm" type="submit" id="btnSend"  value="회원가입하기" />
				<input class="btn btn-secondary btn-sm" type="button" value="취소" onclick="location.href='login.jsp'"/>
			</td>
		</tr>
		</table>
	</form>

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