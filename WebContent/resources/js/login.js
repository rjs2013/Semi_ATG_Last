
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
	
	