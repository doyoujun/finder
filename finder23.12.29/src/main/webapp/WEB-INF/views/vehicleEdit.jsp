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
  <h3 style="text-align: center; font-weight: bold; color: #231815;">장비 / 차량수정</h3>
<div class="" style="margin-top:40px;">
				<div class="" style="display:flex; justify-content: center;">
					<!-- 토큰 삽입 -->					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
					<!-- 정보입력  -->
					<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
					<div direction="column" class="" style="background: #fff; width:800px;justify-content: center;" >
						<form method="POST" id="vehicleEditform" enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="sc-lcujXC bnKPcn" style="width: 724px; margin: 0 auto;">
								<img alt="" src="http://codebrosdev.cafe24.com:8080/media/finder/vehicle/${details[0].vehicle_img}" style="width: 617px; height: 389px;display: flex;margin: auto;" id="image">
							
								<div class=" ">
									<div class=" " style="margin-top: 50px;">
										<div class="" style="color: #555555;">차량/장비명 <span style="color:red;">*</span> </div> 
										<div class="" style="margin-top: 5px; ">
											<input type="text" class="" id="vequipname" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 724px; border: 1px solid #DDDDDD;" placeholder="ex)이동차량/덤프트럭" name="vequipname" value="${details[0].vehicle_name}">
										</div>
									</div>
								</div>
								
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">차량번호 <span style="color:red;">*</span> </div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="venumber" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 100%;border: 1px solid #DDDDDD;" placeholder="차량번호를 입력해주세요." name="venumber" value="${details[0].vehicle_num}">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">등록날짜 <span style="color:red;">*</span> </div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="vedate" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 100%;border: 1px solid #DDDDDD;" placeholder="등록날짜를 입력해주세요." name="vedate" value="${details[0].vehicle_inputdate}">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">담당자 </div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="vemanager" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 100%;border: 1px solid #DDDDDD;" placeholder="담당자를 입력해주세요." name="vemanager" value="${details[0].vehicle_manager}">
										</div>
									</div>
								</div>
								
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">차량이미지 <span style="color:red;">*</span> </div>
										<div class="" style="margin-top: 5px;">
  											<input type="text" id="selectedFileName4" style="padding: 0 20px; height: 46px; border-radius: 5px; width: 591px; border: 1px solid #DDDDDD; margin-right: 5px;"  readonly>
  											<input type="button" id="openfile4" onclick=document.all.file4.click(); class="btTextW" value="파일 찾기" style="width: 122px; height: 46px; border-radius: 5px; border: 0.67px solid #DDDDDD; background-color: #0088C3; color: #fff;">
  											<input type="file" name="file" id="file4" style="display: none;">
										</div>
									</div>
								</div>
							</div>
							<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;margin-top: 25px;">
    							<!-- <span id="closeModal1" class="close"><button class="btn" style="color: #003388; background-color:#fff;width:140px;height: 45px; border: 1px solid #003388; margin-right: 10px"> 삭제	</button></span> --> 
    							<span id="" class=""><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px;" onclick="vehicleEdit(${details[0].vehicle_index})" type="button"> 수정	</button></span> 
    						</div>
						</form>
					</div>
				</div>
			</div>
  </div>
<%@ include file="include/footer.jsp"%>
<style>
table{
	color:#707070;
}
tr{
	border-bottom: 1px solid #DDDDDD;
}
th{
	padding: 15px;
}
td{
	padding: 15px;
}
select{
	width:100px;
	height:35px;
	text-align: center;
}
.custom-select {
  position: relative;
  display: inline-block;
}

#dropdownButton1, #dropdownButton2 {
  width:100px;
  height:40px;
  cursor: pointer;
}

.dropdown-list1 {
  display: none;
  position: absolute;
  background-color: #fff;
  border: 1px solid #707070;
  list-style: none;
  padding: 0;
}
.dropdown-list2{
	display: none;
  position: absolute;
  background-color: #fff;
  border: 1px solid #707070;
  list-style: none;
  padding: 0;
}

.dropdown-list1,.dropdown-list2 li {
  width:95px;
  padding: 5px 19px;
}
.dropdown-list1,.dropdown-list2 li a {
  color:#707070;
}

.custom-select.active .dropdown-list1 {
  display: block;
}
.custom-select.active .dropdown-list2 {
	display: block;
}
.modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: #31313373;
}
.info ul li{
	margin:30px;
}
.modal-content {
  background-color: #fff;
  margin: 7% auto;
  width: 29%;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  position: relative;
}
.close:hover {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

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
    const liElement = document.getElementById('management'); // id로 li 엘리먼트 선택
    const title = document.getElementById('management1');
    const iconimg = document.getElementById('management2');
    liElement.style.background = '#D8E0EF'; // 원하는 스타일로 변경
    liElement.style.borderRadius = '10px'; // 원하는 스타일로 변경
    title.style.color="#003388";
    title.style.fontWeight ="bold";
    iconimg.src ="${pageContext.request.contextPath}/resources/assets/img/icon_menu_04.png";
  }
$(document).ready(function() {
    $("#image").on("click", function() {
        $("#fileInput").click();
    });

    $("#fileInput").on("change", function() {
        const imageElement = $("#image")[0];
        const fileInput = this.files[0];

        if (fileInput) {
            const reader = new FileReader();

            reader.onload = function(e) {
                imageElement.src = e.target.result;
            };

            reader.readAsDataURL(fileInput);
        }
    });
});

$(document).ready(function() {
    $("#file4").on("change", function() {
        const selectedFileName = $("#file4")[0].files[0].name;
        $("#selectedFileName4").val(selectedFileName);
		//alert(selectedFileName);
		
        // 이미지 표시
        const reader = new FileReader();
        reader.onload = function(e) {
            $("#image").attr("src", e.target.result);
        };
        reader.readAsDataURL(this.files[0]);
    });
});





/* const fileInput = document.getElementById('file');
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
}); */

function registration_btn() {
	var result = confirm('등록하시겠습니까?');
		if(result){		
			validate();	
		}
	
}

</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/vehicleedit.js"></script>