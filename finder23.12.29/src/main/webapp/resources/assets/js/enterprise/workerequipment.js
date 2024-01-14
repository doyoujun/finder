


function modal (index) {
	
	
  var modal1 = document.getElementById("infoModal" + index);

	  
	  modal1.style.display = "block";
  
}

function closed (idx) {
	var modal1 = document.getElementById("infoModal" + idx);
	
	
		
	  modal1.style.display = "none";
  
}

function worker() {
    var checkWorking = document.getElementById("checkWorking");
    var distanceSearch = document.getElementById("distanceSearch");
     var workersTable = document.getElementById("workersTable");


    if (checkWorking.checked) {
        // 근무중인 근로자만 검색할 때의 동작
        // 추가적인 로직을 여기에 추가.
        for (var i = 1; i < workersTable.rows.length; i++) {
            var workstateCell = workersTable.rows[i].cells[3]; // 근무 상태가 있는 열
            var displayStyle = workstateCell.innerText.trim() === "근무중" ? "" : "none";
            workersTable.rows[i].style.display = displayStyle;
        }
    } else {
        // 모든 사람들이 나오게 할 때의 동작
        // 추가적인 로직을 여기에 추가.
        for (var i = 1; i < workersTable.rows.length; i++) {
            workersTable.rows[i].style.display = "";
        }
    }
}