<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ include file="include/head.jsp"%>
<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}
body{
	background: url("${pageContext.request.contextPath}/resources/assets/img/bg.png") no-repeat;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="wrapper">
		<!--start content-->		
		<main class="authentication-content" style="position: absolute;top: 30%;left: 50%;transform: translate(-50%, 17%); width: 696px; height: 747px;">
						<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
						<div class="" style="justify-content: center;width: 100%;height: 90%;">
							<div class="col-lg-12" style="width:100%; height:100%;box-shadow: 0px 0px 5px 1px #00000029; background-color: #fff;border-radius: 10px;">
								<div class="text-center">
									<img src="${pageContext.request.contextPath}/resources/assets/img/logo.png" class="" alt="파인드이알로고" style="width: 179px; height: 72px;margin:110px auto 15px auto;">
								</div>
								<div class="card-body" style="padding:4rem;">
									<c:if test="${not empty error}">
										<div class="error">${error}</div>
									</c:if>
									<c:if test="${not empty msg}">
										<div class="msg">${msg}</div>
									</c:if>
									<form class="form-body" id="loginForm" name='loginForm' action="${pageContext.request.contextPath}/login" method='POST' >
										<div class="row g-3">
											<div class="col-12">
												<!-- <label for="inputEmailAddress" class="form-label">Email Address</label> -->
												<div class="ms-auto position-relative">
													<div class="position-absolute top-50 translate-middle-y search-icon px-3" >
														<iconify-icon icon="ant-design:user-outlined" width="20" height="20" style="color:#BEBEBE;"></iconify-icon>
													</div>
													<input type="text" class="form-control ps-5" id="id" placeholder="아이디" name='username' style="border-top-width: 0px;border-left-width: 0px;border-right-width: 0px; border-bottom: 1px solid #DDDDDD; border-radius: 0px;">
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												</div>
											</div>
											<div class="col-12" style="margin-top: 30px;">
												<!-- <label for="inputChoosePassword" class="form-label">Enter Password</label> -->
												<div class="ms-auto position-relative">
													<div class="position-absolute top-50 translate-middle-y search-icon px-3">
														<iconify-icon icon="ic:outline-lock" width="20" height="20" style="color:#BEBEBE;"></iconify-icon>
													</div>
													<input type="password" class="form-control ps-5" name='password' 
														id="password" placeholder="비밀번호" style="border-top-width: 0px;border-left-width: 0px;border-right-width: 0px; border-bottom: 1px solid #DDDDDD;border-radius: 0px;">
												</div>
											</div>
											<div class="">
												<span id="login-error" style="color: #D31616; display: none; justify-content: center; margin:-5px auto; "></span>
											</div>
											
											<div class="col-12">
												<div style="margin: 0px 20px;">
													<input type="checkbox" value=1 style="margin-top:15px;" style="color:#BEBEBE;"> <span style="color: #333333;">로그인 유지하기</span>
												</div>
											</div>
											<div class="col-12">
												<div class="d-grid">
													<button type="submit" id="loginbtn" class="radius-30" style=" background-color: #BEBEBE; border: none; color: #fff;">로그인</button><!-- onclick="login_btn()" -->
												</div>
											</div>
											<div class="col-12">
												<div class="d-grid">
													<button type="button" class="radius-30" style="border: 2px solid #003388; background-color: #fff; color: #003388;" onclick="location.href='${pageContext.request.contextPath}/join'">회원가입</button>
												</div>
											</div>
										</div>
											
									</form>
								
					</div>
				</div>
				<div class="col-12 text-center mt-5">
					<div style="width:auto; text-align: center; color:#003388; font: normal normal bold 18px/20px Pretendard;">(주)파인드이알</div>
				</div>
			</div>
		</main>
		<!--end page main-->
	</div>
</body>
<script type="text/javascript">
document.getElementById("id").addEventListener("input", checkInput);
document.getElementById("password").addEventListener("input", checkInput);
function checkInput() {
	  var idValue = document.getElementById("id").value;
	  var passwordValue = document.getElementById("password").value;
	  var loginBtn = document.getElementById("loginbtn");

	  if (idValue!=="" || passwordValue!=="") {
	    // 아이디와 비밀번호 입력되었을 때 버튼 색상 변경
	    loginBtn.style.backgroundColor = "#003388";
	  } else {
	    loginBtn.style.backgroundColor = "#BEBEBE";
	  }
	}

	function validate() {
		var id = document.getElementById("id");
		var password = document.getElementById("password");
	    
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
	    
	    //document.getElementById('loginForm').submit();
	}
	/*로그인*/
	function login_btn(){
		var id = document.getElementById("id");
	    var password = document.getElementById("password");
		
		var result = confirm('로그인하시겠습니까?');
		if(result){	
			validate();
			/* $.ajax({
	            url:  '${pageContext.request.contextPath}/idpwCheck',
	            type: 'GET',
	            data:{
	            	id : id,
	            	password : password
				},
	            dataType: 'json',
	            success: function(data) {
	                if (data.success) {
	                    // 로그인 성공 시
	                    window.location.href = "${pageContext.request.contextPath}/notification"; // 로그인 성공 후 이동할 페이지
	                } else {
	                    // 로그인 실패 시
	                    $("#login-error").text("아이디 또는 비밀번호가 일치하지 않습니다.");
	                }
	            },
	            error: function(request, status, error) {
	            	alert("code: " + request.status)
	                alert("message: " + request.responseText)
	                alert("error: " + error);
	            }
	        }); */
			
		}
		
	}	
</script>
</html>