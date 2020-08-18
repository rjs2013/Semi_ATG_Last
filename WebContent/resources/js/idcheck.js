
	
	
	onload = function(){
		var id = opener.document.getElementsByName("id")[0].value;
		document.getElementsByName("id")[0].value = id;
		system.out.println(id);
	}
	
	function confirmId(bool){
		if(bool=="true"){
			opener.document.getElementsByName("id")[0].title='y';
			opener.document.getElementsByName("pw")[0].focus();
		}else{
			opener.document.getElementsByName("id")[0].focus();
		}
		self.close();
	}