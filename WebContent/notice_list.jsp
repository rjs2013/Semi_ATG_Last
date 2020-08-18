
<%@page import="com.atg.paging.dto.PagingDto"%>
<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Notice.dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="com.atg.Notice.biz.NoticeBizImpl"%>
<%@page import="com.atg.Notice.biz.NoticeBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<!-- notice_list 관련 -->
<link rel="stylesheet" href="resources/css/qna.css">
<link rel="stylesheet" href="resources/css/Template.css">
<script type="text/javascript" src="resources/css/Template.js"></script>


</head>
<body>
<%
	List<NoticeDto> notice_list = (List<NoticeDto>)request.getAttribute("list");
	RegisterDto LDto = (RegisterDto)session.getAttribute("LDto");
	PagingDto pagingDto = (PagingDto)request.getAttribute("paging");
	int nt_no = (Integer)request.getAttribute("nt_no");
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
		<h1 id="qnalist_title">공지사항</h1>
	
	<form id="notice" action="NoticeController.do" method="post" >
   			<input type="hidden" name="command" value="notice_user_search" />
   			<table class="table table-striped" style="text-align : center;">
   				<col width="100" />
   				<col width="300" />
   				<col width="300" />
   				<tr>
   					<th scope="col" class="text-center">번      호</th>
   					<th scope="col" class="text-center">제      목</th>
   					<th scope="col" class="text-center">작성시간</th>
   				</tr>
   				<% 
   					if(notice_list.size() == 0) { 
   				%>
   				<tr>
   					<td colspan="3">-----글이 존재하지 않습니다.-----</td>
   				</tr>
   				<%
   					} else {
   						for(NoticeDto dto : notice_list) {
   				%>
   				<tr>
   					<td class="text-center"><%=dto.getNt_no() %></td>
   					<td class="text-center"><a style="color:blue;" href="NoticeController.do?command=notice_user_detail&nt_no=<%=dto.getNt_no() %>"><%=dto.getNt_title() %></a></td>
   					<td class="text-center"><%=dto.getNt_date() %></td>
   				</tr>
   				<%
   						}
   					}
   				%>
   				<tr>
   					<td colspan="3" align="center">
   						<select name="search_op">
   							<option value="nt_title" selected>제목으로 검색  </option>
   							<option value="nt_content">내용으로 검색</option>
   						</select>
   						<input type="search" name="search" placeholder="검색어를 입력하세요." />
   						<button class="search_bt" type="submit"><img class="search_img" width="15" height="15" src="resources/img/glass1.jpg" alt="검색" /></button>
   					</td>
   				</tr>
   				<td id="qna_insert_button" colspan="3" align="center">
<%
			if(nt_no == 1 ) {
%>			
				<span>&lt;&lt;&nbsp;</span>
				<span>&lt;&nbsp;</span>
<%
			} else {
%>
					<a href="NoticeController.do?command=notice_list&nt_no=<%=pagingDto.getStartPage()%>">&lt;&lt;&nbsp;</a>
					<a href="NoticeController.do?command=notice_list&nt_no=<%=nt_no-1%>">&lt;&nbsp;</a>
					
<%
			}
%>					
<%
			for(int i=1; i<=pagingDto.getCountList()/10+1; i++) {
				
					if(nt_no == i){
%>
					<span id="num_color"><%=i %></span>
<%						
						
					} else {
%>
					<a href="NoticeController.do?command=notice_list&nt_no=<%=i%>"><%=i %></a>
					
<%
					}
%>					
<%
			}
%>

<%
			if(nt_no == pagingDto.getCountList()/10+1) {
%>			
				<span>&nbsp;></span>
				<span>&nbsp;>></span>
<%
			} else {
%>
					<a href="NoticeController.do?command=notice_list&nt_no=<%=nt_no+1%>">&nbsp;></a>
					<a href="NoticeController.do?command=notice_list&nt_no=<%=pagingDto.getLastPage()%>">&nbsp;>></a>
					
<%
			}
%>					
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