function checkidx(idx) {
	
	console.log(idx);
	console.log($("#textarea").val());
	console.log($("#adminname").text());
	
	var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
	
	$.ajax({
        			async: false,
        			type: "post",
        			url: '/project/createanswer',
        			data: {question_answer_question_idx: idx,
        				question_answer_description: $("#textarea").val(),
        				question_answer_writer: $("#adminname").text(),
        				question_answer_del: 0
        				
        			},
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

function deleted (index) {
	
	console.log(index);
	var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
	
		$.ajax({
        			async: false,
        			type: "get",
        			url: '/project/answerdelete',
        			data: {question_answer_idx:index
        			},
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

function deleteDetails(num) {
	
	console.log(num);
	var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
	
		$.ajax({
        			async: false,
        			type: "get",
        			url: '/project/questiondetailsdelete',
        			data: {question_idx:num
        			},
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

function update(number, text) {
	
	var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
	
	
	console.log(number);
	console.log(text);
			$.ajax({
        			async: false,
        			type: "post",
        			url: '/project/answerupdate',
        			data: {question_answer_idx:number,
        			question_answer_description: text
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        					location.href = "/project/contact";
        					console.log("성공" + response);
        			},
        					error: (error) => {
        					console.log("실패" + error);
        				}
        		});
}
