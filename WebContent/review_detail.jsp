<%@page import="com.atg.reviewReply.dto.ReviewReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@ page import="com.atg.review.dto.ReviewDto" %>
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


<!-- review_detail 관련 -->	
<link rel="stylesheet" href="resources/css/Template.css">
<link rel="stylesheet" href="resources/css/review_detail.css">
<script type="text/javascript" src="resources/css/Template.js"></script>
<script type="text/javascript" src="resources/js/review_reply_detail.js"></script>


<script type="text/javascript">

	$(function () {
		var rv_id = $('#rv_id').text();
		var lg_id = $('#lg_id').val();
		
		console.log(rv_id);
		console.log(lg_id);
		
		if (rv_id != lg_id) {
			$('.rv_btn').hide();
		} else {
			$('.rv_btn').show();
		}
		
	})
	
	/* // 댓글 수정창
	$(function(){
			var RRv_id = $('#RRRR_id').text();
			var lg_id = $('#lg_id').val();
			console.log(RRv_id);
			console.log(lg_id);
			if (RRv_id != lg_id) {
				$('.Updatefirst').hide();
				$('.deleteReply').hide();
			} else {
				$('.Updatefirst').show();
				$('.deleteReply').show();
			}
	}) */
	
	
	$(function () {
		$(".starList").each(function(){
			$(this).parent().children($('.starR1')).slice(0, $(this).val()).addClass('on');
			$(this).parent().children($('.starR2')).slice(0, $(this).val()).addClass('on');
		})
	});

	
	//수정 창 상단에 추가 0809
	$(function(){
		  $("#UpdateBoxopen").click(function(){
			  $('.RR_box_update').toggle()
			  $(".RR_box_content").attr("readonly",false);
			/*  
			  $(".RR_box_content").focus();
			  $(".RR_box_update").show();*/
		  });
		})
	
</script>

</head>
<body>

<%
	ReviewDto dto = (ReviewDto) request.getAttribute("dto");
	int rv_no = Integer.parseInt(request.getParameter("rv_no"));
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


	<br/><br/>

