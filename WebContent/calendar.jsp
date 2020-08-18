<%@page import="com.atg.Cal.dto.CalDto"%>
<%@page import="com.atg.Register.dto.RegisterDto"%>
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
	
<!-- calendar 관련 -->    
<script type="text/javascript" src="resources/js/Template.js"></script>
<script type="text/javascript" src="resources/js/calendar.js"></script>
<link rel="stylesheet" href="resources/css/Template.css">
<link rel="stylesheet" href="resources/css/calendar.css">
    
</head>
<body>

<%

	List<CalDto> list = (List<CalDto>) request.getAttribute("list");
	RegisterDto LDto = (RegisterDto) session.getAttribute("LDto");
	
	Calendar cal = Calendar.getInstance();

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	if(paramYear != null) {
		year = Integer.parseInt(paramYear);
	} 
	
	if(paramMonth != null) {
		month = Integer.parseInt(paramMonth);
	}
	
	if(month > 12) {
		year++;
		month = 1;
	}
	
	if(month < 1) {
		year--;
		month = 12;
	}
	
	// 현재년도, 현재월, 1일 셋팅
	cal.set(year, month - 1, 1);
	
	// 1일의 요일
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	// 마지막 일
	int lastDay = cal.getActualMaximum(cal.DAY_OF_MONTH);
	
	CalBiz biz = new CalBizImpl();
	String mb_id = LDto.getMb_id();
	String yyyyMM = year + Utils.isTwo(month+"");
	List<CalDto> clist = biz.getViewList(mb_id, yyyyMM);
	List<CalDto> calist = biz.getView(mb_id);

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
   		<table id="calendar">
		<caption>
			<a href="mypage.jsp?year=<%=year-1%>&month=<%=month%>">◀◀</a>
			<a href="mypage.jsp?year=<%=year%>&month=<%=month-1%>">◁</a>
			
			<span class="y"><%=year %></span>년
			<span class="m"><%=month %></span>월
			
			<a href="mypage.jsp?year=<%=year%>&month=<%=month+1%>">▷</a>
			<a href="mypage.jsp?year=<%=year+1%>&month=<%=month%>">▶▶</a>
		</caption>
		<tr>
			<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
		</tr>
		<tr>
		<%
		// 공백
			for(int i = 0; i < dayOfWeek-1; i++) {
				out.println("<td>&nbsp</td>");
			}

			for(int i = 1; i <= lastDay; i++) {
		%>
		<td>
			<a class="countView" href="CalController.do?command=calListView&year=<%=year%>&month=<%=month%>&date=<%=i%>&mb_id=<%=LDto.getMb_id() %>" style="color:<%=Utils.fontColor(i, dayOfWeek) %>"><%=i %></a>
				
			<a href="cal_insert.jsp?year=<%=year%>&month=<%=month%>&date=<%=i%>&lastday=<%=lastDay%>">
					<img alt="일정 추가" src="resources/img/pen.png" width="10" height="10" />
			</a>
				
			<div class="clist">
				<%=Utils.getViewTitle(i, clist) %>
			</div>
		</td>
		<%
			if((dayOfWeek-1 + i) % 7 == 0) {
				out.println("<tr></tr>");
				}
			}
	
			// 뒤 쪽 공백
			for(int i = 0; i < (7-(dayOfWeek-1 + lastDay)%7)%7; i++) {
				out.println("<td>&nbsp</td>");
			}
		%>
		</tr>
		<tr>
			<td colspan="7" align="left">
				<div>
				<span id="id"><%=LDto.getMb_id() %></span>
				<table style="width:100%;">
				<caption>오늘, 내일 일정</caption>
					<tr>
						<th>일정</th>
						<th>시간</th>
					<tr>
					</tr>
					<%
						if(calist.size() == 0) {
					%>
					<tr>
						<td colspan="2">----- 일정이 없습니다. -----</td>
					</tr>
					<%
						} else {
							for(CalDto dto : calist) {
					%>
						<td><a style="color:blue;" href="CalController.do?command=cal_detail&ca_no=<%=dto.getCa_no() %>"><%=dto.getCa_title() %></a></td>
						<td><%=dto.getCa_mdate() %></td>
					</tr>
					<%
							}
						}
					%>
				</table>
				</div>
			</td>
		</tr>
		</table>
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