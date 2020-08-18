$(document).ready(function(){
	var myKey = "1S0f3GpywJGZhgv6GPjrRA";
	
	//택배사 목록 조회 company-api
	$.ajax({
		url : "http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
		type: "GET",
		dataType: "json",
		success : function(data){
			var CompanyArray = data.Company;
			console.log(CompanyArray);
			
			var myData = "";
			$.each(CompanyArray, function(key, value){
				myData += ('<option value='+value.Code+'>'+value.Name + '</option>');
				
			});
			$("#tekbeCompanyList").html(myData);
		}

	});
	
	//배송정보와 배송추척 tracking-api
	$("#search").click(function(){
		var t_code = $('#tekbeCompanyList option:selected').attr('value');
		var t_invoice = $('#invoiceNumberText').val();
		$.ajax({
			type: "GET",
			dataType:"json",
			url: "http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
            success:function(data){
                console.log(data);  //object
                var myInvoiceData = "";
                if(data.status == false){
                    myInvoiceData += ('<p>'+data.msg+'<p>');
                }else{
                    myInvoiceData += ('<tr>');                
                    myInvoiceData += ('<th>'+"보낸 사람"+'</td>');                     
                    myInvoiceData += ('<th>'+data.senderName+'</td>');                     
                    myInvoiceData += ('</tr>');     
                    myInvoiceData += ('<tr>');                
                    myInvoiceData += ('<th>'+"제품정보"+'</td>');                     
                    myInvoiceData += ('<th>'+data.itemName+'</td>');                     
                    myInvoiceData += ('</tr>');     
                    myInvoiceData += ('<tr>');                
                    myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
                    myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                     
                    myInvoiceData += ('</tr>');     
                    myInvoiceData += ('<tr>');                
                    myInvoiceData += ('<th>'+"보낸 사람 주소"+'</td>');                     
                    myInvoiceData += ('<th>'+data.receiverAddr+'</td>');                     
                    myInvoiceData += ('</tr>');                                       
                }
                
                
                $("#myPtag").html(myInvoiceData)
                
                var trackingDetails = data.trackingDetails;
                
                
                var myTracking="";
                var header ="";
                header += ('<tr>');                
                header += ('<th>'+"시간"+'</th>');
                header += ('<th>'+"장소"+'</th>');
                header += ('<th>'+"진행상태"+'</th>');
                header += ('<th>'+"전화번호"+'</th>');                     
                header += ('</tr>');     
                
                $.each(trackingDetails,function(key,value) {
                    myTracking += ('<tr>');                
                    myTracking += ('<td>'+value.timeString+'</td>');
                    myTracking += ('<td>'+value.where+'</td>');
                    myTracking += ('<td>'+value.kind+'</td>');
                    myTracking += ('<td>'+value.telno+'</td>');                     
                    myTracking += ('</tr>');                                    
                });
                
                $("#myPtag2").html(header+myTracking);
                
            }
        });
    });
    
});