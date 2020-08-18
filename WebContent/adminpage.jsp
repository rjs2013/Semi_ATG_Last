<%@page import="com.atg.paging.dto.PagingDto"%>
<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@page import="com.atg.Member.dto.MemberDto"%>
<%@page import="com.atg.Member.biz.MemberBizImpl"%>
<%@page import="com.atg.Member.biz.MemberBiz"%>
<%@page import="com.atg.Notice.biz.NoticeBizImpl"%>
<%@page import="com.atg.Notice.biz.NoticeBiz"%>
<%@page import="com.atg.Notice.dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="com.atg.Notice.dao.NoticeDaoImpl"%>
<%@page import="com.atg.Notice.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>

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

<!-- adminpage 관련 -->
	<link rel="stylesheet" href="resources/css/Template.css">
    <link rel="stylesheet" href="resources/css/adminpage.css">
	
    <script type="text/javascript" src="resources/js/adminpage.js"></script>
    <script type="text/javascript" src="resources/js/Template.js"></script>
  
    
</head>
<body>
<%
	RegisterDto LDto = (RegisterDto)session.getAttribute("LDto");
	
	List<NoticeDto> notice_list = (List<NoticeDto>)request.getAttribute("notice_list");
	PagingDto noticeDto = (PagingDto)request.getAttribute("notice_paging");
	int notice_no = (Integer)request.getAttribute("notice_no");
	
	List<MemberDto> member_list = (List<MemberDto>)request.getAttribute("member_list");
	PagingDto memberDto = (PagingDto)request.getAttribute("member_paging");
	int member_no = (Integer)request.getAttribute("member_no");
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
		<li class="nav-item"><a class="mr-3" href="AdminController.do?command=admin_list&notice_no=1&member_no=1">관리자페이지</a></li>
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
							href="">실시간 채팅</a>
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
   	
   	<aside>
   	
   		 <ul class="admin">
             <li class="li_tab" id="tab1">회원조회</li>
             <li class="li_tab" id="tab2">공지사항 관리</li>
         </ul>
	   	
   	</aside>
   	
   	<div class="box">
   		<form id="user_admin" action="MemberController.do" method="post" >
   			<input type="hidden" name="command" value="member_search" />
   			<table class="table table-hover" id="box_tb" border="1" style="width : 100%;">
   				<tr>
   					<th scope="col" class="text-center">회원 번호</th>
   					<th scope="col" class="text-center">이       름</th>
   					<th scope="col" class="text-center">아  이  디</th>
   					<th scope="col" class="text-center">이  메  일</th>
   					<th scope="col" class="text-center">주       소</th>
   					<th scope="col" class="text-center">회원 등급</th>
   				</tr>
   				<tr>
   				<%
   					if(member_list.size() == 0) {
   				%>
   				<tr>
   					<td colspan="6">-----회원이 한 명도 없다.....-----</td>
   				</tr>
   				<%
   					} else {
   						for(MemberDto dto : member_list) {
   				%>
   				<tr>
   					<td class="text-center"><a style="color:blue;" href="MemberController.do?command=member_detail&mb_no=<%=dto.getMb_no() %>"><%=dto.getMb_no() %></a></td>
   					<td class="text-center"><%=dto.getMb_name() %></td>
   					<td class="text-center"><%=dto.getMb_id() %></td>
   					<td class="text-center"><%=dto.getMb_email() %></td>
   					<td class="text-center" style="max-width: 200px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><%=dto.getMb_addr() %></td>
   					<td class="text-center"><%=dto.getMb_grade() %></td>
   				</tr>
   				<%
   						}
   					}
   				%>
   				<tr>
   					<td colspan="6" align="center">
   						<select name="search_op">
   							<option value="mb_name" selected>이름으로 검색  </option>
   							<option value="mb_id">아이디로 검색</option>
   						</select>
   						<input type="search" name="search" placeholder="검색어를 입력하세요." />
   						<button class="search_bt" type="submit"><img class="search_img" width="15" hright="15" src="resources/img/glass1.jpg" alt="검색" /></button>
   					</td>
   				</tr>
   				<tr>
			<td id="qna_insert_button" colspan="3" align="center">
