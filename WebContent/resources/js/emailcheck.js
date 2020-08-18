	
	onload = function(){
		var email = opener.document.getElementsByName("email")[0].value;
		document.getElementsByName("email")[0].value = email;
	}
	
	
	/* function sendcheck( random ){
		var email = opener.document.getElementsByName("email")[0].value;
		console.log( random);
		 alert(email+"입력하신 메일로 인증번호를 보냈습니다.")
		 $.ajax({
			url: "Registercontroller.do",	//web.xml
			type: "post", // post방식
			datatype : "json",				
			data: {"command": "sendEmail","random": random, "receiver": email },
			//성공했을시
			success(data){
				alert("인증번호를 확인하세요");
				console.log(data+"success:data값");
			},
			error(msg){
				console.log("통신실패");
			}
		}); 
	} */
	
	function confirmemail(bool){
		if(bool=="true"){
			opener.document.getElementsByName("email")[0].title='y';
			opener.document.getElementsByName("addr1")[0].focus();  
		}else{
			opener.document.getElementsByName("email")[0].focus();
		}
		self.close();
	}
	