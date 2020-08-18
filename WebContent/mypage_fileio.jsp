<%@page import="com.atg.Register.dto.RegisterDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script type="text/javascript" src="resources/js/mypage_fileio.js"></script>

<style type="text/css">
	.show_img{
		width: 100%;
	}
	#sample_img{
		width:100%;
	}
</style>

</head>
<body>

<%
	RegisterDto LDto = (RegisterDto) session.getAttribute("LDto");
%>

	<!-- 파일 전송 -->
	<h3>프로필 사진 변경</h3>
	<p>최대 파일 사이즈 : 1024*1024*50</p>
	<p>최대용량 : 50 MB</p>
	<div class="show_img">
		<img src="" id="sample_img" >
	</div>
	
	<form action="PhotoController" method="post" enctype="multipart/form-data">
   		<input type="hidden" value="<%=LDto.getMb_id()%>" name="mb_id">
   		<input type="hidden" value="<%=LDto.getMb_name()%>" name="mb_name">
   		<input type="hidden" value="<%=LDto.getMb_no()%>" name="mb_no">
   		<!-- <input type="hidden" value="205" name="mb_no">
   		<input type="hidden" value="duswn" name="mb_id">
   		<input type="hidden" value="유떙떙" name="mb_name"> -->
   			
		<p><input type="file" name="fileName" onchange="setThumbnail(event);"/></p>		
		<p><input type="submit" value="변경" /></p>
	</form>
</body>
</html>