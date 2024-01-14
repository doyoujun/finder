  var openModalinfo1 = document.getElementById("openModalinfo1");
  var openModalinfo11 = document.querySelectorAll("#openModalinfo1");
  var openModalinfo2 = document.getElementById("openModalinfo2");
  var openModalinfo22 = document.querySelectorAll("#openModalinfo2");
  var openModalreport11 = document.querySelectorAll("#openModalreport1");
  var openModalreport = document.querySelector("#openModalreport1");
  var openModalreport1 = document.getElementById("openModalreport1");
  var openModalreport2 = document.getElementById("openModalreport2");
  var openModalreport22 = document.querySelectorAll("#openModalreport2");
  var openModalmessage1 = document.getElementById("openModalmessage1");
  var openModalmessage2 = document.getElementById("openModalmessage2");
  
  var modal1 = document.getElementById("infoModal");
  var modal2 = document.getElementById("reportModal");
  var madal44 = document.querySelector("#reportModal2");
  var modal22 = document.querySelectorAll("#reportModal");
  var madal33 = document.querySelectorAll("#reportModal2");
  var modal3 = document.getElementById("messageModal");
  var closeModal1 = document.getElementById("closeModal1");
  var closeModal2 = document.getElementById("closeModal2");
  var closeModal22 = document.querySelectorAll("#closeModal2");
  var closeModal223 = document.querySelectorAll("#closeModal22");
  var closeModal3 = document.getElementById("closeModal3");

	const test = document.querySelectorAll("#test");
	const reportModal = document.querySelectorAll("#reportModal");
	const modalSignup = document.querySelectorAll("#infoModal");
	const modalUpdate = document.querySelectorAll("#infoModal2");
	const closeModal11 = document.querySelectorAll("#closeModal11");
	const closeModalList1 = document.querySelectorAll("#closeModal1");
	const modal55 = document.querySelector("#infoModal2");
	
	const decision = document.querySelectorAll("#decision");
	
	const value = document.getElementById("decision");
	

	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');

	
	//회원가입 열기
	for(let i = 0; i < openModalinfo11.length; i++) {
		openModalinfo11[i].onclick = () => {
			modalSignup[i].style.display = "block";

		}
	}
	//회원가입 닫기
	for(let i = 0; i < openModalinfo11.length; i++) {
		closeModalList1[i].onclick = () => {
			modalSignup[i].style.display = "none";
		}
	}


		//수정 열기
	for(let i = 0; i < openModalinfo22.length; i++) {
		openModalinfo22[i].onclick = () => {
			modalUpdate[i].style.display = "block";
			
		}
	}
	//수정 닫기
	for(let i = 0; i < openModalinfo22.length; i++) {
		closeModal11[i].onclick = () => {
			modalUpdate[i].style.display = "none";
		}
	}



	//긴급보고 열기
	for(let i = 0; i < openModalreport11.length; i++) {
		openModalreport11[i].onclick = () => {
			modal22[i].style.display = "block";
			
		}
	}
	//긴급보고 닫기
	for(let i = 0; i < openModalreport11.length; i++) {
		closeModal22[i].onclick = () => {
			modal22[i].style.display = "none";
		}
	}
	//일반보고 열기
	for(let i = 0; i < openModalreport22.length; i++) {
		openModalreport22[i].onclick = () => {
			madal33[i].style.display = "block";
			
		}
	}
	//일반보고 닫기
	for(let i = 0; i < openModalreport22.length; i++) {
		closeModal223[i].onclick = () => {
			madal33[i].style.display = "none";
		}
	}

