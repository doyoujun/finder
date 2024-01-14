function userAdd_vail() {
	
	
	console.log($("#club_information_position").val());
	console.log($("#textarea").val());
	
		var formData = new FormData(document.getElementById('userInsertForm'));
	
		formData.append('account_account_idx', 1);
		formData.append('question_description', $("#club_information_position").val());
		formData.append('question_title', $("#textarea").val());
	
			var header = $("meta[name='_csrf_header']").attr('content');
    		var token = $("meta[name='_csrf']").attr('content');
			
			$.ajax({
        			async: false,
        			type: "post",
        			url: '/project/createquestion',
        			data: formData,
        			contentType: false, // 필수
        			processData: false, // 필수
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        					console.log("성공" + response);
        					location.href = "/project/contact";
        			},
        					error: (error) => {
        					console.log("실패" + error);
        				}
        		});
	
}