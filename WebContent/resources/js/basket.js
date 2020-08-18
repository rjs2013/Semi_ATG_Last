///멀티딜리트(민경)
		function allChk(check){
			var chk = document.getElementsByName("chk");
			for(var i=0 ; i<chk.length; i++){	
				chk[i].checked=check;
			}
		}
		
		$(function(){
			$("input[name=chk]").click(function(){
				if($("input[name=chk]").length == 0){
					alert("하나 이상 체크해주세요!");
				}else{ //이 아래부분 수정하는중! 수정해야됨!
					var total = 0;
					
					$("input[name=chk]:checked").each(function(i){
						var chk = $(this);
						var price = ch
					});
				}
				if($("input[name=chk]").length == $("input[name=chk]:checked").length){
					$("input[name=all]").prop("checked",true);
				}else{
					$("input[name=all]").prop("checked",false);
				}
			});
		});
		
	