const btn = document.querySelectorAll(".btn");
const btnList = document.querySelector(".btn");
const btn2 = document.querySelector(".btn2");
const btnCheck = document.querySelector("#btnCheck");
const btnCheck2 = document.querySelector("#btnCheck2");
const btnchecklist = document.querySelectorAll("#btnCheck");
const btnchecklist2 = document.querySelectorAll("#btnCheck2");


	//긴급보고 확인 열기
	for(let i = 0; i < btnchecklist.length; i++) {
		btnchecklist[i].onclick = () => {
			modal22[i].style.display = "block";
			
		}
	}

	//일반보고 확인 열기
	for(let i = 0; i < btnchecklist2.length; i++) {
		btnchecklist2[i].onclick = () => {
			madal33[i].style.display = "block";
			
		}
	}
	




	btnCheck.addEventListener("click", function() {
	  
  		
	   modal2.style.display = "block";
  });
	
	btnCheck2.addEventListener("click", function() {
	  madal44.style.display = "block";
  });


  openModalinfo1.addEventListener("click", function() {
	  
  		
	  modal1.style.display = "block";
  });
  openModalinfo2.addEventListener("click", function() {
	  modal55.style.display = "block";
  });
  openModalreport1.addEventListener("click", function() {
	  
	  
	  
	  modal2.style.display = "block";
		//지도 불러오기
	  var container = document.getElementById('modalmap');
	  var options = {
	  		center: new kakao.maps.LatLng(35.105530, 129.084726),
	  		level: 2,
	  };

	  var map = new kakao.maps.Map(container, options);
	  map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);	//스카이뷰 지도 유형으로 설정
	  	
	  var content = '<div style="width: fit-content; height: fit-content;display: flex;flex-direction: column;align-items: center;"><div><img alt="" src="${pageContext.request.contextPath}/resources/assets/img/img_09.png" style="border-radius: 50px;border: 1px solid #03F133;margin-bottom: -5px;"></div><div style="width: 10px; height: 11px; background-color: #04DC4C; border-radius: 50px;position: relative;z-index: 99;"></div><div style="background-color: #fff; border-radius: 16px; width: 64px; height: 25px; box-shadow: 0px 0px 10px #00000029; display: flex;justify-content: center;align-items: center; margin-top: -3px; position: relative;z-index: 1;"><span style="font-weight: bold; font-size: 13px;color: #04DC4C">${CombinedList.user_name}</span></div></div>';
	// 커스텀 오버레이가 표시될 위치
	  var position = new kakao.maps.LatLng(35.105530, 129.084726);	  
	  
		// 커스텀 오버레이를 생성합니다
		  var customOverlay = new kakao.maps.CustomOverlay({
		      position: position,
		      content: content   
		  });

		// 커스텀 오버레이를 지도에 표시합니다
		  customOverlay.setMap(map);
  });
  openModalreport2.addEventListener("click", function() {
	  madal44.style.display = "block";
  });
  openModalmessage1.addEventListener("click", function() {
	  modal3.style.display = "block";
  });
  openModalmessage2.addEventListener("click", function() {
	  modal3.style.display = "block";
  });

  closeModal1.addEventListener("click", function() {
	  modal1.style.display = "none";
  });
  closeModal2.addEventListener("click", function() {
	  modal2.style.display = "none";
  });
  closeModal3.addEventListener("click", function() {
	  modal3.style.display = "none";
  });

  window.addEventListener("click", function(event) {
    if (event.target === modal1) {
    	modal1.style.display = "none";
    }
  });
  window.addEventListener("click", function(event) {
    if (event.target === modal2) {
    	modal2.style.display = "none";
    }
  });
  window.addEventListener("click", function(event) {
    if (event.target === modal3) {
    	modal3.style.display = "none";
    }
  });
  
  sendMessage.addEventListener("click", function() {
	  const messageText = messageInput.value;
	  if (messageText) {
	    const messageElement = document.createElement("div");
	    messageElement.innerText = messageText;
	    chatMessages.appendChild(messageElement);
	    messageInput.value = "";
	  }
	});
  
function optionChanged(selectElement, index) {
	        var selectedValue = $(selectElement).val(); // 선택된 옵션의 값을 가져옵니다.
        //alert('선택된 값: ' + selectedValue);
        if(selectedValue==='1'){
        	if(confirm('승인하시겠습니까?')){
        		$.ajax({
                    url: $("#context").text()+'/optionSelect', 
                    type: 'POST', 
                    data: { decision: 1 },
                    success: function(response) {
                        alert('선택된 값: ' + decision);
                    },
                    error: function(error) {
                    }
                }); 
        		alert('승인처리 되었습니다.');
        		var header = $("meta[name='_csrf_header']").attr('content');
        		var token = $("meta[name='_csrf']").attr('content');
        		
        		$.ajax({
        			async: false,
        			type: "post",
        			url: $("#context").text()+'/updateUser',
        			data: {
        				user_joinconfirm:1,
        				user_index : index
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        			},
        					error: (error) => {
        				}
        		});
        	}
        }
        else if(selectedValue==='0'){
        	if(confirm('거절하시겠습니까?')){
        		$.ajax({
                    url: $("#context").text()+'/optionSelect', 
                    type: 'POST', 
                    data: { decision: 0 },
                    success: function(response) {
                        alert('선택된 값: ' + decision);
                    },
                    error: function(error) {
                    }
                }); 
        		alert('거절처리 되었습니다.');
        		var header = $("meta[name='_csrf_header']").attr('content');
        		var token = $("meta[name='_csrf']").attr('content');
        		
        		$.ajax({
        			async: false,
        			type: "post",
        			url: $("#context").text()+'/updateUser',
        			data: {
        				user_joinconfirm: -1,
        				user_index : index
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        			},
        					error: (error) => {
        				}
        		});
        	}
        }
}

