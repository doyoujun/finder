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
  <h3 style="text-align: center; font-weight: bold;margin-bottom: 40px;">장비 / 차량관리 상세</h3>
		
       <!--start content-->    
       			 	<c:if test="${empty details[0].vehicle_img}">		
  					<div style="display: flex; margin-bottom: 10px;">
                       	<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/img_02.png" style="width: 617px; height: 389px; border-radius: 8px; margin: auto">
                    </div>
                    </c:if>	
                    <c:if test="${not empty details[0].vehicle_img}">
                    <div style="display: flex; margin-bottom: 10px;">
                       	<img alt="" src="http://codebrosdev.cafe24.com:8080/media/finder/vehicle/${details[0].vehicle_img}" style="width: 617px; height: 389px; border-radius: 8px; margin: auto">
                    </div>
                    </c:if>
                    <div style="display: flex;justify-content: center;">
                    <div class="info" style="display: flex;height: fit-content; width: 617px; ">
    					<ul style="font-weight: bold; color: #333333; font-size: 15px; padding:0px;">
    						<li>차량/장비명</li>
    						<li>차량번호</li>
    						<li>등록날짜</li>
    						<li>담당자</li>
    					</ul>
    					<ul style="list-style: none; padding: 0px; margin: 0px; font-size: 15px;">
    						<li style="margin-left: 0px;">${details[0].vehicle_name}</li>
    						<li style="margin-left: 0px;">${details[0].vehicle_num}</li>
    						<li style="margin-left: 0px;">${details[0].vehicle_inputdate}</li>
    						<li style="margin-left: 0px;">${details[0].vehicle_manager}</li>
    					</ul>
    				</div>
    				<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
    				</div> 
    				<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;">
    					<span id="closeModal1" class="close" onclick="deleteDetail(${details[0].vehicle_index})"><button class="btn" style="color: #003388; background-color:#fff;width:140px;height: 45px; border: 1px solid #003388; margin-right: 10px"> 삭제	</button></span> 
    					<span id="" class=""><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px;" onclick="location.href='${pageContext.request.contextPath}/vehicleEdit/${details[0].vehicle_index}'"> 수정	</button></span> 
    				</div>
  <!--end wrapper-->
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
    const liElement = document.getElementById('management'); // id로 li 엘리먼트 선택
    const title = document.getElementById('management1');
    const iconimg = document.getElementById('management2');
    liElement.style.background = '#D8E0EF'; // 원하는 스타일로 변경
    liElement.style.borderRadius = '10px'; // 원하는 스타일로 변경
    title.style.color="#003388";
    title.style.fontWeight ="bold";
    iconimg.src ="${pageContext.request.contextPath}/resources/assets/img/icon_menu_04.png";
  }
  const dateData = document.getElementById("datedata");
  const weekData = document.getElementById("weekData");
  const monthData = document.getElementById("monthData");

  dateData.addEventListener("click", function() {
	  dateData.style.color = "#0088C3";
  });
  weekData.addEventListener("click", function() {
	  weekData.style.color = "#0088C3";
  });
  monthData.addEventListener("click", function() {
	  monthData.style.color = "#0088C3";
  });
  document.getElementById("icon").addEventListener("click", function() {
	    var dateInput = document.getElementById("custom-date-input");
	    if (dateInput.style.display === "none") {
	        dateInput.style.display = "block";
	    } else {
	        dateInput.style.display = "none";
	    }
	});

  var openModalworkerinfo = document.getElementById("openModalworkerinfo");  // 모달 열기 링크
  
  var workerinfoModal = document.getElementById("workerinfoModal");          // 모달 엘리먼트
  
  var closeModal51 = document.getElementById("closeModal51");        // 닫기 버튼

  
//모달 열기
  openModalworkerinfo.addEventListener("click", function() {
	  workerinfoModal.style.display = "block";
  });

  // 모달 닫기 (닫기 버튼을 클릭했을 때)
  closeModal51.addEventListener("click", function() {
	  workerinfoModal.style.display = "none";
  });

  // 모달 외부 클릭으로 닫기
  window.addEventListener("click", function(event) {
    if (event.target === workerinfoModal) {
    	workerinfoModal.style.display = "none";
    }
  });
	
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/managermentdetail.js"></script>