<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myinsert.jsp</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script type="text/javascript" src="resources/js/test_insert.js"></script>

</head>
<body>
	<h1>글 추가 쓰기</h1>
	
	<form action="myinsertres.jsp" method="post">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="myname"></td>
				<!-- form태그에서는 name값이 넘어가니, 꼭 써주자! -->
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="mytitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea id="summernote" name="editordata"></textarea>
		
				</td>
			</tr>
			<tr >
				<td colspan="2" align="right">
					<input type="button" value="취소" onclick="location.href='mylist.jsp'">
					<input type="submit" value="입력">  
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>