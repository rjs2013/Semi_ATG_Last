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


<!-- cal_insert 관련 -->
<script type="text/javascript" src="resources/js/Template.js"></script>
<script type="text/javascript" src="resources/js/calendar.js"></script>
<link rel="stylesheet" href="resources/css/Template.css">
    
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
	
	RegisterDto LDto = (RegisterDto) session.getAttribute("LDto");
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
						<a class="dropdown-item" href="qua_user.jsp">QnA</a>
					</div></li>
			</ul>
		</nav>
	</div>

		
	
   <!-- 내용 -->
   <section class="secssion">
   <br/><br/><br/><br/><br/><br/><br/>
   	<div id="box">
   		<form action="CalController.do" method="post">
		<input type="hidden" name="command" value="cal_insert" />
		
		<table class="table" id="box_tb">
			<tr>
				<th>ID</th>
				<td><input class="form-control mt-4 mb-2" type="text" name="mb_id" value="<%=LDto.getMb_id() %>" readonly="readonly" /></td>
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
				<td><input class="form-control mt-4 mb-2" type="text" name="ca_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="form-group"><textarea class="form-control" style="height:300px; resize:none;" name="ca_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input class="btn btn-secondary mb-3" type="submit" value="일정작성" />
					<input class="btn btn-secondary mb-3" type="button" value="돌아가기" onclick="" />
				</td>
			</tr>
		</table>
	</form>
   	</div>
   </section>
   
   <div id="side">
   	<div class="sidebar"><span class="t">1:1</span></div>
   	<div class="sidebar"><span class="t" id="topbutton">Top</span></div>
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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>     
</body>
</html>