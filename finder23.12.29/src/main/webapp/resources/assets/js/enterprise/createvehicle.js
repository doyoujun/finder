function vehicleRegist_btn(idx, infoidx) {
	

	
		var formData = new FormData(document.getElementById('vehicleRegiform'));
	
		formData.append('vehicle_enterprise_index', idx);
		formData.append('vehicle_enterprise_info_index', infoidx);
		formData.append('vehicle_name', $("#vequipname").val());
		formData.append('vehicle_num', $("#venumber").val());
		formData.append('vehicle_inputdate', $("#vedate").val());
		formData.append('vehicle_manager', $("#vemanager").val());
	
	
			var header = $("meta[name='_csrf_header']").attr('content');
    		var token = $("meta[name='_csrf']").attr('content');
			
			$.ajax({
        			async: false,
        			type: "post",
        			url: $("#context").text()+'createvehicle',
        			data: formData,
        			contentType: false, // 필수
        			processData: false, // 필수
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        					location.href = $("#context").text()+"/workerequipmentManage";
        			},
        					error: (error) => {
        				}
        		});
	
}