
function deleteDetail (idx) {
	var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
	
	console.log($("#context").text());
		$.ajax({
        			async: false,
        			type: "post",
        			url: $("#context").text()+'/deletevehicle',
        			data: {vehicle_index:idx
        			},
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