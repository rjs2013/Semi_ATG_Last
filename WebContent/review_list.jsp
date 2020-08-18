<%@page import="com.atg.paging.dto.PagingDto"%>
<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@ page import="com.atg.review.dto.ReviewDto" %>
<%@ page import="java.util.List" %>
<%@ page import="com.atg.review.biz.ReviewBizImpl" %>
<%@ page import="com.atg.review.biz.ReviewBiz" %>
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

<!-- review_list 관련 -->
<link rel="stylesheet" href="resources/css/review_list.css">
<script type="text/javascript" src="resources/js/Template.js"></script>

<script type="text/javascript">

$(function () {
	$(".starList").each(function(){
		$(this).parent().children($('.starR1')).slice(0, $(this).val()).addClass('on');
		$(this).parent().children($('.starR2')).slice(0, $(this).val()).addClass('on');
	})
});

</script>
   

</head>
<body>
<%
List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("list");
PagingDto pagingDto = (PagingDto)request.getAttribute("paging");
int nt_no = (Integer)request.getAttribute("nt_no");
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
		<h1 id="review_title">리뷰게시판</h1>
		<form action="ReviewController.do" method="post">
		<%
		if(LDto != null) {
		%>
		<input type="hidden" name="command" value="review_insert" />
		<input type="hidden" name="mb_id" value="<%=LDto.getMb_id() %>" />
		<%
		} else {
		%>
		<input type="hidden" name="command" value="go_login" />
		<input type="hidden" name="next" value="ReviewController.do?command=review_list" />
		<%
		}
		%>
		<table id="review_table" class="table">
			<col width="50px">
			<col width="400px">
			<col width="200px">	
			<col width="100px">		
			<col width="100px">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>별점</th>
				<th>작성자</th>			
				<th>날짜</th>
			</tr>
			<%
				if(list.size() == 0) {
			%>
			<tr>
				<td colspan="5">-----작성된 글이 없습니다.-----</td>
			</tr>
			<%
				} else {
					for(ReviewDto dto : list) {
			%>
			<tr class="">
				<td><%=dto.getRv_no() %></td>

				<td><a href="ReviewController.do?command=detail&rv_no=<%=dto.getRv_no()%>"><%=dto.getRv_title() %></a></td>	

				<td>
					<div class="starRev">
					  <span class="starR1" id="s1"><input type="hidden" value="1"/></span>
					  <span class="starR2" id="s2"><input type="hidden" value="2"/></span>
					  <span class="starR1" id="s3"><input type="hidden" value="3"/></span>
					  <span class="starR2" id="s4"><input type="hidden" value="4"/></span>
					  <span class="starR1" id="s5"><input type="hidden" value="5"/></span>
					  <span class="starR2" id="s6"><input type="hidden" value="6"/></span>
					  <span class="starR1" id="s7"><input type="hidden" value="7"/></span>
					  <span class="starR2" id="s8"><input type="hidden" value="8"/></span>
					  <span class="starR1" id="s9"><input type="hidden" value="9"/></span>
					  <span class="starR2" id="s10"><input type="hidden" value="10"/></span>
					  <input type="hidden" class="starList" value="<%=dto.getRv_rate() %>"/>
					</div>
				</td>
				
				<td><%=dto.getMb_id() %></td>
				<td><%=dto.getRv_date() %></td>
			</tr>
			<%
					}
				}
			%>
			<tr>
				<td id="review_insert_button" colspan="5" align="right">
				<%
					if(LDto != null) {
				%>
					<button type="submit" class="btn btn-secondary" onclick="location.href='review_insert.jsp?mb_id=<%=LDto.getMb_id()%>'">글 작성</button>
				<%
					} else {
				%>
					<button type="submit" class="btn btn-secondary" onclick="location.href='login.jsp'">글 작성</button>
				<%
					}
				%>
				</td>
			</tr>
			
				
			<tr>
			<td id="qna_insert_button" colspan="3" align="center">
<%
			if(nt_no == 1 ) {
%>			
				<span>&lt;&lt;&nbsp;</span>
				<span>&lt;&nbsp;</span>
<%
			} else {
%>
					<a href="ReviewController.do?command=review_list&nt_no=<%=pagingDto.getStartPage()%>">&lt;&lt;&nbsp;</a>
					<a href="ReviewController.do?command=review_list&nt_no=<%=nt_no-1%>">&lt;&nbsp;</a>
					
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
					<a href="ReviewController.do?command=review_list&nt_no=<%=i%>"><%=i %></a>
					
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
					<a href="ReviewController.do?command=review_list&nt_no=<%=nt_no+1%>">&nbsp;></a>
					<a href="ReviewController.do?command=review_list&nt_no=<%=pagingDto.getLastPage()%>">&nbsp;>></a>
					
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















