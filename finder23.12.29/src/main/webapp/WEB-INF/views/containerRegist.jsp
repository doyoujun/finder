<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<%@ include file="include/head.jsp"%>
<%@ include file="include/navbar.jsp"%>
<%@ include file="include/sidebar.jsp"%>

  <!--start wrapper-->
  <div class="wrapper" style="margin: 100px 0px 0px 260px; padding: 45px 150px 24px 150px; background-color: #fff;">
  <h3 style="text-align: center; font-weight: bold; color: #231815;">컨테이너 등록하기</h3>
<div class="" style="margin-top:40px;">
				<div class="" style="display:flex; justify-content: center;">
					<!-- 토큰 삽입 -->					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
					<!-- 정보입력  -->
					
					<div direction="column" class="" style="background: #fff; width:800px;justify-content: center;" >
						<form method="POST" id="containerRegiform" name="containerRegiform" enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="sc-lcujXC bnKPcn" style="width: 72%; margin: 0 auto;">
								<div class=" ">
									<div class=" ">
										<div class="" style="color: #555555;">선박명 </div> 
										<div class="" style="margin-top: 5px; ">
											<input type="text" class="" id="shipname" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 100%; border: 1px solid #DDDDDD;" placeholder="선박명을 입력해주세요." name="shipname">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">선박이미지 </div>
										<div class="" style="margin-top: 5px;">
  											<input type="text" id="selectedFileName" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 77%; border: 1px solid #DDDDDD; margin-right: 5px;" readonly>
  											<input type="button" id="openfile" onclick=document.all.file.click(); class="btTextW" value="파일 찾기" style="width: 122px; height: 46px; border-radius: 5px; border: 0.67px solid #DDDDDD; background-color: #0088C3; color: #fff;">
  											<input type="file" name="file" id="file" style="display: none;">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">선박/대리점 </div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="id" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 100%;border: 1px solid #DDDDDD;" placeholder="선박/대리점을 입력해주세요." name="id">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">선박국적</div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="password" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 100%;border: 1px solid #DDDDDD;" placeholder="선박국적을 입력해주세요." name="password">
										</div>
									</div>
								</div>
								<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">선박종류 </div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="password_check" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 100%;border: 1px solid #DDDDDD;" placeholder="선박종류를 입력해주세요.">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">국제총톤수</div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="terminalname" style="padding: 0 20px; width: 77%;height: 46px; border-radius: 5px;border: 1px solid #DDDDDD;" placeholder="국제총톤수를 입력해주세요." name="terminalname">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">등록일 </div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="companycode" style="padding: 0 20px; height: 46px; width: 77%;border-radius: 5px;border: 1px solid #DDDDDD;" placeholder="등록일을 입력해주세요." name="companycode">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">출하일 </div>
										<div class="" style="margin-top: 5px;">
											<input type="text" id="outdate" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 77%;border: 1px solid #DDDDDD; margin-right: 5px;background-color:#F2F2F2;" readonly>
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">B/I / D/O </div>
										<div class="" style="margin-top: 5px;">
  											<input type="text" id="selectedFileName1" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 77%; border: 1px solid #DDDDDD; margin-right: 5px;" readonly>
  											<input type="button" id="openfile1" onclick=document.all.file1.click(); class="" value="파일 찾기" style="width: 122px; height: 46px; border-radius: 5px; border: 0.67px solid #DDDDDD; background-color: #0088C3; color: #fff;">
  											<input type="file" name="file2" id="file1" style="display: none;">
										</div>
									</div>
								</div>
							</div>
							<div class="">
								<span id="input-error" style="color: #D31616; display: none; justify-content: center; margin-top:20px;"></span>
							</div>
							<div class="" style="display: flex; margin-top: 55px; justify-content: center;">
								<button type="button" style=" cursor:pointer; margin: 0; font-size: 16px; border: none; color: #fff; width: 163px; height: 50px; background: #003388; border-radius: 12px;" color="#fff" id="join" type="button" onclick="containerRegist_btn(${enterpriseinfo})">등록하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
  </div>
<%@ include file="include/footer.jsp"%>
<style>


</style>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Bootstrap Datepicker CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
<!-- jQuery -->
<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Bootstrap Datepicker JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script>
window.onload = function() {
    const liElement = document.getElementById('container'); // id로 li 엘리먼트 선택
    const title = document.getElementById('container1');
    const iconimg = document.getElementById('container2');
    liElement.style.background = '#D8E0EF'; // 원하는 스타일로 변경
    liElement.style.borderRadius = '10px'; // 원하는 스타일로 변경
    title.style.color="#003388";
    title.style.fontWeight ="bold";
    iconimg.src ="${pageContext.request.contextPath}/resources/assets/img/icon_menu_01.png"
  }

const fileInput = document.getElementById('file');
const selectedFileName = document.getElementById('selectedFileName');
const fileInput1 = document.getElementById('file1');
const selectedFileName1 = document.getElementById('selectedFileName1');

fileInput.addEventListener('change', function() {
  if (fileInput.files.length > 0) {
    const selectedFile = fileInput.files[0];
    const selectedFileNameValue = selectedFile.name;
    selectedFileName.value = selectedFileNameValue; // 선택한 파일의 이름을 input에 출력
  } else {
    selectedFileName.value = ''; // 파일 선택을 취소한 경우 input을 비움
  }
});



fileInput1.addEventListener('change', function() {
   if (fileInput1.files.length > 0) {
    const selectedFile = fileInput1.files[0];
    const selectedFileNameValue = selectedFile.name;
    selectedFileName1.value = selectedFileNameValue; // 선택한 파일의 이름을 input에 출력
  } else {
    selectedFileName1.value = ''; // 파일 선택을 취소한 경우 input을 비움
  } 
});


</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/createcontainer.js"></script>