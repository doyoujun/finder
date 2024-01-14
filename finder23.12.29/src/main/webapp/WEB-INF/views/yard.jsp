<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/head.jsp"%>
<%@ include file="include/navbar.jsp"%>
<%@ include file="include/sidebar.jsp"%>

  <!--start wrapper-->
  <div class="wrapper" style="height:924px; margin: 110px 0px 0px 300px; padding: 45px 150px 0px 150px; background-color: #fff;">
  <h3 style="text-align: center; font-weight: bold;">실시간 야드 현황</h3>
		
       <!--start content-->
       		<div class="containermain_image" style="width:100%; height:460px; display: flex;justify-content: center;margin :30px auto 100px auto;">
       			<div id="yardmap" style="width:1102px;height:462px;"></div>
       		</div>
       		<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
       		<!-- 실시간보고 모달 -->
            <div id="reportModal" class="modal">
  				<div class="modal-content" style="margin:4.5% auto;width: 571px;">
    				<div style="text-align: center;box-shadow:2px 2px 10px #0000001A; border-radius: 10px; display: flex;align-items: center;">    										
    					<div style="margin: 10px 20px;font-weight: bolder; font-size: 15px; color: #fff; background-color: #D31616; border-radius: 17px;width: 60px;height: 33px; display: flex;align-items: center;justify-content: center;"> <span>긴급</span></div>
    					<div style="margin: 10px 15px 10px 0;font-weight: bolder; font-size: 15px;">14:00</div>
    					<div style="font-weight: bolder; font-size: 15px;">김두팔 근무자 위치에서 사고발생</div>
    				</div>
    				
    				<div class="situation" >
    					<div style="display: flex;margin: 10px;">
    						<div id="modalmap" style="width:534px;height:273px;margin:10px;border-radius: 10px"></div>
    					</div>
    					<div style="background-color: #0088C30D;padding: 5px 20px;"> <span style="color:#0088C3;font-weight: bold;">위치</span> 2Z-2D </div>
    					<div style="margin: 11px 20px 0px 20px;"> 14:00 분 김두팔 근무자 위치에서 사고발생했습니다! 주의 요망 </div>
    					<img alt="사고난 현장 사진" src="${pageContext.request.contextPath}/resources/assets/img/img_04.png" style="width: 534px;height: 272px; max-width: 92%;  max-height: 100%;margin:20px; border-radius: 10px;">
    				</div>
    				<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;padding: 10px;">
    					<span id="closeModal1" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; "> 확인	</button></span> 
    				</div>
    			</div>
  			</div>
       		
       		<div style="display: flex;justify-content: center;margin-bottom: 8%;">
	        <div class="row" style="width: 1247px; height: 160px;">
              <div class="col-md-4" >
                <div class="card overflow-hidden radius-10">
                    <div class="card-body" style="background-color: #F0F0F0;">
                     <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                      <div class="w-100">
                        <p style="font-size: 20px; font-weight: bold;">근무자 수</p>
                        <div style="display:flex;justify-content: center;">
                        	<h4 class="" style="font-size:55px; color: #333333;">${working}</h4> 
                        	<span style="font-size:35px;color:#707070;margin:auto 10px;font-weight: bolder;"> 명</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
               </div>
               <div class="col-md-4" >
                <div class="card overflow-hidden radius-10">
                    <div class="card-body" style="background-color: #D316160D;">
                     <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                      <div class="w-100">
                        <p style="font-size: 20px; font-weight: bold;">위험요소</p>
                        <div style="display:flex;justify-content: center;">
                        	<h4 class="" style="font-size:55px; color: #D31616;">${urgentList}</h4>
                        	<span style="font-size:35px;color:#707070;margin:auto 10px;font-weight: bolder;"> 건</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
               </div>
               <div class="col-md-4" >
                <div class="card overflow-hidden radius-10">
                    <div class="card-body" style="background-color: #F0F0F0;">
                     <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                      <div class="w-100">
                        <p style="font-size: 20px; font-weight: bold;">진행업무</p>
                        <div style="display:flex;justify-content: center;">
                        	<h4 class="" style="font-size:55px; color: #333333;">${workList}</h4>
                        	<span style="font-size:35px;color:#707070;margin:auto 10px;font-weight: bolder;"> 건</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
               </div>
            </div><!--end row-->
  <!--end wrapper-->
  </div>
  </div>
<%@ include file="include/footer.jsp"%>
<style>


</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Bootstrap Datepicker CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Bootstrap Datepicker JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script>
window.onload = function() {
    const liElement = document.getElementById('yard'); // id로 li 엘리먼트 선택
    const title = document.getElementById('yard1');
    const iconimg = document.getElementById('yard2');
    liElement.style.background = '#D8E0EF'; // 원하는 스타일로 변경
    liElement.style.borderRadius = '10px'; // 원하는 스타일로 변경
    title.style.color="#003388";
    title.style.fontWeight ="bold";
    iconimg.src ="${pageContext.request.contextPath}/resources/assets/img/icon_menu_03.png";
  }

var container = document.getElementById('yardmap');
var options = {
		center: new kakao.maps.LatLng(35.105530, 129.084726),
		level: 3,
};

var map = new kakao.maps.Map(container, options);
map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);	//스카이뷰 지도 유형으로 설정