function optionChanged1(selectElement, index) {
	
	var selectedValue = $(selectElement).val(); // 선택된 옵션의 값을 가져옵니다.
        //alert('선택된 값: ' + selectedValue);
        if(selectedValue==='1'){
        	if(confirm('승인하시겠습니까?')){
        		$.ajax({
                    url: $("#context").text()+'/optionSelect', 
                    type: 'POST', 
                    data: { decision: 1 },
                    success: function(response) {
                        alert('선택된 값: ' + decision);
                    },
                    error: function(error) {
                    }
                }); 
        		alert('승인처리 되었습니다.');
        		var header = $("meta[name='_csrf_header']").attr('content');
        		var token = $("meta[name='_csrf']").attr('content');
        		
        		$.ajax({
        			async: false,
        			type: "post",
        			url: $("#context").text()+'/updateUserApprove',
        			data: {
        				user_index : index,
        				user_name : $("#user_edit_name").text(),
        				user_team : $("#user_edit_team").text(),
        				user_duty : $("#user_edit_duty").text(),
        				user_vehicle: $("#user_edit_vehicle").text(),
        				user_birth : $("#user_edit_birth").text(),
        				user_address : $("#user_edit_address").text(),
        				user_daddress : $("#user_edit_daddress").text(),
        				user_managerphone : $("#user_edit_managerphone").text(),
        				user_email : $("#user_edit_email").text()
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        			},
        					error: (error) => {
        				}
        		});
        	}
        }
        else if(selectedValue==='0'){
        	if(confirm('거절하시겠습니까?')){
        		$.ajax({
                    url: $("#context").text()+'/optionSelect', 
                    type: 'POST', 
                    data: { decision: 0 },
                    success: function(response) {
                        alert('선택된 값: ' + decision);
                    },
                    error: function(error) {
                    }
                }); 
        		alert('거절처리 되었습니다.');
        		
        	}
        }
}


/*$(document).ready(function() {
    $("#decision").on("change","[id^='decision']" ,function() {
        var selectedValue = $(this).val(); // 선택된 옵션의 값을 가져옵니다.
        //alert('선택된 값: ' + selectedValue);
        if(selectedValue==='1'){
        	if(confirm('승인하시겠습니까?')){
        		$.ajax({
                    url: '${pageContext.request.contextPath}/optionSelect', 
                    type: 'POST', 
                    data: { decision: 1 },
                    success: function(response) {
                        alert('선택된 값: ' + decision);
                        console.log(response);
                    },
                    error: function(error) {
                        console.log(error);
                    }
                }); 
        		alert('승인처리 되었습니다.');
        		var header = $("meta[name='_csrf_header']").attr('content');
        		var token = $("meta[name='_csrf']").attr('content');
        		
        		$.ajax({
        			async: false,
        			type: "post",
        			url: '/project/updateUser',
        			data: {
        				user_joinconfirm:1,
        				user_index : $("#user_idx2").text()
        			},
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        					console.log("성공" + response);
        			},
        					error: (error) => {
        					console.log("실패" + error);
        				}
        		});
        	}
        }
        else if(selectedValue==='0'){
        	if(confirm('거절하시겠습니까?')){
        		$.ajax({
                    url: '${pageContext.request.contextPath}/optionSelect', 
                    type: 'POST', 
                    data: { decision: 0 },
                    success: function(response) {
                        alert('선택된 값: ' + decision);
                        console.log(response);
                    },
                    error: function(error) {
                        console.log(error);
                    }
                }); 
        		alert('거절처리 되었습니다.');
        	}
        }
    });
});*/