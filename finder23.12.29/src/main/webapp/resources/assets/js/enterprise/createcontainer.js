



function containerRegist_btn(idx) {
	var result = confirm('등록하시겠습니까?');
		if(result){		
			
			var header = $("meta[name='_csrf_header']").attr('content');
    		var token = $("meta[name='_csrf']").attr('content');
			
			var formData = new FormData(document.getElementById('containerRegiform'));
			formData.append('container_name', $("#shipname").val());
			formData.append('container_team', $("#id").val());
			formData.append('container_nationality', $("#password").val());
			formData.append('container_type', $("#password_check").val());
			formData.append('container_IGT', $("#terminalname").val());
			formData.append('container_inputdate', $("#companycode").val());
			formData.append('container_shippingdate', $("#outdate").val());
			formData.append('container_enterprise_info_index', idx);
			
			$.ajax({
        			async: true,
        			type: "post",
        			url: $("#context").text()+'/createContainer',
        			data: formData,
        			contentType: false, // 필수
        			processData: false, // 필수
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        					location.href = $("#context").text()+"/containerStatus";
        			},
        					error: (error) => {
        				}
        		});
		}
	
}

