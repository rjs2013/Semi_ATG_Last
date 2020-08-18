


$(function(){
	  $("#UpdateBoxopen").click(function(){
		  $(".RR_box_content").removeAttr("readonly");
		  
		/*  
		  $(".RR_box_content").focus();
		  $(".RR_box_update").show();*/
	  });
	})
/*
function answer(index){
		console.log(index);
	$("#RR_Low"+index).after(
			
	'<tr><td><form action="ReviewReplyController.do" method="post"><input type="hidden" name="command" value="RR_Answer"/><input type="hidden"/><input type="hidden"/><input type="hidden"/><input type="submit"><textarea rows="1.5" cols="40" style="resize: none;" class="RR_box_content"name="AnswerContent">RE:</textarea></form></td></tr>');
	

$(function(){
	$('')
})*/

function answerReplybutton(index){
	console.log(index);
	$('.RRRboxbox'+index).toggle();
	
	
	/*console.log($('.replybutton').val());*/

}	
/*$(function(){
	  $("#UpdateBoxopen").click(function(){
		  $('.RR_box_update').toggle()
		  $(".RR_box_content").attr("readonly",false);

		*/
			
function updateReplybutton(index){
	console.log(index);
	  $('#RR_box_button'+index).toggle()
	  $("#RR_box_content"+index).attr("readonly",false);

}	

function updatefinish(index){
	console.log(index);
	$("#RR_box_content"+index).attr("readonly",true);
}






























/*


$(function(){
	  $("#UpdateBoxopen").click(function(){
		  $(".RR_box_content").removeAttr("readonly");
		  
		  
		  $(".RR_box_content").focus();
		  $(".RR_box_update").show();
	  });
	})

  수정창 
$(function(){
	  $("#UpdateBoxopen").click(function(){
		  $(".RR_box_content").removeAttr("readonly");
		  $(".RR_box_content").focus();
		  $(".RR_box_update").show();
	  });
	})





function answer(index){
		console.log(index);
	$("#RR_Low"+index).after(
			
	'<tr><td><form action="ReviewReplyController.do" method="post"><input type="hidden" name="command" value="RR_Answer"/><input type="hidden"/><input type="hidden"/><input type="hidden"/><input type="submit"><textarea rows="1.5" cols="40" style="resize: none;" class="RR_box_content"name="AnswerContent">RE:</textarea></form></td></tr>');


function answerReplybutton(index){
	console.log(index);
	$('.RRRboxbox'+index).toggle();
	
	
	console.log($('.replybutton').val());

}	

}
		


function answerRepluyupdate(index){
	 $('.RR_box_update'+index).toggle();
	  $(".RR_box_content"+index).attr("readonly",false);
}



$(function(){
	  $("#UpdateBoxopen").click(function(){
		  $('.RR_box_update').toggle()
		  $(".RR_box_content").attr("readonly",false);
		  
		  $(".RR_box_content").focus();
		  $(".RR_box_update").show();
	  });
	})






*/


		
			
	