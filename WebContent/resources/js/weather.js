$(function() {
	$("#weaView").click(											
			function() {
				var url = "weatherOpen";							// url = weatherOpen
				var search = $("#address").val();					
				$.ajax({
					type : "GET",									// get 방식으로 보낸다
					url : url + "?search=" + search,				
					dataType : "text",								// text 타입으로 받는다
					success : function(data) {						// 성공 시 실행 (weatherInfo.jsp 값을 가지고)
						 
						var temp = $.trim(data);					// data의 양쪽 공백을 제거한 후 temp에 넣어줌
						var obj = JSON.parse(temp);					// 전달받은 제이슨 형태의 문자열을 제이슨 형태의 자바스크립트 객체로 변환(temp(양쪽 공백을 제거한 data 값)를 변환 후 obj에 넣어줌)??
						// JSON.stringify();						// 제이슨 형태의 자바스크립트 객체를 제이슨 형태의 문자열로 바꿔줌
						
						$("#pubDate").val(obj.pubDate);				// 기준 시간 / (jason.key를 하면 해당 키 값을 불러움)
						$("#temp").val(obj.temp);					// 기온
						$("#pop").val(obj.pop);						// 강수확률
						$("#wfKor").val(obj.wfKor);					// 날씨
						
						// 날씨 값에 따라 id가 weather_img인 img태그의 속성을 변경
						var weather_condition = obj.wfKor;
						if (weather_condition == "맑음"){
							$("#weather_img").attr("src","resources/img/sun.png");
						}else if (weather_condition == "비"){
							$("#weather_img").attr("src","resources/img/rain.png");
						}else if (weather_condition == "눈"){
							$("#weather_img").attr("src","resources/img/snow.png");
						}else if (weather_condition == "흐림"){
							$("#weather_img").attr("src","resources/img/cloud.png");
						}else if (weather_condition == "구름 조금"){
							$("#weather_img").attr("src","resources/img/cloud_sun.png");
						}else{
							$("#weather_img").attr("src","resources/img/etc.png");
						}
					},
					error : function() {							// 실패 시
						alert("정보를 불러오는데 실패하였습니다.");
					}
				});
			});
});
