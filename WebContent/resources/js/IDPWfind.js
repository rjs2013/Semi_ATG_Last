




//템플릿



$(document).on('mouseover', '.top_menu span', function() {
		$('.bottom_menu').slideDown(200);
	});
	$(document).on('mouseover', 'section', function() {
		$('.bottom_menu').slideUp(200);
	});

	$(window).scroll(function() {
		//스크롤의 위치가 상단에서 500보다 크면  
		if ($(window).scrollTop() > 500) {
			/* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */
			$('#side').addClass("sidefix");
			//위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
		} else {
			$('#side').removeClass("sidefix");
			//위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
		}
	});


	



//아이디 찾기 버튼

function idfind(){
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var emailAdress = document.getElementById("emadress");
	//value 값 저장 
	
	var emailAdressDetail = emailAdress.options[emailAdress.selectedIndex].value; 
	
	
	console.log(emailAdressDetail);
	
	if (name == ""){
		alert("이름을 입력해주세요 ");
		//공백 오류
	}else if (email == "") {
		alert("이메일을 입력해주세요");
		//공백 오류
	}else {
		console.log("둘다 있음 ")
		$.ajax({
			url: "RegisterController.do", //web.xml 사용해서 컨트롤러 이동 
			type: "post",	//post 방식 
			datatype: "json",	//json받는다.
			data: {"command":"IDsearch","name":name,"email":email,"emailAdress":emailAdressDetail}, //data 값을넣는다 json형식으로 
			//성공했을시 데이터 
			success(data){
				//json 파싱 해서 obj에 담는다
				var obj = JSON.parse(data);
				console.log(obj); // 콘솔창 obj 값 확인 
				
				document.getElementById("result").innerHTML=obj.mbName+"님의 아이디는 "+ obj.mbId+"입니다.";
			},
			error(msg) {
				console.log("통신 실패");
			}				
		});
	}
	
}



//비밀번호 찾기 버튼 
function pwfind(){
	//각각의 value 값들 담기 
	var pwid = document.getElementById("PWid").value;
	var pwname = document.getElementById("PWname").value;
	var pwemail = document.getElementById("PWemail").value;
	var pwemailAdress = document.getElementById("PWemadress");
	
	//이메일주소 본인주소와 뒤에 주소합침
	var pwemailAdressDetail = pwemailAdress.options[pwemailAdress.selectedIndex].value; 
	console.log(pwemailAdressDetail);
	
	//이름이나 이메일이 빈값이면 
	if (pwid == ""){
		alert("ID를 입력해주세요 ");
	}else if (pwname == "") {
		alert("이름을 입력해주세요")
	}else if(pwemail==""){
		alert("이메일을 입력해주세요")
	}else {
		console.log("3개 있음 ")
		
		$.ajax({
			url: "RegisterController.do",
			type: "post",
			datatype: "json",
			data: {"command":"PWsearch","PWid":pwid,"PWname":pwname,"PWemail":pwemail,"pwemailAdress":pwemailAdressDetail},
			
			success(data){
				var obj = JSON.parse(data);
				console.log(obj);
				document.getElementById("pwresult").innerHTML=obj.mbname+"님의 비밀번호는 "+ obj.mbpw+"입니다.";
				
			},
			error(msg) {
				console.log("통신 실패");
			}				
		
		});
	}
	
};







//-------------아이디 인증번호 ajax 보내기--------------------------------------------------------------------------




//ajax를 사용하여 한 이유는 한 페이지에서 다끝내기 위해서 사용하였다.
function emailCheck(checkNum) {
	

	
	
//해당하는value 값 특히 이메일은 값이 여러개
//selected 선택 된값 으로 잡아줘여한다.
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var emailAdress = document.getElementById("emadress");
	//value 값 저장 
	console.log(checkNum+"1");
	
	
	
	var emailAdressDetail = emailAdress.options[emailAdress.selectedIndex].value; 
	var emailFullName = email+"@"+emailAdressDetail;
	
	
	
	$.ajax({
		url : "RegisterController.do",  //web.xml
		type : "post",		// post 방식
		datatype: "json",  // json 방식 키 벨류값
		data: {"command":"IDsearch","name":name,"email":email,"emailAdress":emailAdressDetail},
		
		//해당하는 커멘드 에 name , email, emailAdress 값을 차례로 놓고 
		success(data) {		//리턴되는 data 값을 받아 
			var obj = JSON.parse(data); // 파싱해준다 
			if (obj.result == "1") {	// 만약 중복값이 있다면 
				$.ajax({			//한번더 ajax 사용하요 
					url:"RegisterController.do", //컨트롤러 활용하여
					type:"post",			// post방식
					datatype:"json",		//datatype
					data:{"command":"sendEmail","receiver":emailFullName, "random":checkNum},
					success(data) {
						alert("전송성공 \n인증번호를 확인해주세요 ");
					},
					error(err) {
						alert("해당 이메일 전송 실패");
					}
						
				})
			}else {
				alert("해당 이메일이 없습니다.");
			}
		},
		error(err) {
			console.log(err);
		}
	
	});

}



