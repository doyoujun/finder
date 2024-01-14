document.addEventListener('click', function(event) {
    if (event.target.classList.contains('click')) {
        event.preventDefault();
        var index = event.target.getAttribute('data-index');
        
        
        location.href="${pageContext.request.contextPath}/notice_detail"
        dateModal11[index].style.display = 'block';
        
        
    }
});




function notice(url, index) {
	
	
			var header = $("meta[name='_csrf_header']").attr('content');
    		var token = $("meta[name='_csrf']").attr('content');
			
			$.ajax({
        			async: false,
        			type: "post",
        			url: $("#context").text()+'/updateview',
        			data: {
        				notice_index : index
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        					location.href = url;
        			},
        					error: (error) => {
        				}
        		});
	
	
	
	
}



