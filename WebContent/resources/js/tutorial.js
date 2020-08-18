$(document).ready(function() {
		var $banner = $("#banner_box").find("ul");
	
		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;
	
		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 4000);//다음 이미지로 롤링 애니메이션 할 시간차
	
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 2000, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	});
	
	// Top버튼
	$(function () {
		$("#topbutton").click(function () {
			$("html, body").animate({scrollTop : 0}, 400);
		});
	});

	$(window).scroll(  
		    function(){  
		        //스크롤의 위치가 상단에서 500보다 크면  
		        if($(window).scrollTop() > 500){  
		        /* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */  
		            $('#side').addClass("sidefix");  
		            //위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
		        }else{  
		            $('#side').removeClass("sidefix");  
		            //위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
		        }  
		    }  
		);
	
	$(function(){
		$(".item_list").slice(0, 4).show(); // 최초 4개 선택
		$("#plus_list").click(function(e){ // Load More를 위한 클릭 이벤트e
			e.preventDefault();
		$(".item_list:hidden").slice(0, 4).show(); // 숨김 설정된 다음 4개를 선택하여 표시
			if($(".item_list:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
			$("#plus_list").hide(); // 더 이상 로드할 항목이 없는 경우 숨김
			}
		});
	});
	
	$(function(){
		$(".item_list2").slice(0, 4).show(); // 최초 4개 선택
		$("#plus_list2").click(function(e){ // Load More를 위한 클릭 이벤트e
			e.preventDefault();
		$(".item_list2:hidden").slice(0, 4).show(); // 숨김 설정된 다음 4개를 선택하여 표시
			if($(".item_list2:hidden").length == 0){ // 숨겨진 DIV가 있는지 체크
			$("#plus_list2").hide(); // 더 이상 로드할 항목이 없는 경우 숨김
			}
		});
	});
	
	