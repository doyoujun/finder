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
							action="${pageContext.request.contextPath}/eventInsert?${_csrf.parameterName}=${_csrf.token}"
							id="eventForm" name="eventForm" method="post" class=""
							enctype="multipart/form-data">

							<div class="row mt-40">
								<div class="col-12">
									<label class="pointColor"><b>제목</b></label>
									<input id="event_title" class="form-control btn-radius"
										type="text" style="width: 100%; border: 1px solid #ddd;"
										name="event_title" placeholder="제목을 입력해주세요.">
								</div>
							</div>
							
							<div class="row mt-40">
								<div class="col-12 ">
									<label class="pointColor"><b>기간</b></label>
									<div class="d-flex width100">
										<div class="posi-r width50">
											<input type="text" class="form-control datepicker btn-radius posi-r" name="event_s" id="start_date"/>
										</div>
										~
										<div class="posi-r width50">
											<input type="text" class="form-control datepicker btn-radius posi-r" name="event_e" id="end_date"/>
										</div>
									</div>
								</div>
							</div>

							<div class="row mt-3">	
								<div class="col-12">
									<label class="pointColor"><b>내용</b></label>
									<div>
										<textarea rows="10" cols="20" name="event_description" class="form-control"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row mt-3">	
								<div class="col-12">
									<label class="pointColor"><b>대표 이미지</b></label>
									<div class="filebox ">
										<input class="form-control" type="file" id="formFile" name="file"  accept="image/jpeg, image/png">
									</div>
									 
								</div>
							</div>
							
							

							<div class="row mt-5">
								<div class="col-12 btn-bottom text-center">
									<button class="btn-point btn-radius" type="button"
										onclick="vaildate()">등록</button>
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
	    var date_img = document.forms["eventForm"]["file"].value;
		
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
	    if (date_img.trim() === ""){
	    	alert("썸네일을 입력하세요.");
	    }
	    
	    if (title.trim() != "" && description.trim() != "" && date_s.trim() != "" && date_e.trim() != "" && date_img.trim() != "") {
	    	 document.forms["eventForm"].submit();
	    } 
	}
  $( function() {
	  var startDatepicker = $( "#start_date" );
      var endDatepicker = $( "#end_date" );

      startDatepicker.datepicker({
    	  showOn: "both",
    	  changeMonth:true,
          changeYear:true,
    	  closeText: "닫기",
    	    currentText: "오늘",
    	    prevText: '이전 달',
    	    nextText: '다음 달',
    	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	    weekHeader: "주",
    	    yearSuffix: '년',
          buttonImage: "${pageContext.request.contextPath}/resources/assets/img/icon_calendar.png",
          buttonImageOnly: true,
          dateFormat: 'yy-mm-dd',
          minDate: 0, // Disable selection of dates before today
          onSelect: function(selectedDate) {
              // Set the minDate of the end datepicker to the selected date of the start datepicker
              endDatepicker.datepicker("option", "minDate", selectedDate);
          }
      });

      endDatepicker.datepicker({
    	  showOn: "both",
    	  changeMonth:true,
          changeYear:true,
    	  closeText: "닫기",
  	    currentText: "오늘",
  	    prevText: '이전 달',
  	    nextText: '다음 달',
  	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
  	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
  	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
  	    weekHeader: "주",
  	    yearSuffix: '년',
          buttonImage: "${pageContext.request.contextPath}/resources/assets/img/icon_calendar.png",
          buttonImageOnly: true,
          dateFormat: 'yy-mm-dd',
          minDate: 0 // Disable selection of dates before today
      });
  } );
  </script>