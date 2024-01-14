function userAdd_vail() {
	
	
			console.log($("#club_information_position1").val());
			console.log($("#club_information_position2").val());
	
			var header = $("meta[name='_csrf_header']").attr('content');
    		var token = $("meta[name='_csrf']").attr('content');
			

			$.ajax({
        			async: false,
        			type: "get",
        			url: '/project/transfercreate',
        			data: {
        				linenumber : $("#club_information_position1").val(),
        				userid : $("#club_information_position2").val()
        				
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        					
        					console.log("get성공" + response);
        					
        					
        					postRequest(response)

        			},
        					error: (error) => {
						if(error.status == 500) {
					   		alert("잘못된 정보입니다. 노선번호와 회원정보를 확인해주세요.");
					   }else {
				   		console.log("요청실패");
				   		console.log(error);
			   }
		}
        		});
	
}

function postRequest(response) {
				console.log("postRequest 실행");
/*				 for (var i = 0; i < response.length; i++) {
			        var dto = response[i];
			        console.log("DTO " + (i + 1) + ":");
			        console.log("Line Index:", dto.line_idx);
			        console.log("Line Price:", dto.line_price);
			        console.log("Account Index:", dto.account_idx);
			        console.log("Account Name:", dto.account_name);
			        // Add more properties as needed
    			}*/
    			
			var header = $("meta[name='_csrf_header']").attr('content');
    		var token = $("meta[name='_csrf']").attr('content');
    			var dataline = response[0];
					
				var fee_line_idx = dataline.line_idx;
				var fee_deposit_amount = dataline.line_price;
				
					
				var dataaccount = response[1];
				
				var fee_account_idx = dataaccount.account_idx;
				var fee_operating_fee_depositor_name = dataaccount.account_name;	
			

	$.ajax({
            type: "post",
            url: '/project/createtransfer',
            data: {
                line_operating_fee_line_idx: fee_line_idx,
                line_operating_fee_account_idx: fee_account_idx,
                line_operating_fee_date: 'value2',
                line_operating_fee_deposit_status: 1,
                line_operating_fee_depositor_name: fee_operating_fee_depositor_name,
                line_operating_fee_deposit_amount: fee_deposit_amount
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function (response) {
                console.log("POST Success: " + response);
                location.href = "/project/transfer";
            },
            error: function (error) {
                console.log("POST Failure: " + error);
            }
        });
	
	
}