//ajax를 사용하여 한 이유는 한 페이지에서 다끝내기 위해서 사용하였다.
function PWemailCheck(pwcheckNum) {
//해당하는value 값 특히 이메일은 값이 여러개
//selected 선택 된값 으로 잡아줘여한다.
	/*var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식

	
	if(!emailRule.test($("input[id='PWemail']").val())){
		alert("잘못된 이메일 형식입니다.")
		}*/
	
	var id  = document.getElementById("PWid").value;
	var name = document.getElementById("PWname").value;
	var email = document.getElementById("PWemail").value;
	var emailAdress = document.getElementById("PWemadress");
	//value 값 저장 
	console.log(checkNum+"1");
	
	console.log(id+"/"+name+"/"+email+"/"+emailAdress); //콘솔창에 값이 다들어온다
	
	var emailAdressDetail = emailAdress.options[emailAdress.selectedIndex].value; 
	var emailFullName = email+"@"+emailAdressDetail;
	
	console.log(emailFullName+"이메일 풀네임 값 확인")
	console.log(id+"/"+name+"/"+email+"/"+emailFullName);//콘솔창에 값이 다들어온다
	//메일값 들어온다 .
	
	$.ajax({
		url : "RegisterController.do",  //web.xml
		type : "post",		// post 방식
		datatype: "json",  // json 방식 키 벨류값
		data: {"command":"PWsearch","PWid":id,"PWname":name,"PWemail":email,"pwemailAdress":emailAdressDetail},
		//해당하는 커멘드 에 id,  name , email, emailAdress 값을 차례로 놓고 
		
//--------------------------- data 리턴 받는 부분--------------------------------

		success(data) {		//리턴되는 data 값을 받아 
			var obj = JSON.parse(data); // 파싱해준다 
			if (obj.result == "1") {	// 만약 중복값이 있다면 
				$.ajax({			//한번더 ajax 사용하요 
					url:"RegisterController.do", //컨트롤러 활용하여
					type:"post",			// post방식
					datatype:"json",		//datatype
					data:{"command":"sendEmail","receiver":emailFullName, "random":pwcheckNum},
					success(data) {
						alert("전송성공 \n인증번호를 확인해주세요 ");
					},
					error(err) {
						alert("해당 이메일 전송 실패");
					}
						
				})
			}else {
				alert("해당 아이디가 없습니다.");
			}
		},
		error(err) {
			console.log(err);
		}
	
	});

}



//----------------------인증번호 입력란 ----------------------------------------
//아이디 찾기 인증창
function checkNum(checkNum) {
	var inputNum = document.getElementById("confirm").value;
	console.log(inputNum);
	
	if (checkNum == inputNum) {
		alert("인증 성공");
		makeReal();
	}else if(inputNum==""){
		alert("인증번호를 입력해주세요")
		makeNull();
	}else{
		alert("인증 실패");
		makeNull();
	}
}


function makeReal(){
	var idsearch = document.getElementById("idsearch");
	idsearch.type="button";
}


function makeNull(){
	var idsearch = document.getElementById("idsearch");
	idsearch.type="hidden";
}




//비밀번호 찾기  인증창
function PWcheckNum(pwcheckNum) {
	var pwinputNum = document.getElementById("pwconfirm").value;
	console.log(pwinputNum);
	
	if (pwcheckNum == pwinputNum) {
		alert("인증 성공")
		pwmakeReal();
	}else if(pwinputNum==""){
		alert("인증번호를 입력해주새요")
		pwmakeNull();
	}else  {
		alert("인증 실패")
		pwmakeNull();
	}
}

//인증번호 입력해서 성공 실패 유무에 따라 숨기고 나타내는 버튼 부분
function pwmakeReal(){
	var idsearch = document.getElementById("pwsearch");
	idsearch.type="button";
}


function pwmakeNull(){
	var idsearch = document.getElementById("pwsearch");
	idsearch.type="hidden";
}
//이메일 형식





