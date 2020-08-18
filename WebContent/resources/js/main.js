
	// 메인 슬라이드배너
	$(function () {
		var container = $('#banner_box'),
			slideGroup = container.find('ul'),
			slides = slideGroup.find('li'),
			nav = container.find('.banner_nav'),
			indicator = container.find('.indicator'),
			// 슬라이드되는 박스의 총 갯수
			slideCount = slides.length,
			// 슬라이드 박스의 갯수에 따라 태그가 늘어나야 하므로 빈값으로 지정해놓는다
			indicatorHtml = '',
			// 열자마자 나오는 첫화면
			currentIndex = 0,
			// 슬라이드 박스가 다음으로 넘어가는 시간 0.5초
			duration = 500,
			// 슬라이드 박스가 다음으로 넘어가기전 시간 3.5초
			interval = 3500,
			// 마우스오버시 슬라이드를 멈출 변수명
			timer;
		
		// 슬라이드를 가로로 배열
		// slides마다 할 일, left : 0% 100% 200% ...
		console.log(slides);
		
		//  slides(i) 각각에 함수실행 0번지부터 마지막번지까지
		slides.each(function (i) {
			var newLeft = i*100+'%';
			$(this).css({left: newLeft});
			
			// <a href="">1</a>
			indicatorHtml += '<a href="">'+(i+1)+'</a>';
			console.log(indicatorHtml);
			
		});
		
		//A.text(B);	a요소의 b의 내용을 글씨 형태로 추가
		//A.html(B);	a요소의 b의 내용을 html 형태로 추가
		indicator.html(indicatorHtml);
		
		// 슬라이드 이동 함수
		function goToSlide(index) {
			slideGroup.animate({left: -100*index+'%'}, duration);
			// 현재 보고있는 화면의 index
			currentIndex = index;
			console.log(currentIndex);
			
			// 처음인지 마지막인지 검사, active
			// goToSlide 함수가 실행되지않으면 처음화면에 적용되지 않으므로
			// 함수 바깥에도 적어서 화면이 나오자마자 적용되도록 한다
			updateNav(); 
			
		}
		
		function updateNav() {
			var navPrev = nav.find('.prev');
			var navNext = nav.find('.next');
			// 처음 currentIndex=0, 이전버튼이 안보이도록
			// 마지막 currentIndex=3, 다음버튼이 안보이도록
			if(currentIndex == 0) {
				navPrev.addClass('disabled');
			} else {
				navPrev.removeClass('disabled');
			}
			
			if(currentIndex == slideCount-1) {
				navNext.addClass('disabled');
			} else {
				navNext.removeClass('disabled');
			}
			
			// 선택된 인디케이터에만 클래스 추가하기
			// 첫 번째 방법
			// 모든요소에서 active 클래스를 빼고, 원하는 요소에만 active 클래스 추가
			// indicator.find('a').removeClass('active');
			// .eq(숫자)
			// indicator.find('a').eq(currentIndex).addClass('active');
			
			// 두 번째 방법
			// 원하는 요소에만 active 클래스를 추가하고 나머지들에서 active 클래스를 빼기
			// 형제 자매는 영어로? siblings
			indicator.find('a').eq(currentIndex).addClass('active').
			siblings().removeClass('active');
		
		}
	
		// 인디케이터로 이동하기
		indicator.find('a').click(function (e) {
			// 고유의 기능을 막는다 즉, a태그를 눌렀을 때 발생하는 고유의 이벤트를 막고
			// 클릭시 이벤트를 발생시키는 새로운 함수를 적용하게 된다
			e.preventDefault();
			var idx = $(this).index();
			// console.log(idx);
			goToSlide(idx);
		});
		
		// 좌우버튼 이동하기
		// 다음버튼 클릭 currentIndex+1->gotoslide(?);
		// 이전버튼 클릭 currentIndex-1->gotoslide(?);
		
		/*
		nav.find('.prev').click(function (e) {
			e.preventDefault();
			// var i = currentIndex-1;
			goToSlide(currentIndex-1);
		});
		
		nav.find('.next').click(function (e) {
			e.preventDefault();
			// var i = currentIndex+1;
			goToSlide(currentIndex+1);
		});
		*/
		
		nav.find('img').click(function (e) {
			if($(this).hasClass('prev')){
				goToSlide(currentIndex-1);
			} else {
				goToSlide(currentIndex+1);
			}
		});
		
		// 화면이 시작하자마자 updateNav함수 실행
		updateNav();
		
		// 자동 슬라이드 함수
		// 시작
		function startTimer() {
			// 일정시간 마다 할일
			// setInterval(할일, 시간), clearInteval(이름)
			// 할일(함수) function () {실제로 할일}
			
			timer = setInterval(function () {
				// nextindex c0 n1, c1 n2, ... c3 n0
				// (0+1)%4 = 1, ... (3+1)%4 = 0
				var nextIndex = (currentIndex+1)%slideCount;
				goToSlide(nextIndex);
			}, interval)
		}
		startTimer();
		
		// 멈춤
		function stopTimer() {
			clearInterval(timer);
		}
		
		container.mouseenter(function () {
			stopTimer();
		});
		container.mouseleave(function () {
			startTimer();
		});
		
	});
	
	// 랭킹박스 슬라이드배너
	$(document).ready(function() {
		var $banner = $(".ranking_content").find("ul");
	
		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;
	
		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 4000);//다음 이미지로 롤링 애니메이션 할 시간차
	
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length);
			$banner.css("height", $bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 2000, function() { //숫자는 롤링 진행되는 시간이다.
				
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번째 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	});
	
	
	$(document).on("mouseenter", ".prev", function () {
	    $(this).css("opacity", "0.8");
	});
	$(document).on("mouseleave", ".prev", function () {
	    $(this).css("opacity", "0.5");
	});
	
	$(document).on("mouseenter", ".next", function () {
	    $(this).css('opacity', '0.8');
	});
	$(document).on("mouseleave", ".next", function () {
	    $(this).css("opacity", "0.5");
	});
	
	
	$(document).on("mouseenter", ".top_menu span", function () {
	    $(".bottom_menu").slideDown(200);
	});
	$(document).on("mouseenter", "section", function () {
	    $(".bottom_menu").slideUp(200);
	});
	
	$(document).on("mouseenter", ".middle", function () {
		$(this).find('.arrow_box').css('opacity', '1');
	});
	$(document).on("mouseleave", ".middle", function () {
		$(this).find(".arrow_box").css('opacity', '0');
	});
		
	
	// Top버튼
	$(function () {
		$("#topbutton").click(function () {
			$("html, body").animate({scrollTop : 0}, 400);
		});
	});
	
	// Sidebar 특정 px로 이동 시 나타내기
	$(window).scroll(function(){  
		//스크롤의 위치가 상단에서 500보다 크면  
		if($(window).scrollTop() > 500){  
			/* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */  
			$("#side").addClass("sidefix");  
		//위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
		}else{  
			$("#side").removeClass("sidefix");  
			//위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
		}  
	});
	
	// 리뷰박스 아래에서 윗쪽으로 페이드인
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('.review_list').each( function(i){
	            
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1','margin-bottom':'0px'},1500);
	            }
	        }); 
	    });
	});
	
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('.notice_box').each( function(i){
	            
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1'},1500);
	            }
	        }); 
	    });
	});
	