<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Cal.dto.CalDto"%>
<%@page import="java.util.List"%>
<%@page import="com.atg.util.Utils"%>
<%@page import="com.atg.Cal.biz.CalBizImpl"%>
<%@page import="com.atg.Cal.biz.CalBiz"%>
<%@page import="com.atg.Cal.dao.CalDao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

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
    
<!-- calendar_insert 관련 -->
<script type="text/javascript" src="resources/js/Template.js"></script>
<script type="text/javascript" src="resources/js/calendar.js"></script>
<link rel="stylesheet" href="resources/css/Template.css">
<link rel="stylesheet" href="resources/css/calendar_insert.css">
    
</head>
<body>

<%
	CalDto dto = new CalDto();
	
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int date = Integer.parseInt(request.getParameter("date"));
	int lastDay = Integer.parseInt(request.getParameter("lastday"));

	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int min = cal.get(Calendar.MINUTE);
	
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
   	<div id="box">
   		<form action="CalenderController.do" method="post">
		<input type="hidden" name="command" value="cal_insert" />
		
		<table id="box_tb" border="1">
			<tr>
				<th>ID</th>
				<td><input type="text" name="mb_id" value="<%=dto.getMb_id() %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>일정</th>
				<td>
					<select name="year">
<%
					for(int i = year-5; i <= year+5; i++) {
%>						
						<option value="<%=i%>" <%=(year == i)?"selected":"" %>><%=i %></option>
<%
					}
%>
					</select>년
					
					<select name="month">
<%
					for(int i = 1; i < 13; i++) {
%>						
						<option value="<%=i %>" <%=(month == i)?"selected":"" %>><%=i %></option>
<%
					}
%>
					</select>월
					
					<select name="date">
<%
					for(int i = 1; i <= lastDay; i++) {
%>
						<option value="<%=i%>" <%=(date == i)?"selected":"" %>><%=i %></option> 
<%
					}
%>					
					</select>일
					
					<select name="hour">
<%
					for(int i = 0; i < 24; i++) {
%>
						<option value="<%=i%>" <%=(hour == i)?"selected":"" %>><%=i %></option>
<%
					}
%>					
					</select>시
					
					<select name="min">
<%
					for(int i = 0; i < 60; i++) {
%>					
						<option value="<%=i%>" <%=(min == i)?"selected":"" %>><%=i %></option>
<%
					}
%>					
					</select>분
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="70" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="일정작성" />
					<input type="button" value="돌아가기" onclick="location.href='mypage.jsp'" />
				</td>
			</tr>
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