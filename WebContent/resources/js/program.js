$(document).on('mouseover', '.top_menu span', function () {
	    $('.bottom_menu').slideDown(200);
	});
	$(document).on('mouseover', 'section', function () {
	    $('.bottom_menu').slideUp(200);
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
	
	// Top버튼
	$(function () {
		$("#topbutton").click(function () {
			$("html, body").animate({scrollTop : 0}, 400);
		});
	});
	
	$("")
	
	
	window.onload = function () {
            var elm = ".secssion div";
            $(elm).each(function (index) {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                   
                	// 이벤트전파 막기(마우스 휠시 하나의 영역만 이동할수 있도록 함)
                	e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } 
                    else if (event.detail)
                        delta = -event.detail / 3;
                    var moveTop = $(window).scrollTop();
                    var elmSelecter = $(elm).eq(index);
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(elmSelecter).next() != undefined) {
                            try{
                                moveTop = $(elmSelecter).next().offset().top;
                            }catch(e){}
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(elmSelecter).prev() != undefined) {
                            try{
                                moveTop = $(elmSelecter).prev().offset().top;
                            }catch(e){}
                        }
                    }
                     
                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 600, complete: function () {
                        }
                    });
                });
            });
        }