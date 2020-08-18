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