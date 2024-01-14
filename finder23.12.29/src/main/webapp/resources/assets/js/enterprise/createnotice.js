
let selected = 0;

function select(index) {
	var num = $(index).val();
	
	selected = num;
}

const button = document.querySelector("#noticeRegist");

button.onclick = () => {
						
			var header = $("meta[name='_csrf_header']").attr('content');
    		var token = $("meta[name='_csrf']").attr('content');
			
			$.ajax({
        			async: false,
        			type: "post",
        			url: $("#context").text()+'/createNotice',
        			data: {
        				notice_category : selected,
        				notice_writer : $("#managername").val(),
        				notice_title : $("#noticetitle").val(),
        				notice_view : 1,
        				notice_content : $("#gdsDes1").val(),
        				notice_img : 1
        				
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        					location.href = $("#context").text()+"/notice";
        			},
        					error: (error) => {
        				}
        		});
}