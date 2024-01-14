function validate() {
          var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식

          //회원가입시 Form에 입력 되는 변수
  	      var name = document.getElementById("name");
  	      var id = document.getElementById("id");
  	      var password = document.getElementById("password");
  	      var password_check = document.getElementById("password_check");
  	      var terminalname = document.getElementById("terminalname");
  	      var companycode = document.getElementById("companycode");
 
          if(name.value=="") {
              alert("관리자명을 입력해주세요.");
              name.focus();
              return false;
          }  
          if(id.value=="") {
              alert("아이디를 입력해주세요.");
              id.focus();
              return false;
          }  
          if(password.value=="") {
              alert("비밀번호를 입력해주세요.");
              password.focus();
              return false;
          } 
          if(password_check.value=="") {
              alert("비밀번호 확인란을 입력해주세요.");
              password_check.focus();
              return false;
          } 
          if(terminalname.value=="") {
              alert("터미널 명칭을 입력해주세요.");
              terminalname.focus();
              return false;
          } 
          if(companycode.value=="") {
              alert("기업코드를 입력해주세요.");
              companycode.focus();
              return false;
          } 
          console.log("예를 눌렸다.");
  	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');

	console.log("CSRF Token:", $("meta[name='_csrf']").attr('content'));

	console.log($("#id").val());

	let signupData = {
		enterprise_name: $("#name").val(),
		enterprise_id:$("#id").val(),
		enterprise_pw:$("#password").val(),
		enterprise_terminal:$("#terminalname").val(),
		enterprise_companycode:$("#companycode").val(),
		enterprise_role: "ROLE_ADMIN"
		
	}
	

	$.ajax({
	async: false,
	type: "post",
	url: $("#context").text()+'/enterpriseSignup',
	
	beforeSend: function(xhr) {
	xhr.setRequestHeader(header, token);
	},
	
	data: signupData,
	
	success: (response) => {
		console.log(response);
		location.replace("${pageContext.request.contextPath}");
		alert("회원가입 성공");
		
	},
	error: (error) => {
			if(error.status == 400) {
				   alert()
			   }else {
				   console.log("요청실패");
				   console.log(error.responseText);
			   }
		}
	
})
      }   
      function join1_btn(){
    	  var id = document.getElementById("id");
  	      var password = document.getElementById("password");
  	      var password_check = document.getElementById("password_check");
  		
  		var result = confirm('회원가입을 진행하시겠습니까?');
  		if(result){		
  			validate();
//  			if (companycode !== "기업코드다를때" ) {
			if(password_check.value!==""){
				
  			if (password.value!==password_check.value) {
            	    document.getElementById("input-error").textContent = "정보가 일치하지 않습니다.";
            	    document.getElementById("input-error").style.display = "flex"; // 에러 메시지 표시
            	  	document.getElementById("password_check").style.border = '1px solid red';
            	    //alert(password_check.value);
            	  } else {
            	    // 로그인이 성공하면 다음 작업을 수행
            	  }
			}
			else return false;
  			}	
  		}
      
    		
      //정규식을 사용할 시 사용하는 check 함수
      function check(re, what, message) {
          if(re.test(what.value)) {
              return true;
          }
          alert(message);
          what.value = "";
          what.focus();
          //return false;
      }

