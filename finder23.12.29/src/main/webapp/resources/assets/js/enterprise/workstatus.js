let currentCheckboxId = null;
let idx = 0;
function optionChanged1(selectElement, index) {
	idx = index;
	var selectedValue = $(selectElement).val();
	
	const checkboxId = "myCheckbox" + index;


	
	if (currentCheckboxId !== checkboxId) {
        // 이전에 선택된 체크박스가 있다면 체크를 해제
        if (currentCheckboxId) {
            const previousCheckbox = document.getElementById(currentCheckboxId);
            previousCheckbox.checked = false;
        }

        // 현재 선택된 체크박스의 ID를 저장
        currentCheckboxId = checkboxId;

        const workAssignForm = document.getElementById("createWork");

        if (selectElement.checked) {
            // 체크박스가 선택되었을 때 폼을 표시
            workAssignForm.style.display = "flex";
            workAssignForm.style.margin = "0 0 20px 260px";
        } else {
            // 체크박스가 해제되었을 때 폼을 숨김
            workAssignForm.style.display = "none";
        }
    }


}


const openModalworkassign1 = document.querySelector("#openModalworkassign");

openModalworkassign1.onclick = () => {

	
	const number = "username" + idx;
	
	const docu = document.getElementById(number);
	let text = docu.innerText;
	
	let worktitle = $("#worktitle").val();
	let workcontent = $("#workcontent").val();
	let selectedFileName3 = $("#selectedFileName3").val();
	
	
	let locationinput = $("#locationinput").val();
	
	if(locationinput == "") {
		locationinput = "-";
	}
	
	if(text == "") {
		text = "-";
	}

	
	
	console.log(locationinput);
	const info = document.querySelector(".info");
	
		info.innerHTML = `
				<ul style="font-weight: bold; color: #333333; font-size: 15px; padding:0px;margin-left: 30px;">
						<li>위치</li>
						<li>근무자</li>
						<li>내용</li>
						<li>이미지</li>
				</ul>
				<ul style="list-style: none; padding: 0px; margin-left: 35px; font-size: 15px;">
					
					<li style="color: #777777;">${locationinput}</li>
					<li style="color: #777777;">${text}</li>
					<li style="color: #777777;">${worktitle} - ${workcontent}</li>
					
				</ul>
                `
	
	
}

	const btn = document.querySelector("#btninsert");
	btn.onclick = () => {
		console.log("idx"+idx);
	
		const number = "username" + idx;
	
		const docu = document.getElementById(number);
		const text = docu.innerText;
		console.log(text);
		
		let worktitle = $("#worktitle").val();
		let workcontent = $("#workcontent").val();
		let selectedFileName3 = $("#selectedFileName3").val();
		
		
		let locationinput = $("#locationinput").val();
		
		if(locationinput == "") {
			locationinput = "-";
		}
		
		
		
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
	
		var formData = new FormData(document.getElementById('createWork'));
			formData.append('work_location', locationinput);
			formData.append('work_name', worktitle);
			formData.append('work_nameimg', selectedFileName3);
			formData.append('work_content', workcontent);
			formData.append('work_status', 1);
			formData.append('work_user_index', idx);
		
		
		
	
			$.ajax({
        			async: false,
        			type: "post",
        			url: $("#context").text()+'/createWork',
        			data: formData,
        			contentType: false, // 필수
        			processData: false, // 필수
        			beforeSend: function(xhr) {
        			xhr.setRequestHeader(header, token);
        			},
        			success: (response) => {
        				
        					console.log("성공" + response);
        					location.href =$("#context").text()+"/workStatus_main";
        			},
        					error: (error) => {
        					console.log("실패" + error);
        				}
        		});
	}


/*  // 체크박스 상태 변경 시 이벤트 리스너를 추가합니다.
  checkbox.addEventListener("change", function() {
      if (checkbox.checked) {
          // 체크박스가 체크되었을 때 폼을 표시합니다.
          workAssignForm.style.display = "flex";
          workAssignForm.style.margin="0 0 20px 260px";
      } else {
          // 체크박스가 해제되었을 때 폼을 숨깁니다.
          workAssignForm.style.display = "none";
      }
  });*/