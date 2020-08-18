
//아이디 중복검사
	/*trim 공백 사용해서 아이디 넣을수도 있으니깐  */
	function idCheck(){
		 var doc = document.getElementsByName("id")[0];
		if(doc.value.trim()=="" || doc.value==null){
			alert("아이디를 입력해주세요!")
		}else{
			open("RegisterController.do?command=idcheck&id="+doc.value,
					"",
					"width=200, height=200");
		}
 	}
	
	
	
	//이메일 중복체크
	function emailCheck(){
		var doc= document.getElementsByName("email")[0];
		console.log(doc);
		if(doc.value.trim()=="" || doc.value == null){
			alert("이메일을 입력해주세요")
		}else{
			open("RegisterController.do?command=emailCheck&email="+doc.value,
					"",
					"width=500, height=300");
		}
	}

	
			
	
	
	
	//-----------회원가입 유효성 검사 ----------------------
	/* function checkAll() {
	        if (!checkUserId(form.userId.value)) {
	            return false;
	        } else if (!checkMail(form.mail.value)) {
	            return false;
	        } else if (!checkName(form.name.value)) {
	            return false;
	        }  
	        return true;
	   }

	 //공백함수 
	 function checkExistData(value, dataName){
		 if(value=""){
			 alert(dataName+"입력해주세여");
			 return false;
		 }
		 return true;
	 }	
	 
	 function checkUserId(id) {
	        //Id가 입력되었는지 확인하기
	        if (!checkExistData(id, "아이디를"))
	            return false;
	 
	        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
	        if (!idRegExp.test(id)) {
	            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	            form.userId.value = "";
	            form.userId.focus();
	            return false;
	        }
	        return true; //확인이 완료되었을 때
	    }
	 
	 function checkMail(mail) {
		 	console.log(mail);
	        //mail이 입력되었는지 확인하기
	        if (!checkExistData(mail, "이메일을"))
	            return false;
	 
	        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	        if (!emailRegExp.test(mail)) {
	            alert("이메일 형식이 올바르지 않습니다!");
	            form.mail.value = "";
	            form.mail.focus();
	            return false;
	        }
	        return true; //확인이 완료되었을 때
	    }
*/

	
// 이메일 중복검사
	
	function emailCheck(){
		var doc= document.getElementsByName("email")[0];
		console.log(doc);
		if(doc.value.trim()=="" || doc.value == null){
			alert("이메일을 입력해주세요")
		}else{
			open("RegisterController.do?command=emailCheck&email="+doc.value,
					"",
					"width=500, height=300");
		}
	}
	
	
	

	
	// 회원가입 이메일 인증
	function emailconfirm(random){
		var email = document.getElementById("email").value;
		console.log(email);
		console.log(random);
		
		$.ajax({
			url:"RegisterController.do",
			type:"post",
			datatype:"json",
			data:{"command":"sendEmail","receiver":email,"random":random},
			success(data){
				alert("전송성공 \n 인증번호를 확인해주세요");
				
			},
			error(err){
				alert("해당 이메일 전송 실패 ");
			}
		})
		
		
		
	};
	
	
	// 메일 인증번호 확인 값
	function checkNum(checkNum) {
		var inputNum = document.getElementById("confirm").value;
		console.log(inputNum);
		
		if (checkNum == inputNum) {
			alert("인증 성공");
			focus("#daumaddr");
			$("#btnSend").show();
		}else if(inputNum==""){
			alert("인증번호를 입력해주세요")
			$("#btnSend").hide();
		}else{
			alert("인증 실패");
			$("#btnSend").hide();
		}
	}
	
	
	
	
	
	

	
	
	
	

	
	
	
	//비밀번호 유효성검사 
var compare_result= false;		
function fn_compare_pwd(){
	
	var pw1 = $("#password1").val();
	var pw2 = $("#password2").val();
	var s_result=$("#s_result");
	
	
	if(pw1 == pw2){
		compare_result = true;
		$("#s_result").text("비밀번호가 일치합니다.");
		$("#s_result").focus();
	}else {
		compare_result = false;
		$("#s_result").text("비밀번호가 일치하지 않습니다.");
		$("#s_result").focus();
	}

	




	
	
	
		 
	 
	
	
	
		
//-- template

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
			)
			
//			-------------------------다음 api 주소 
			
			 function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                   
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
			
			
			
	 
}
			