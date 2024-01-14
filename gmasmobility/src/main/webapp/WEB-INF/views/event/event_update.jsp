<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/head.jsp"%>


<!--start wrapper-->
<div class="wrapper">
	<%@ include file="../include/navbar.jsp"%>
	<%@ include file="../include/sidebar.jsp"%>
	
	<main class="page-content">
		<!--breadcrumb-->
		<div class="breadcrumb-title pe-3 mb-3">
			<b>
				<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="page-icon" alt="">
				이벤트
			</b>
		</div>
		<div class="page-content-inside">
			<div class="page-breadcrumb mb-3">
				<div class="sub-contents">
					<div class="">
						<form
							action="${pageContext.request.contextPath}/eventUpdate?${_csrf.parameterName}=${_csrf.token}"
							id="eventForm" name="eventForm" method="post" class=""
							enctype="multipart/form-data">

							<div class="row mt-40">
								<div class="col-12">
									<label class="pointColor"><b>제목</b></label>
									<input id="event_title" class="form-control btn-radius"
										type="text" style="width: 100%; border: 1px solid #ddd;"
										name="event_title" placeholder="제목을 입력해주세요." value="${eventDetail[0].event_title}">
								</div>
							</div>
							
							<div class="row mt-40">
								<div class="col-12 ">
									<label class="pointColor"><b>기간</b></label>
									<div class="d-flex width100">
										<div class="posi-r width50">
											<input type="text" class="form-control datepicker btn-radius posi-r" name="event_s" value="${eventDetail[0].event_s}" />
										</div>
										~
										<div class="posi-r width50">
											<input type="text" class="form-control datepicker btn-radius posi-r" name="event_e" value="${eventDetail[0].event_e}"/>
										</div>
									</div>
								</div>
							</div>

							<div class="row mt-3">	
								<div class="col-12">
									<label class="pointColor"><b>내용</b></label>
									<div>
										<textarea rows="10" cols="20" name="event_description" class="form-control">${eventDetail[0].event_description}</textarea>
									</div>
								</div>
							</div>
							
							<div class="row mt-3">	
								<div class="col-12">
									<label class="pointColor"><b>대표 이미지</b></label>
									
									<div class="filebox user_img">
										<label for="image">
											<div id="image_container">
												<img src="http://codebrosdev.cafe24.com:8080/media/shuttleking/event/${eventDetail[0].event_img_url}" class="page-icon" alt="">
											</div>
										</label> 
										<input type="hidden" name="event_img_url" value="${eventDetail[0].event_img_url}">
										<input type="file" style="display: none;" id="image" name="file" accept="image/jpeg, image/png" onchange="setThumbnail(event);">
										<button type="button" class="mt-3" id="deleteButton" onclick="imageUpload();">이미지 변경</button> 
									</div>
									 
								</div>
							</div>
							
							

							<div class="row mt-5">
								<div class="col-12 btn-bottom text-center">
									<input type="hidden" name="event_idx" value="${eventDetail[0].event_idx}">
									<button class="btn-point btn-radius" type="button"
										onclick="vaildate()">수정</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<!--end breadcrumb-->
	</main>
</div>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <%@ include file="../include/footer.jsp"%>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  function vaildate() {
	    var title = document.forms["eventForm"]["event_title"].value;
	    var description = document.forms["eventForm"]["event_description"].value;
	    var date_s = document.forms["eventForm"]["event_s"].value;
	    var date_e = document.forms["eventForm"]["event_e"].value;
	    var date_img = document.forms["eventForm"]["event_img_url"].value;
	    var date_img_new = document.forms["eventForm"]["file"].value;
	    if (title.trim() === ""){
	    	alert("제목을 입력하세요.");
	    }
	    if (description.trim() === ""){
	    	alert("내용을 입력하세요.");
	    }
	    if (date_s.trim() === ""){
	    	alert("시작 시간을 입력하세요.");
	    }
	    if (date_e.trim() === ""){
	    	alert("시작 시간을 입력하세요.");
	    }
	    if (date_img.trim() === "" && date_img_new.trim()){
	    	alert("썸네일을 입력하세요.");
	    }
	    
	    if (title.trim() != "" && description.trim() != "" && date_s.trim() != "" && date_e.trim() != "") {
	    	 document.forms["eventForm"].submit();
	    } 
	}
  $( function() {
    $( ".datepicker" ).datepicker({
      showOn: "button",
      buttonImage: "${pageContext.request.contextPath}/resources/assets/img/icon_calendar.png",
      buttonImageOnly: true
    });
  } );
  function imageUpload() {
      var imageInput = document.getElementById("image");
      var deleteButton = document.getElementById("deleteButton");

      if (imageInput.style.display === "none") {
          // Image input is hidden, show it
          document.getElementById("image_container").innerHTML ="";
          imageInput.style.display = "block";
          /* deleteButton.innerHTML = "취소"; */
      } else {
          // Image input is visible, hide it
          imageInput.style.display = "none";
          deleteButton.innerHTML = "이미지 삭제";
      }
  }
  function setThumbnail(event) {
		const input = event.target;
	    const fileName = input.value;
	    
	    if (fileName) {
	        const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

	        if (!allowedExtensions.exec(fileName)) {
	            alert('이미지 파일은 .jpg, .jpeg, .png 형식이어야 합니다.');
	            input.value = ''; // 파일 선택 해제
	            return false;
	        }else{
				$('#image_container').empty();
				var reader = new FileReader();
				reader.onload = function(event) {
					var img = document.createElement("img");
					img.setAttribute("src", event.target.result);
					img.classList.add("thumImg");
					document.querySelector("div#image_container").appendChild(img);
				};
				reader.readAsDataURL(event.target.files[0]);
			}
	    }
	    
		
	}
  </script>