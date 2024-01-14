function optionChanged1(index) {
	
	
	const checkboxId = "complete_detailModal" + index;
	const docu = document.getElementById(checkboxId);
	
        
        docu.style.display = 'block';
        
	}

function close1(idx) {
	
	const checkboxId = "complete_detailModal" + idx;
	const docu = document.getElementById(checkboxId);
	
        
        docu.style.display = 'none';
}


  function searchPost() {
	  
	
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	
	
	$.ajax({
        			async: false,
        			type: "get",
        			url: $("#context").text()+'searchwork',
        			data: {
        				work_assigndate : $("#datepicker-input").val()
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        					getList(response);
        					
        			},
        					error: (error) => {
        				}
        		});
} 
  
window.enterkeySearch = () => {
    if (window.event.keyCode == 13) {
    searchPost();
    }
} 

const boardList = document.querySelector("#board-list tbody");
  
function getList(data) {
	
	
	boardList.innerHTML = '';
	for(let content of data) {
		let listContent ='';
		
		
	if (content.work_nameimg === null || content.work_nameimg === "") {
		listContent = ` 
						<tr>
            				<td>${content.formatted_createtime}</td>
            				<td> 이미지가 없습니다. <div>${content.work_name}</div> </td>
            				<td>${content.work_content}</td>
            				<td>${content.user_name}</td>
            				<td style="padding:7px;">
            					<button id="openModalcomdetail1" style="text-decoration: underline; color: #707070; cursor: pointer;background-color: #fff;border: none;" onclick="optionChanged1(${content.work_index})"> ${content.work_completedatefull}</button>
            				</td>
            			</tr>
		`;
	}else {
			listContent = `
						<tr>
            				<td>${content.formatted_createtime}</td>
            				<td> <img alt="업무명(이미지)" src="http://codebrosdev.cafe24.com:8080/media/finder/work/${content.work_nameimg}" style="width:138px; height:87px"> <div>${content.work_name}</div> </td>
            				<td>${content.work_content}</td>
            				<td>${content.user_name}</td>
            				<td style="padding:7px;">
            					<button id="openModalcomdetail1" style="text-decoration: underline; color: #707070; cursor: pointer;background-color: #fff;border: none;" onclick="optionChanged1(${content.work_index})"> ${content.work_completedatefull}</button>
            				</td>
            			</tr>
		`;
	}
		boardList.innerHTML += listContent;
	}
}

 