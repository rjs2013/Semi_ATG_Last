	$(document).ready(function() {
		// 회원 목록만 표시
		$('.box > form').hide();
		$('#user_admin').show();
		
		// 클릭한 게시판 표시
		$('#tab1').click(function() {
			$('#user_admin').show();
			$('#notice').hide();
			$('#QnA').hide();
		});
		
		$('#tab2').click(function() {
			$('#user_admin').hide();
			$('#notice').show();
			$('#QnA').hide();
		});
		
		$('#tab3').click(function() {
			$('#user_admin').hide();
			$('#notice').hide();
			$('#QnA').show();
		});
	});

	