<!-- 내용 -->
	<section class="secssion">      
	  <div id="reviewbox">
		<table id="review_table" border="1">
		<col width="7%">
		<col width="83%">
			<tr>
				<th>글 번호</th>
				<td><%=dto.getRv_no() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getRv_title() %></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td id="rv_id"><%=dto.getMb_id() %></td>
				<%
				if(LDto != null) {
				%>
				<input type="hidden" id="lg_id" value="<%=LDto.getMb_id() %>">
				<%
				}
				%>
			</tr>
			<tr>
				<th>날짜</th>
				<td><%=dto.getRv_date() %></td>
			</tr>
			<tr>
				<th>별점</th>
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
			</tr>
			<tr>
				<th>내용</th>
				<td readonly="readonly" name="rv_content" style="resize:none; height:280px;">
					<%=dto.getRv_content() %>
				</td>
			</tr>

			<tr>
				<td colspan="6" align="right">
					<input class="btn btn-secondary mt-1 mb-1" type="button" value="목록" onclick="location.href='ReviewController.do?command=review_list&nt_no=1'" />
					<%
					if(LDto != null) {
					%>
					<input  class="btn btn-secondary rv_btn" type="button" value="수정" onclick="location.href='ReviewController.do?command=update&rv_no=<%=dto.getRv_no() %>'" />
					<input  class="btn btn-secondary mr-1 rv_btn" type="button" value="삭제" onclick="location.href='ReviewController.do?command=delete&rv_no=<%=dto.getRv_no() %>&mb_id=<%=LDto.getMb_id() %>'" />
					<%
					}
					%>
				</td>
			</tr>
		</table>
	</div>
		<!--000000000000000000000000000000000000000000000000000000000000000000000000  -->
			
			<!--                             리뷰댓글부분                                              -->
			
			<!--000000000000000000000000000000000000000000000000000000000000000000000000  -->
		
		
		
		
		<%
			List<ReviewReplyDto> Rlist  = (List<ReviewReplyDto>)request.getAttribute("Rlist");
			/* RegisterDto LDto = (RegisterDto) session.getAttribute("LDto");/ //아이디 값 
			int rv_no = Integer.parseInt(request.getParameter("rv_no")); */// 리뷰글 번호 
			
		%>
		
		
	<div id="Replybox">
		<table class="qnalist_table" >
							<col width="10%">
							<col width="50%">
							<col width="10%">
							<col width="10%">
							<tr>
								<td>
								<table>
								<tr>
									<td>
									<!--0809 if LDto 글작성 위로 위치변화  
										textarea 크기 조정
									-->
												<%
													if(LDto != null){
													%>	
										<button class="writebutton" onclick="$('.css_test').toggle()">댓글작성</button>
										
										<span>
										<form action="ReviewReplyController.do" method="post" class="css_test">
												<input type="hidden"  name="command" value="ReviewReplyinsert">
												<input type="hidden" name="Rv_no" value="<%=dto.getRv_no()%>">
										</span>
													<span>
													<input type="hidden" readonly="readonly" name="id" value="<%=LDto.getMb_id()%>"></span>
													<span>
													<textarea rows="1.5" cols="50" name="content"></textarea></span>
													<input type="submit" value="작성">
													<%-- <%
													}else{
													%>	
													</span>
													<span>
													 0809 주석처리 필요 없는 부분
													<textarea rows="2" cols="40" name="content"></textarea></span>
													<input type="submit" value="작성"> --%>
													<%	
													}
													%>
										</form>
									</td>
								</tr>
								</table>
								</td>
							</tr>
							
							
	<%					
	
				if(Rlist.size() == 0){
					
	%>
			
							<tr>
								<td colspan="5">-------작성된 댓글이 없습니다.-------</td>
							</tr>
							
	<%
	}else{
		int i = 0;
		for(ReviewReplyDto Rdto: Rlist){
	%><tr class="RR_box" id=RR_Low<%=i%>>
								<td id="RRRR_id"><%=Rdto.getMb_Id()%></td>
								<td>
								
									<!-------------------------------- 수정 창 ------------------------------  -->
									<!-------------------------------- 수정 창 ------------------------------  -->
									<!-------------------------------- 수정 창 ------------------------------  -->
									<div class="updatebox" id="UUUbox">
									<form action="ReviewReplyController.do" method="post" class="">
										<input type="hidden" name="command" value="RRupdate">
										<input type="hidden" name="Rv_no" value="<%=Rdto.getRv_no()%>">
										<input type="hidden" name="rr_no" value="<%=Rdto.getRr_no()%>">
										<input type="hidden" name="mb_id" value="<%=Rdto.getMb_Id()%>">
										<%
											if(LDto != null){
										%>
										 <input type="hidden" name="id" value="<%=LDto.getMb_id()%>">
										<%
											}
										
										%>
									
										
										
					
										<textarea  style="border:none;" id="RR_box_content<%=i%>" rows="1.5" cols="50" style="resize: none;" class="RR_box_content" name="rr_content" readonly="readonly"><%=Rdto.getRr_content() %></textarea>
										<%
										if(LDto != null){
										%>
										<input type="submit" id="RR_box_button<%=i%>" class="RR_box_update" value="작성완료" onclick="updatefinish()">
									</form>
									</div>
								</td>
								<td><%=Rdto.getRr_date() %></td>
								<td>
							
								
								
								
								<!-- -------------------------답변부분----------------------------------- -->
								<!-- -------------------------답변부분----------------------------------- -->
								<!-- -------------------------답변부분----------------------------------- -->
								 <%-- <button class="replybutton" name="answer_Reply" onclick="$('.RRRboxbox').toggle('<%=i%>')">답변</button>  --%>
								
								<input type="button" class="replybutton" onclick="answerReplybutton('<%=i%>');" value="답변<%=i%>">
								<input type="button" class="updatebutton" onclick="updateReplybutton('<%=i%>');" value="수정<%=i%>">
								<!-- <button class="Updatefirst" id="UpdateBoxopen">수정</button> -->
								
								
								
								
								
								
								<!------------------삭제버튼 부분 ----------  --><!------------------삭제버튼 부분 ----------  -->
								<!------------------삭제버튼 부분 ----------  --><!------------------삭제버튼 부분 ----------  -->
									<form action="ReviewReplyController.do" method="post">
										<input type="hidden" name="command" value="ReviewReplydelete">
										<input type="hidden" name="id" value="<%=LDto.getMb_id()%>">
										<input type="hidden" name="Rv_no" value="<%=Rdto.getRv_no()%>">
										<input type="hidden" name="rr_no" value="<%=Rdto.getRr_no() %>">
										<input type="submit" class="deleteReply" id="deleteReply" value="삭제">
									</form>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
								<div class="RRRboxbox<%=i%>" id="RRRreplybox" style="display: none;">
								<form action="ReviewReplyController.do" method="post">
								<input type="hidden" name="command" value="RR_Answer">
								<input type="hidden" name="Rv_no" value="<%=Rdto.getRv_no()%>">
								<input type="hidden" name="parentRr_no" value="<%=Rdto.getRr_no()%>">
								<input type="hidden" name="mb_id" value="<%=LDto.getMb_id()%>">
						
								<textarea id="RErere" rows="1.5" cols="50" style="resize: none;" class="" name="AnswerContent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ</textarea>
								<input type="submit" id="" name="" value="답글완료">
				
							
								</form>
								</div>
								</td>
								<td></td>
								<%			
								}
							
								%>
							<tr>	
	<%
		i++;
				}
	
	}
	%>
						</table>
					</div>




<!-- <form action="" class="RR_deletebox">
									<input type="hidden" name="command" value="ReviewReplydelete">
									<input type="hidden" name="deleteRv_no" value="">
									<input type="submit" value="삭제">
								</form> -->
					



	<%-- 
	
					<!--  -->
						<div class="">
							<form action="ReviewReplyController.do?command=">
								<input type="hidden" value="">
								 
								<input type="submit">
							</form>
						</div>

							 --%>
		
	
	
			<!--밑에글 삭제 부분   -->
		
				<!-- 			<div id="RR_deletebox">
								<form action="ReviewReplyController.do" method="post">
									<input type="hidden" name="command" value="ReviewReplydelete">
									<input type="hidden" name="deleteRv_no" value="">
									<input type="submit">
								</form>
							</div> 
							 -->
	
	
	
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