<%
			if(member_no == 1 ) {
%>			
				<span>&lt;&lt;&nbsp;</span>
				<span>&lt;&nbsp;</span>
<%
			} else {
%>
					<a href="AdminController.do?command=admin_list&member_no=<%=memberDto.getStartPage()%>&notice_no=<%=notice_no%>">&lt;&lt;&nbsp;</a>
					<a href="AdminController.do?command=admin_list&member_no=<%=member_no-1%>">&lt;&nbsp;</a>
					
<%
			}
%>					
<%
			for(int i=1; i<=memberDto.getCountList()/10+1; i++) {
				
					if(member_no == i){
%>
					<span id="num_color"><%=i %></span>
<%						
						
					} else {
%>
					<a href="AdminController.do?command=admin_list&member_no=<%=i%>&notice_no=<%=notice_no%>"><%=i %></a>
					
<%
					}
%>					
<%
			}
%>

<%
			if(member_no == memberDto.getCountList()/10+1) {
%>			
				<span>&nbsp;></span>
				<span>&nbsp;>></span>
<%
			} else {
%>
					<a href="AdminController.do?command=admin_list&member_no=<%=member_no+1%>&notice_no=<%=notice_no%>">&nbsp;></a>
					<a href="AdminController.do?command=admin_list&member_no=<%=memberDto.getLastPage()%>&notice_no=<%=notice_no%>">&nbsp;>></a>
					
<%
			}
%>					
				</td>

			</tr>   	
   			</table>
   		</form>
   		<form id="notice" action="NoticeController.do" method="post" >
   			<input type="hidden" name="command" value="notice_search" />
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
   					<td class="text-center"><a style="color:blue;" href="NoticeController.do?command=notice_detail&nt_no=<%=dto.getNt_no() %>"><%=dto.getNt_title() %></a></td>
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
   				<tr>
   					<td colspan="3" align="right">
   						<input class="btn btn-secondary btn-sm" type="button" value="글 작성" onclick="location.href='notice_write.jsp'" />
   					</td>
   				</tr>
   				
   				<tr>
			<td id="qna_insert_button" colspan="3" align="center">
<%
			if(notice_no == 1 ) {
%>			
				<span>&lt;&lt;&nbsp;</span>
				<span>&lt;&nbsp;</span>
<%
			} else {
%>
					<a class="tab4" href="AdminController.do?command=admin_list&notice_no=<%=noticeDto.getStartPage()%>&member_no=<%=member_no%>">&lt;&lt;&nbsp;</a>
					<a class="tab4" href="AdminController.do?command=admin_list&notice_no=<%=notice_no-1%>&member_no=<%=member_no%>">&lt;&nbsp;</a>
					
<%
			}
%>					
<%
			for(int i=1; i<=noticeDto.getCountList()/10+1; i++) {
				
					if(notice_no == i){
%>
					<span id="num_color"><%=i %></span>
<%						
						
					} else {
%>
					<a class="tab4" href="AdminController.do?command=admin_list&notice_no=<%=i%>&member_no=<%=member_no%>"><%=i %></a>
					
<%
					}
%>					
<%
			}
%>

<%
			if(notice_no == noticeDto.getCountList()/10+1) {
%>			
				<span>&nbsp;></span>
				<span>&nbsp;>></span>
<%
			} else {
%>
					<a class="tab4" href="AdminController.do?command=admin_list&notice_no=<%=notice_no+1%>&member_no=<%=member_no%>">&nbsp;></a>
					<a class="tab4" href="AdminController.do?command=admin_list&notice_no=<%=noticeDto.getLastPage()%>&member_no=<%=member_no%>">&nbsp;>></a>
					
<%
			}
%>					
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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>