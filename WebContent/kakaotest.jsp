<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


</head>
<body>
	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout">logout</a>

	<script type="text/javascript">
		//사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('7d52e34abe5fdbd54eb68fb7865afd73');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				Kakao.API.request({

					url : '/v2/user/me',

					success : function(res) {  //callback
						
						var newForm = $('<form></form>');
						newForm.attr("method","post");
						newForm.attr("action","RegisterController.do");
						newForm.appendTo('body');
						var page=$("<input type='hidden' name='command' value='kakao'>");
						var email = $("<input type='hidden' name='email' value="+res.kakao_account.email+">");
						
						newForm.append(page);
						newForm.append(email);
						newForm.submit();
					}
				})
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
		
		function kakaoLogout() { //로그아웃
			Kakao.Auth.logout(function(response) {
				alert(response + 'logout');
			}); 
	    }
	</script>

</body>
</html>