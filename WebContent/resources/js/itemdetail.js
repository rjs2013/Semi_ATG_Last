		// Top버튼
	$(function () {
		$("#topbutton").click(function () {
			$("html, body").animate({scrollTop : 0}, 400);
		});
	});
	
	$(window).scroll(  
		    function(){  
		        //스크롤의 위치가 상단에서 700보다 크면  
		        if($(window).scrollTop() > 1000){  
		        /* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */  
		            $('.pay_sum2').addClass("itemfix");  
		            //위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
		        }else{  
		            $('.pay_sum2').removeClass("itemfix");  
		            //위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
		        }  
		    }  
		);
	
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
        $('.banner_list').on({
            "click" : function(){
                var imgSrc = $(this).attr('src');
                
                $('.list_view img').attr('src', imgSrc);
            }
        });          
	});
	
	/*
	$(function(){ 
		var price = parseInt($('.price').val());
		  $('.plus').click(function(){
			var cnt = $('.count').val();  
			var n = $('.plus').index(this);
		    var num = $(".count:eq("+n+")").val();
		    
		    num = $(".count:eq("+n+")").val(num*1+1);

		    $('.price').val(cnt*price+30000);
		    
		  });
		  
		  $('.minus').click(function(){ 
			var cnt = $('.count').val();
		    var n = $('.minus').index(this);
		    var num = $(".count:eq("+n+")").val();
		    
		    num = $(".count:eq("+n+")").val(num*1-1); 
		    
		    $('.price').val(cnt*price-30000);
		    
		    if ($('.count').val()==0) {
		    	alert('최소 수량입니다');
		    	$('.count').val(cnt);
		    	$('.price').val(30000);
		    }
		});
	})*/
	

	
	
	   $(function() {
		      var pri = $('.price').val();
		      var price = 0;
		      
		      $('#countA').click(function() {
		         var cnt = $(this).val();
		         
		         price = pri * cnt;
		         
		         $('.price').val(price);
		         console.log(cnt);
		         console.log(price);
		      })
		   })
	
	
	
	
	
	
	
	
	
	
	
	