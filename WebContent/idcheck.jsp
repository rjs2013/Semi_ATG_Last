<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="resources/js/idcheck.js"/></script>

</head>
<body>
<%
	String idnotused = (String) request.getParameter("idnotused");	
%>
	<table border="1">
			<tr>
				<td>
					<input type="text" name="id"/>
				</td>
			</tr>
			<tr>
				<td><%= !idnotused.equals("1")?"아이디 생성가능":"중복된 아이디 존재" %></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="확인" onclick="confirmId('<%=idnotused %>>')">				
				</td>
			</tr>
			
		
		</table>

</body>
</html>