//마커를 생성합니다.
var markerPosition = new kakao.maps.LatLng(35.105294, 129.087254);
var marker = new kakao.maps.Marker({
  position: markerPosition,
  map: map,
});

// 인포윈도우를 생성하고 설정합니다.
var infowindow = new kakao.maps.InfoWindow({
  position: markerPosition,
  content: '<div style="display: flex;align-items: center;width:349px;height:48px;"><div style="margin: 8px 10px;font-weight: bolder; font-size: 13px; color: #fff; background-color: #D31616; border-radius: 17px;width: 48px;height: 27px; display: flex;align-items: center;justify-content: center;"> <span>긴급</span></div><div style="margin-right:7px;font-weight: bolder; font-size: 14px;">14:00</div><div id="openModalreport" style="font-weight: bolder; font-size: 14px;text-decoration:underline;">김두팔 근무자 위치에서 사고발생</div></div>',
});

// 인포윈도우를 지도에 표시합니다.
infowindow.open(map, marker);



  $(document).ready(function () {
      $("#showModal").on("click", function () {
          $("#modal").modal("show");
      });
  });
  
  $(document).ready(function() {
      // datepicker를 초기화하고 inline 모드로 설정
      $('#datepicker-container').datepicker({
          inline: true,
          format: 'yyyy-mm-dd',
          language: 'ko',
          todayHighlight: true,
          autoclose: true,
          onSelect: function(dateText, inst) {
              // dateText 값을 가져와서 출력
              alert(dataText);
              $('#selectedDateSpan').text(dateText);
          }
      });
  });
  
  $(document).ready(function() {
	    // Datepicker 초기화
	    $("#datepicker").datepicker();

	    // 날짜 선택 시 이벤트 핸들러
	    $("#datepicker").on("change", function() {
	        var selectedDate = $("#datepicker").val();
	        alert("선택한 날짜: " + selectedDate);
	    });
	});
  
  $(document).ready(function() {
	    $("#timezone").on("change", function() {
	        var selectedValue = $(this).val(); // 선택된 옵션의 값을 가져옵니다.
	        //alert('선택된 값: ' + selectedValue);
	        if(selectedValue==='am'){
	        	if(confirm('오전을 선택하시겠습니까?')){
	        		/* $.ajax({
	                    url: '${pageContext.request.contextPath}/timeSelect', 
	                    type: 'POST', 
	                    data: { decision: 1 },
	                    success: function(response) {
	                        alert('선택된 값: ' + decision);
	                        console.log(response);
	                    },
	                    error: function(xhr, status, error) {
	                        console.log(error);
	                    }
	                });  */
	        		alert('오전 선택완료.');
	        	}
	        }
	        else if(selectedValue==='pm'){
	        	if(confirm('오후를 선택하시겠습니까?')){
	        		/* $.ajax({
	                    url: '${pageContext.request.contextPath}/timeSelect', 
	                    type: 'POST', 
	                    data: { decision: 0 },
	                    success: function(response) {
	                        alert('선택된 값: ' + decision);
	                        console.log(response);
	                    },
	                    error: function(xhr, status, error) {
	                        console.log(error);
	                    }
	                }); */
	        		alert('오후 선택완료.');
	        	}
	        }
	    });
	});
  
  
  var openModalreport = document.getElementById("openModalreport");	//선박명(이미지)
  var reportModal = document.getElementById("reportModal");		//선박명(이미지)
  var closeModal1 = document.getElementById("closeModal1");

  openModalreport.addEventListener("click", function() {
	  reportModal.style.display = "block";
	//지도 불러오기
	  var container = document.getElementById('modalmap');
	  var options = {
	  		center: new kakao.maps.LatLng(35.105530, 129.084726),
	  		level: 2,
	  };

	  var map = new kakao.maps.Map(container, options);
	  map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);	//스카이뷰 지도 유형으로 설정
	  	
	  var content = '<div style="width: fit-content; height: fit-content;display: flex;flex-direction: column;align-items: center;"><div><img alt="" src="${pageContext.request.contextPath}/resources/assets/img/img_09.png" style="border-radius: 50px;border: 1px solid #03F133;margin-bottom: -5px;"></div><div style="width: 10px; height: 11px; background-color: #04DC4C; border-radius: 50px;position: relative;z-index: 99;"></div><div style="background-color: #fff; border-radius: 16px; width: 64px; height: 25px; box-shadow: 0px 0px 10px #00000029; display: flex;justify-content: center;align-items: center; margin-top: -3px; position: relative;z-index: 1;"><span style="font-weight: bold; font-size: 13px;color: #04DC4C">김두팔</span></div></div>';
	// 커스텀 오버레이가 표시될 위치
	  var position = new kakao.maps.LatLng(35.105530, 129.084726);  
	  
	  
	// 커스텀 오버레이를 생성합니다
	  var customOverlay = new kakao.maps.CustomOverlay({
	      position: position,
	      content: content   
	  });

	// 커스텀 오버레이를 지도에 표시합니다
	  customOverlay.setMap(map);
  });
  
  
  closeModal1.addEventListener("click", function() {
	  reportModal.style.display = "none";
  });

  window.addEventListener("click", function(event) {
    if (event.target === reportModal) {
    	reportModal.style.display = "none";
    }
  });
  
  
</script>