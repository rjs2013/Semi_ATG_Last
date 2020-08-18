<%@page import="com.atg.Item.biz.ItemBizImpl"%>
<%@page import="com.atg.Item.biz.ItemBiz"%>
<%@page import="com.atg.Item.dto.ItemDto"%>
<%@page import="com.atg.paging.dto.PagingDto"%>
<%@page import="com.atg.review.biz.ReviewBizImpl"%>
<%@page import="com.atg.review.biz.ReviewBiz"%>
<%@page import="com.atg.review.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="com.atg.Notice.biz.NoticeBizImpl"%>
<%@page import="com.atg.Notice.biz.NoticeBiz"%>
<%@page import="com.atg.Notice.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.atg.Register.dto.RegisterDto"%>

<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
<!-- 두개는 메뉴바 css -->
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/navbar.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>

<!-- 두개는 순서 그대로!! 변경ㄴㄴ -->
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="resources/bootstrap/js/bootstrap.min.js"></script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	RegisterDto LDto = (RegisterDto)session.getAttribute("LDto");
	
	//PagingDto pagingDto = new PagingDto();
	//List<NoticeDto> notice_list = notice_biz.selectList(PagingDto pagingDto);
	int count = 0;
	
	ReviewBiz review_biz = new ReviewBizImpl();
	List<ReviewDto> review_list = review_biz.selectlist();
	
	NoticeBiz notice_biz = new NoticeBizImpl();
	List<NoticeDto> notice_list = notice_biz.selectlist();
	
	ItemBiz item_biz = new ItemBizImpl();
	List<ItemDto> item_list = item_biz.selectList();	
	
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
	<span class="target"></span>

   <section class="secssion">
   	<div id="blank">
   	</div>
   	<div id="banner_box">
		<ul>
			<li><img src="resources/img/banner18.jpg" onclick="location.href=''"/></li>
			<li><img src="resources/img/banner16.jpg" onclick="location.href=''"/></li>
			<li><img src="resources/img/banner15.jpg" onclick="location.href=''"/></li>
			<li><img src="resources/img/banner19.png" onclick="location.href=''"/></li>
			<li><img style="width: 50%;" src="resources/img/banner21.jpg" onclick="location.href=''"/></li>
		</ul>
		
		<div class="banner_nav">
	  		<img src="resources/img/prev.png" class="prev"/>
	  		<img src="resources/img/next.png" class="next"/>
  		</div>
		
		<div class="indicator">
  		</div>
	</div>
	
	<!-- 
	<div id="r_box">
	</div> -->

   	<div id="ranking_box">
   		<div id="ranking_a">
   			<div class="ranking_content">
   				<ul>
					<li onclick="location.href='https://atg-lunge.netlify.app/'"><div class="divbox">Best ProG</div><br/><img src="resources/img/런지_썸네일.jpg"/></li>
					<li onclick="location.href='atg-sidelaterallaise.netlify.app/'"><div class="divbox">Best ProG</div><br/><img src="resources/img/사레레_썸네일.jpg"/></li>
					<li onclick="location.href='atg-shoulderpress.netlify.app/'"><div class="divbox">Best ProG</div><br/><img src="resources/img/숄더프레스_썸네일.jpg"/></li>
				</ul>
			</div>
   		</div>
   	
   		
   		<div id="ranking_b">
   			<div class="ranking_content">
	   			<ul>
						<%
	   			for(ItemDto idto : item_list) {
	   				if(idto.getItem_no() == 5) {
	   			%>
					<li onclick="location.href='Itemcontroller.do?command=itemdetail&item_no=<%=idto.getItem_no()%>'"><div class="divbox">Best Item</div><br/><img src="<%=idto.getItem_url() %>"/></li>
				<%
	   				} else if(idto.getItem_no() == 1) {
				%>
					<li onclick="location.href='Itemcontroller.do?command=itemdetail&item_no=<%=idto.getItem_no()%>'"><div class="divbox">Best Item</div><br/><img src="<%=idto.getItem_url() %>"/></li>
				<%
	   				} else if(idto.getItem_no() == 8) {
				%>
					<li onclick="location.href='Itemcontroller.do?command=itemdetail&item_no=<%=idto.getItem_no()%>'"><div class="divbox">Best Item</div><br/><img src="<%=idto.getItem_url() %>"/></li>
				<%
	   				}
	   			}
				%>
				</ul>
			</div>
   		</div>
   		<div id="ranking_c">
            <div class="ranking_content">
               <ul>
               <li onclick="location.href=''"><div class="divbox">Best MemB 1</div><br/><img src="resources/img/totoro2.gif"/></li>
               <li onclick="location.href=''"><div class="divbox">Best MemB 2</div><br/><img src="resources/img/totoro.gif"/></li>
               <li onclick="location.href=''"><div class="divbox">Best MemB 3</div><br/><img src="resources/img/totoro3.gif"/></li>
            </ul>
         </div>
         </div>
   	</div>
   		
	<div id="middle_box">
   		<div class="middle" onclick="location.href='NoticeController.do?command=notice_list'"><p class="arrow_box">공지사항</p><img src="resources/img/what.jpeg"></div>
   		<div class="middle" onclick="location.href='Itemcontroller.do?command=itemlist'"><p class="arrow_box">기타상품</p><img src="resources/img/h2.jpg"></div>
   		<div class="middle" onclick="location.href='Itemcontroller.do?command=itemlist'"><p class="arrow_box">전체상품</p><br/><span style="font-size: 50pt;">ATG</span><br/><span>ITEM</span></div>
   		<div class="middle" onclick="location.href='Itemcontroller.do?command=itemlist'"><p class="arrow_box">운동기구</p><img src="resources/img/h3.jpg"></div>
   		<div class="middle" onclick="location.href='itemsearch.jsp'"><p class="arrow_box">기구찾기</p><img src="resources/img/search1.jpg"></div>
   	</div>
   	<%
   	for(ReviewDto rdto : review_list) {
   	%>
	<div id="review_box">
	<%
	if(rdto.getRv_no() == 5) {
	%>
		<div id="review_content1" class="review_list">
			<img src="resources/img/rvimg3.jpg" data-lightbox="resources/img/rvimg3.jpg" class="re1">
			<div class="divbox">Review Best</div>
			<div class="rv_text" cols="105" rows="6" name="rv_content" resize="none" readonly><%=rdto.getRv_content() %></div>
		</div>
	<%
	} else if(rdto.getRv_no() == 3) {
	%>
		<div id="review_content2" class="review_list">
			<img src="resources/img/rvimg4.jpg" data-lightbox="resources/img/rvimg4.jpg" id="re2">
			<div class="divbox">Review Best</div>
			<div class="rv_text" cols="105" rows="6" name="rv_content" resize="none" readonly"><%=rdto.getRv_content() %></div>
		</div>
	<%
	}else if(rdto.getRv_no() == 2) {
	%>
		<div id="review_content3" class="review_list">
			<img src="resources/img/rvimg2.jfif" data-lightbox="resources/img/rvimg2.jfif" class="re1">
			<div class="divbox">Review Best</div>
			<div class="rv_text" cols="105" rows="6" name="rv_content" resize="none" readonly="readonly"><%=rdto.getRv_content() %></div>
		</div>
	<%
	}
	%>
	</div>
	<%
   	}
	%>
	
	<div id="notice">
		<div class="notice_box">
			<span>공지사항</span>
			<%
   					if(notice_list.size() == 0) {
   				%>
   				<ul>
   					<li>-----공지사항 없음-----</li>
   				</ul>
   				<%
   					} else {
   						for(NoticeDto ndto : notice_list) {
   							count++;
   							if(count < 4) {
   				%>
   				<li class="notice_list"><%=ndto.getNt_title() %></li>
   				<%
   							}
   						}
   					}
   				%>
		</div>
		
		<div class="notice_box">
			<span>Q & A</span>
			<ul>
				<li class="notice_list">Q & A입니다</li>
				<li class="notice_list">자주 찾는 질문</li>
				<li class="notice_list">안녕하세요</li>
			</ul>
		</div>
	</div>

   </section>
   
	<div id="lightbox-overlay">
		<img src=""	alt="Lightbox image" title="Click anywhere to close" id="lightbox-image"/>
	</div>


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
   
<script type="text/javascript">

var img = document.querySelectorAll('#review_box img'),
	lightbox = document.querySelector('#lightbox-overlay'),
	lightboxImg = lightbox.querySelector('img');
	
	console.log(img);
	
for(var i=0 ; i<img.length ; i++) {	
	img[i].addEventListener('click', function () {
		var imgNewSrc = this.getAttribute('data-lightbox');
		console.log(imgNewSrc);
		
		// lightboxImg의 src의 값을 큰이미지의 경로로 지정
		lightboxImg.setAttribute('src', imgNewSrc);
		// lightbox보이도록
		lightbox.classList.add('visible');
	});
}

// lightbox를 클릭하면 다시 사라지도록
lightbox.addEventListener('click', function () {
	this.classList.remove('visible');
});

</script>

</body>
</html>