	function isTwo(n) {
		return (n.length<2)? "0"+n : n;
	}

	$(function() {
		$(".countView").hover(
			function() {
				var aCountView = $(this);
				var year = $(".y").text().trim();
				var month = $(".m").text().trim();
				var cDate = aCountView.text().trim();
				var mb_id = $("#id").text().trim();
				var yyyyMMdd = year + isTwo(month) + isTwo(cDate);
				$.ajax({
					type : "post",
					url : "countajax.do",
					data : "mb_id="+mb_id+"&yyyyMMdd="+yyyyMMdd,
					dataType : "json",
					success : function(msg) {
						var count = msg.calcount;				// msg는 json이기 때문에 가능?
						aCountView.after("<div class='cpreview'>"+count+"</div>");		
					},
					error : function() {
						alert("서버 통신 실패");
					}
				});
			},
			function() {
				$(".cpreview").remove();
			}
		);
	});

	$(function() {
		function calList(){
			
		}
	});






