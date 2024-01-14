



/*function noticeRegist_btn(idx) {
	
	var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
	

	
	
	console.log(idx);
	console.log($("#noticetitle").val());
	
			$.ajax({
        			async: false,
        			type: "post",
        			url: '/project/updatenotice',
        			data: {
        			notice_category: selected,
        			notice_title: $("#noticetitle").val(),
        			notice_content: $("#gdsDes1").val(),
        			notice_index:idx
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        					location.href = "/project/notice";
        					console.log("성공" + response);
        			},
        					error: (error) => {
        					console.log("실패" + error);
        				}
        		});
}*/