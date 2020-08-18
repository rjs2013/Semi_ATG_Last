/**
 * http://usejsdoc.org/
 */
function setThumbnail(event) {
	
	var reader = new FileReader();
	
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		$("#sample_img").attr("src",event.target.result);
	};
	
	reader.readAsDataURL(event.target.files[0]);
	
}

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