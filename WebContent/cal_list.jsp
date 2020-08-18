<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/Template.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<meta charset="UTF-8">
<title>Template</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/Template.js"></script>
    
</head>
<body>
<%
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
   <br/><br/><br/><br/><br/><br/><br/>
   <div id="box">
		<jsp:useBean id="utils" class="com.atg.util.Utils" />
		
		<table class="table table-border" id="box_tb">
			<col width="50px" />
			<col width="250px" />
			<col width="200px" />
			<col width="200px" />
			<tr>
				<th class="text-center">번   호</th>
				<th class="text-center">제   목</th>
				<th class="text-center">일   정</th>
				<th class="text-center">작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td class="text-center" colspan="4">-----일정이 없습니다.-----</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td class="text-center">${dto.ca_no}</td>
							<td class="text-center"><a style="color:blue;" href="CalController.do?command=cal_detail&ca_no=${dto.ca_no }">${dto.ca_title }</a></td>
							<td class="text-center">
								<!-- setter, getter메서드와 같은 의미, property에는 필드명을, name에는 빈 이름을, value에는 값을 -->
								<!-- set : useBean 액션태그로 생성한 자바빈 객체에 대해서 프로퍼티에 값을 설정 -->
								<!-- get : 자바빈 파일의 getter 메서드에서 저장된 값을 읽어온다 -->
								<jsp:setProperty property="toDates" name="utils" value="${dto.ca_mdate }" />
								<jsp:getProperty property="toDates" name="utils" />
							</td>
							<td class="text-center">
								<!-- value값을 pattern 형식으로 바꿔서 출력해준다. -->
								<!-- value속성에 date를 넣어서 처리하기 위해서는 java.util.Date 클래스로 객체를 생성해야한다. -->
								<fmt:formatDate value="${dto.ca_regdate }" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="4" align="right">
					<input class="btn btn-secondary mb-3" type="button" value="달력 보기" onclick="location.href='calendar.jsp'" />
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



