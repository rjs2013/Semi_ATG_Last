<%@ page import="com.atg.review.dto.ReviewDto" %>
<%@ page import="com.atg.review.biz.ReviewBizImpl" %>
<%@ page import="com.atg.review.biz.ReviewBiz" %>
<%@ page import="com.atg.Register.dto.RegisterDto"%>
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

<!-- summernote -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<script src="resources/summernote/js/summernote-lite.js"></script>
<script src="resources/summernote/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="resources/summernote/css/summernote-lite.css">
<script type="text/javascript" src="resources/js/test_insert.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	
	
<!-- revie_insert 관련 -->
<script type="text/javascript" src="resources/js/review.js"></script> 
<link rel="stylesheet" href="resources/css/Template.css"> 
<link rel="stylesheet" href="resources/css/review_detail.css">


<script type="text/javascript">

$(function () {
	
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  var star = $(this).children().val();
		  $("#starVal").prop("value",star);
		  
		  console.log($("#starVal").val());
		  
		});
	
	$('.starRev span').click(function () {
	})
	
})

</script>

</head>
<body>
<%
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
						<a class="dropdown-item" href="qna_user.jsp">QnA</a>
					</div></li>
			</ul>
		</nav>
	</div>


	
	<!-- 내용 -->
	<section class="secssion">
	<h1>리뷰 작성하기</h1>
	<form action="ReviewController.do" method="post">
	<input type="hidden" name="command" value="insert"/>
		<table id="review_table" border="1">
		<col width="7%">
		<col width="83%">
			<tr>
				<th>제목</th>
				<td><input type="text" name="rv_title"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="mb_id" value="<%=LDto.getMb_id() %>" readonly="readonly"></td>
			</tr>

			<tr>
				<th>별점</th>
				<td>
					<div class="starRev">
					  <span class="starR1"><input type="hidden" value="1"/></span>
					  <span class="starR2"><input type="hidden" value="2"/></span>
					  <span class="starR1"><input type="hidden" value="3"/></span>
					  <span class="starR2"><input type="hidden" value="4"/></span>
					  <span class="starR1"><input type="hidden" value="5"/></span>
					  <span class="starR2"><input type="hidden" value="6"/></span>
					  <span class="starR1"><input type="hidden" value="7"/></span>
					  <span class="starR2"><input type="hidden" value="8"/></span>
					  <span class="starR1"><input type="hidden" value="9"/></span>
					  <span class="starR2"><input type="hidden" value="10"/></span>
					</div>
					<input type="hidden" id="starVal" name="rv_rate" value="0"/>
				</td>
				
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea id="summernote" cols="100" rows="20" name="rv_content" style="resize:none;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input class="btn btn-secondary mt-1 mb-1" type="button" value="취소" onclick="location.href='ReviewController.do?command=review_list&nt_no=1'">
					<input class="btn btn-secondary mt-1 mb-1 mr-1" type="submit" value="입력">
				</td>
			</tr>
		</table>
	</form>
	</section>
	

</body>
</html>