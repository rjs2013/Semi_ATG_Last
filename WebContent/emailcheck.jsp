<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/emailcheck.js"/></script>


</head>
<body>
<%
	String emailnotused = (String) request.getParameter("emailnotused");	
%>	



	<table border="1">
			<tr>
				<td>
					<input type="text" id="" name="email" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td>
				<%=!emailnotused.equals("1")?" 사용가능합니다. ":"중복된 이메일입니다" %>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="확인" onclick="confirmemail('<%=emailnotused %>>')">				
				</td>
			</tr>
		</table>
			


</body>
</html>