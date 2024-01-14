function optionChanged1(index) {
	
	
	const checkboxId = "progressModal" + index;
	const docu = document.getElementById(checkboxId);
	
        
        docu.style.display = 'block';
        
	}

function close1(idx) {
	
	const checkboxId = "progressModal" + idx;
	const docu = document.getElementById(checkboxId);
	
        
        docu.style.display = 'none';
}

