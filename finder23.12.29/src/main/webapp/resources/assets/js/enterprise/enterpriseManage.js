

positionsave.onclick = async () => {
	const w100 = document.querySelectorAll(".w-100");
	var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
		for(let i = 0; i < w100.length; i++) {
				
				
				let value = w100[i].textContent.trim();
				
				
				let parts = value.split('-');
				
				
				if (parts.length === 2) {
            	let data = {
                workcategory_name: parts[0].trim(),  
                workcategory_content: parts[1].trim(),  
                workcategory_enterprise_index: $("#user_idx").text()
                
            };
                $.ajax({
                type: "get",
                url: $("#context").text()+'/checkEnterprise',  
                data: data,
				beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
                success: async (response) => {
                    if (!response.exists) {
                       await saveData(data);
                    } else {
                    }
                },
                error: (error) => {
                }
            });
		};
    
				
        	}
}

async function saveData(data) {
    var header = $("meta[name='_csrf_header']").attr('content');
    var token = $("meta[name='_csrf']").attr('content');
        		
        		
        	try {
        		
        		const response = await $.ajax({
        			type: "post",
        			url: $("#context").text()+'createEnterprise',
        			data: data,
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			}
        			
        		});
			}	catch (error) {
    }
};