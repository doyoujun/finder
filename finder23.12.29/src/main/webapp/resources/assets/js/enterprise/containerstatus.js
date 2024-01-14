var openModalshipname = document.getElementById("openModalshipname");	//선박명(이미지)
const openModalshipname1 = document.querySelectorAll("#openModalshipname");	//선박명(이미지)
  var openModalBIDO = document.getElementById("openModalBIDO");	//B/I / D/O
  const openModalBIDO1 = document.querySelectorAll("#openModalBIDO");	//B/I / D/O
  var openModalDate = document.getElementById("openModalDates");	//출하일(출하시간)
  const openModalDateList = document.querySelectorAll("#openModalDates");	//출하일(출하시간)
  var openModalDate1 = document.getElementById("openModalDate1");	//출하일(출하시간)
  
  var shipnameModal = document.getElementById("shipnameModal");		//선박명(이미지)
  const shipnameModal1 = document.querySelectorAll("#shipnameModal");		//선박명(이미지)
  var BIDOModal = document.getElementById("BIDOModal");				//B/I / D/O
  const BIDOModal1 = document.querySelectorAll("#BIDOModal");				//B/I / D/O
  var dateModal = document.getElementById("dateModal");				//출하일(출하시간)
  const dateModal11 = document.querySelectorAll("#dateModal");				//출하일(출하시간)
  
  var closeModal1 = document.getElementById("closeModal11");
  var closeModal11 = document.querySelectorAll("#closeModal11");
  var closeModal2 = document.getElementById("closeModal12");
  var closeModal22 = document.querySelectorAll("#closeModal12");
  var closeModal3 = document.getElementById("closeModal13");
  const closeModal33 = document.querySelectorAll("#closeModal13");
  var closeModal4 = document.getElementById("closeModal14");
  
  function searchPost() {
	var searchValue = $("#search3").val();
	
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	
	
	$.ajax({
        			async: false,
        			type: "get",
        			url: $("#context").text()+'/searchcontainer',
        			data: {
        				container_name : searchValue
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
		
		
	if (content.container_img === null || content.container_img === "") {
		listContent = `
						<tr>
        					<td> 이미지가 없습니다. <div style="margin-top: 10px;">${content.container_name}</div> </td>
            				<td>${content.container_name}</td> 
            				<td>${content.container_nationality}</td>
            				<td>${content.container_type}</td>
            				<td>${content.container_IGT}</td>
            				<td>${content.formatted_createtime}</td>
            				<td>
            					<div class="input-group mb-3">
            						<div style="border:0.67px solid #DDDDDD; border-bottom-left-radius: 5px; border-top-left-radius: 5px; padding:8px; border-right: none;">
										<img alt="" src="/project/resources/assets/img/icon_calendar.png" id="openModalDate1">
									</div>
									<input type="text" class="form-control openModalDate" data-index="${content.container_index}" placeholder="출하일(출하시간)등록" id="openModalDates${content.container_index}" style="padding: 8px; border-left: none;">
								</div>
            				</td>
            				<td style="padding:7px;">
            					<button class="btn" style="color: #fff; background-color:#0088C3;width:100px;" id="openModalBIDO${content.container_index}" onclick="look(${content.container_index})"> 보기	</button>
            				</td>
            			</tr>
		`;
	}else {
			listContent = `
						<tr>
        					<td> <img alt="선박명(이미지)" src="http://codebrosdev.cafe24.com:8080/media/finder/container/${content.container_img}" id="openModalshipname${content.container_index}" onclick="looking (${content.container_index})" style="width:138px; hieght:87px"> <div style="margin-top: 10px;">${content.container_name}</div> </td>
            				<td>${content.container_name}</td> 
            				<td>${content.container_nationality}</td>
            				<td>${content.container_type}</td>
            				<td>${content.container_IGT}</td>
            				<td>${content.formatted_createtime}</td>
            				<td>
            					<div class="input-group mb-3">
            						<div style="border:0.67px solid #DDDDDD; border-bottom-left-radius: 5px; border-top-left-radius: 5px; padding:8px; border-right: none;">
										<img alt="" src="/project/resources/assets/img/icon_calendar.png" id="openModalDate1">
									</div>
									<input type="text" class="form-control openModalDate" data-index="${content.container_index}" placeholder="출하일(출하시간)등록" id="openModalDates${content.container_index}" style="padding: 8px; border-left: none;">
								</div>
            				</td>
            				<td style="padding:7px;">
            					<button class="btn" style="color: #fff; background-color:#0088C3;width:100px;" id="openModalBIDO${content.container_index}" onclick="look(${content.container_index})"> 보기	</button>
            				</td>
            			</tr>
		`;
	}
		boardList.innerHTML += listContent;
	}
}
//BI보기  
function look (index) {
	
	
	var openModalinfo1 = document.getElementById("openModalBIDO" + index);
  var modal1 = document.getElementById("BIDOModal" + index);



	
 
	  
	  modal1.style.display = "block";
  
}  

//BIDO 닫기
function closed (idx) {
	var modal1 = document.getElementById("BIDOModal" + idx);
	
	console.log(idx);
	
		
	  modal1.style.display = "none";
  
}
//선박이미지 닫기
function closedship (idx) {
	var modal1 = document.getElementById("shipnameModal" + idx);
	
	console.log("닫기");
	
		
	  modal1.style.display = "none";
  
}

//선박이미지  
function looking (index) {
	
	console.log(index);
	
	var openModalinfo1 = document.getElementById("openModalBIDO" + index);
  var modal1 = document.getElementById("shipnameModal" + index);



	
 
	  
	  modal1.style.display = "block";
  
}  

//출하일 모달
function lookdate(index) {
	
	var openModalinfo1 = document.getElementById("openModalBIDO" + index);
  var modal1 = document.getElementById("dateModal" + index);
	  
	  modal1.style.display = "block";
	  
	    $(document).ready(function() {
      // datepicker를 초기화하고 inline 모드로 설정
      $('#datepicker-container'+index).datepicker({
          inline: true,
          format: 'yyyy-mm-dd',
          language: 'ko',
          todayHighlight: true,
          autoclose: true,
      });
  });
  $(document).ready(function() {
	    // 모든 입력 필드에 대한 Keyup 이벤트 리스너 추가
	    $("input").keyup(function(e) {
	        if ($(this).val().length == $(this).attr("maxlength")) {
	            // 입력된 값의 길이가 최대 길이와 같다면 다음 입력 필드로 이동
	            $(this).next().focus();
	        }
	    });
	});
	  
	  
}

//출하일 닫기
function closeddate (idx) {
	var modal1 = document.getElementById("dateModal" + idx);
	
	
		
	  modal1.style.display = "none";
  
}


/*	//선박이미지 열기
	for(let i = 0; i < openModalshipname1.length; i++) {
		openModalshipname1[i].onclick = () => {
			shipnameModal1[i].style.display = "block";
			console.log("연다.");
			console.log("modal22:" + shipnameModal1.length);
			
		}
	}
	//선박이미지 닫기
	for(let i = 0; i < openModalshipname1.length; i++) {
		closeModal11[i].onclick = () => {
			shipnameModal1[i].style.display = "none";
			console.log("닫는다.");
		}
	}
*/


/*	//B/I D/O 이미지 열기
	for(let i = 0; i < openModalBIDO1.length; i++) {
		openModalBIDO1[i].onclick = () => {
			console.log("연다.");
			BIDOModal1[i].style.display = "block";
			console.log("modal22:" + openModalBIDO1.length);
			
		}
	}
	
	//B/I D/O 이미지 닫기
	for(let i = 0; i < openModalBIDO1.length; i++) {
		closeModal22[i].onclick = () => {
			BIDOModal1[i].style.display = "none";
			console.log("닫는다.");
		}
	}
*/
/*document.addEventListener('click', function(event) {
    if (event.target.classList.contains('openModalDate')) {
        event.preventDefault();
        var index = event.target.id.replace('openModalDates', ''); // Extract the index from the element id
        dateModal11[index].style.display = 'block';
        console.log('Open.');
    }
});*/

	
/*function open(i) {
	  event.preventDefault();
	openModalDateList[i].onclick = () => {
	dateModal11[i].style.display = "block";
	console.log("열기.");
}	
}*/	
	
	/*//출하일 열기
	for(let i = 0; i < openModalDateList.length; i++) {
		openModalDateList[i].onclick = () => {
			dateModal11[i].style.display = "block";
			console.log("열기.");
		}
	}
	
	//출하일 닫기
	for(let i = 0; i < openModalDateList.length; i++) {
		closeModal33[i].onclick = () => {
			dateModal11[i].style.display = "none";
			console.log("닫는다.");
		}
	}

  openModalshipname.addEventListener("click", function() {
	  shipnameModal.style.display = "block";
  });
  openModalBIDO.addEventListener("click", function() {
	  BIDOModal.style.display = "block";
  });
  openModalDate.addEventListener("click", function() {
	  dateModal.style.display = "block";
  });
  
  document.addEventListener('click', function(event) {
    if (event.target.classList.contains('openModalDates')) {
        event.preventDefault();
        var index = event.target.getAttribute('data-index');
        dateModal11[index].style.display = 'block';
        console.log('Open.');
    }
});
  
  for (let i = 0; i < dateModal11.length; i++) {
    var closeModal = document.getElementById(`closeModal13${i}`);
    
    if (closeModal) {
        closeModal.addEventListener("click", function() {
            dateModal11[i].style.display = "none";
            console.log("Close.");
        });
    }
}
  
  
  
  openModalDate1.addEventListener("click", function() {
	  dateModal.style.display = "block";
  });

  closeModal1.addEventListener("click", function() {
	  shipnameModal.style.display = "none";
  });
  closeModal2.addEventListener("click", function() {
	  BIDOModal.style.display = "none";
  });
  closeModal3.addEventListener("click", function() {
	  dateModal.style.display = "none";
  });
  closeModal4.addEventListener("click", function() {
	  dateModal.style.display = "none";
  });
  */
/* for(let i = 0; i < dateModal11.length; i++) {
	  
	  console.log("i"+i);
  $(document).ready(function() {
      // datepicker를 초기화하고 inline 모드로 설정
      $('#datepicker-container'+i).datepicker({
          inline: true,
          format: 'yyyy-mm-dd',
          language: 'ko',
          todayHighlight: true,
          autoclose: true,
      });
  });
  $(document).ready(function() {
	    // 모든 입력 필드에 대한 Keyup 이벤트 리스너 추가
	    $("input").keyup(function(e) {
	        if ($(this).val().length == $(this).attr("maxlength")) {
	            // 입력된 값의 길이가 최대 길이와 같다면 다음 입력 필드로 이동
	            $(this).next().focus();
	        }
	    });
	});
  }*/

	  
  function registerDate(i) {
	    // datepicker에서 선택한 날짜를 가져오기
	    var selectedDate = $("#datepicker"+i).val();
	    
		//alert(selectedDate);
	    var amPm = $("#timezone"+i).val();
	    var hour1 = $("#hour1"+i).val();
	    var hour2 = $("#hour2"+i).val();	    
	    var minute1 = $("#minute1"+i).val();
	    var minute2 = $("#minute2"+i).val();
		
		
	    var hour = parseInt(hour1 + hour2);
	    var minute = parseInt(minute1 + minute2);
	    
	    if (amPm === "am") {
	        // 오전 선택 시
	        if (hour === 12) {
	            // 12:00 AM은 00:00
	            hour = 0;
	        }
	    } else if (amPm === "pm") {
	        // 오후 선택 시
	        if (hour !== 12) {
	            // 12:00 PM은 그대로 유지
	            hour += 12;
	        }
	    }
	    
	    // 날짜와 시간을 조합하여 문자열을 생성
	    var time24hr = hour.toString().padStart(2, '0') + ':' + minute.toString().padStart(2, '0');
	    var modal1 = document.getElementById("dateModal" + i);
		alert(selectedDate + "("+time24hr+")");
		
		$("#openModalDates"+i).val(selectedDate + "("+time24hr+")");
		
		
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		
		$.ajax({
        			async: false,
        			type: "post",
        			url: 'updateContainer',
        			data: {container_index:i,
        				container_shippingdate: $("#openModalDates"+i).val()
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        			},
        					error: (error) => {
        				}
        		});
		
		
		
		modal1.style.display = "none";
	
  }
  
  
  
  