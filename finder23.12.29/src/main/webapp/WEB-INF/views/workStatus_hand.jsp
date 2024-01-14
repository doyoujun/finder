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
		<h3 style="text-align: center; font-weight: bold;margin-bottom: 40px;">업무 현황</h3>
       <!--start content-->       				
  					<div class="container" style="margin-bottom: 40px;">
    					<div class="row">
        					<div class="col-md-4" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/workStatus_main'">
            					<div class=" p-3" style=" width:395px; height:160px; display: flex; flex-direction: column; align-items: center; justify-content:center; border-radius: 10px; box-shadow: 0 0 20px #0000001A;"> 
            						<img alt="진행중 로고" src="${pageContext.request.contextPath}/resources/assets/img/icon_04.png" style="width: 45px; height: 40px; "> 
            						<div style="width: fit-content; height: 30px; color:#BEBEBE; text-decoration: underline; font-size: 25px;margin-top: 10px;font-weight: bold;">진행중</div>
            					</div>
        					</div>
        					<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
        					<div class="col-md-4" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/workStatus_complete'">
            					<div class=" p-3" style=" width:395px; height:160px; display: flex; flex-direction: column; align-items: center; justify-content:center; border-radius: 10px; box-shadow: 0 0 20px #0000001A;"> 
            						<img alt="완료 로고" src="${pageContext.request.contextPath}/resources/assets/img/icon_05.png" style="width: 45px; height: 40px;"> 
            						<div style="width: fit-content; height: 30px; color:#BEBEBE; text-decoration: underline; font-size: 25px;margin-top: 10px;font-weight: bold;">완료업무</div>
            					</div>
        					</div>
        					<div class="col-md-4" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/workStatus_hand'">
            					<div class=" p-3" style=" width:395px; height:160px; display: flex; flex-direction: column; align-items: center; justify-content:center; border-radius: 10px; box-shadow: 0 0 20px #0000001A;"> 
            						<img alt="업무하달 로고" src="${pageContext.request.contextPath}/resources/assets/img/icon_03.png" style="width: 45px; height: 40px;; "> 
            						<div style="width: fit-content; height: 30px; color:#0088C3; text-decoration: underline; font-size: 25px;margin-top: 10px;font-weight: bold;">업무하달</div>
            					</div>
        					</div>
    					</div>
					</div>
  
                    <div class="d-flex align-items-stretch justify-content-between">
                      <div class="w-100">
                      	<div style="display: flex;">
                        	<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="logo-icon" alt="" style="width: 41px; height: 24px;margin-right: 10px;">
                        	<span style="color: #333333; font-weight: bold; font-size: 20px">업무 정보입력</span>
                        </div>
                        
                        <div style="display: flex;">
                        	<div>
                        		<div style="background-color:#F2F4F9;width: 485px; height: 52px; border-radius: 26px;display: flex;align-items: center;margin: 20px auto 20px 47px"> 
                        			<span style="color:#0088C3; text-decoration: underline;margin-left: 30px;"  id="openModallocation"  onclick="relayout()">위치 
                        				<img alt="위치 이미지" src="${pageContext.request.contextPath}/resources/assets/img/icon_location_02.png"> 
                        			</span> 
                        			<input id="locationinput" style="border:none; color:#333333;font-size: 16px;background-color: #F2F4F9;margin-left: 30px;width: 77%;"> 
                        		</div>
                        	</div>
                        	<div  style="display: flex;align-items: center; margin-left: auto;">
                        		<input type="checkbox" class="custom-checkbox" id="checkDistance" value="1"> <label for="checkDistance" class="custom-label" style="margin-right: 10px;"></label>
								<span style="font-size: 16px; color:#333333;margin-right: 10px;" > 거리순으로 검색 </span>
								<input type="text" id="distanceSearch" style="width: 386px; height: 52px; border: 0.67px solid #DDDDDD;border-radius:5px; margin-right: 10px;">
								<button style="width:122px; height:52px; color: #fff; border: 0.67px solid #DDDDDD; border-radius: 5px; background-color: #707070;">근무자 검색</button>
                        	</div>
                        </div>
                        
                        <div style="display:flex;">
                        	<table style="width: 100%;margin-top: 10px; border-top: 1px solid #DDDDDD; text-align: center;border-spacing: 0; margin-bottom:30px;">
                        		<thead style="background-color: #F8FAFF;">
                        			<tr>
                        				<th>근무자명</th>
                        				<th>직책/담당업무</th>
                        				<th>업무현황</th>
                        				<th>거리</th>
                        				<th>선택</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        		<c:forEach items="${userList}" var = "userList" varStatus="status">
                        			<tr>
                        				<td id="username${userList.user_index}">${userList.user_name}</td>
                        				<td> ${userList.user_duty} </td>
                        				<c:if test="${userList.user_workstate == 1}">
                        				<td>근무중</td>
                        				</c:if>
                        				<c:if test="${userList.user_workstate == 2}">
                        				<td>업무진행중</td>
                        				</c:if>
                        				<c:if test="${userList.user_workstate == 0}">
                        				<td>휴일</td>
                        				</c:if>
                        				<td>2km</td>
                        				<td>
                        					<input type="checkbox" class="custom-checkbox" id="myCheckbox${userList.user_index}" onchange="optionChanged1(this, ${userList.user_index})">
											<label for="myCheckbox${userList.user_index}" class="custom-label"></label>
                        				</td>
                        			</tr>
                        		</c:forEach>	
                        		</tbody>
                        	</table>
                        </div>
                        
                      </div>
                    </div>
                    <!-- 위치 모달 -->
                    <div id="locationModal" class="modal">
  						<div class="modal-content" style="margin:8.5% auto;width: 1124px; height: 579px;">
  						
    						<div id="map" style="width:1101px;height:462px;margin:10px;"></div>
    						<div id="result" style="margin-left: 10px;"></div>
    						
    						<div class="" style="justify-content: center;display: flex;margin-bottom:12px;padding: 10px;">
    							<span id="closeModal41" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; "> 확인	</button></span> 
    						</div>
    						</div>
    					</div>
  					</div>
                    
                    <form method="POST" id="createWork" style="display: none;" name="createWork" enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="" style=" margin: 0 auto;">
								<div class=" ">
									<div class=" ">
										<div class="" style="color: #555555;" id="workname">업무명 <span style="color:red;">*</span></div> 
										<div class="" style="margin-top: 5px; ">
											<input class="" id="worktitle" style="padding:10px; width:724px; border-radius: 5px; border: 1px solid #DDDDDD;resize: none;" placeholder="" name="workcontent">
										</div>
									</div>
								</div>
								<div class=" "style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">업무내용 <span style="color:red;">*</span></div> 
										<div class="" style="margin-top: 5px; ">
											<textarea class="" id="workcontent" style="padding:10px; width:724px; height: 172px; border-radius: 5px; border: 1px solid #DDDDDD;resize: none;" placeholder="" name="workcontent"></textarea>
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">이미지 </div>
										<div class="" style="margin-top: 5px;">
  											<input type="text" id="selectedFileName3" style="padding: 0 20px; height: 52px; border-radius: 5px; width: 591px; border: 1px solid #DDDDDD; margin-right: 5px;" readonly>
  											<input type="button" id="openfile3" onclick=document.all.file3.click(); class="" value="파일 찾기" style="width: 122px; height: 52px; border-radius: 5px; border: 0.67px solid #DDDDDD; background-color: #0088C3; color: #fff;">
  											<input type="file" name="file" id="file3" style="display: none;">
										</div>
									</div>
								</div>
								<div class="" style="display: flex; margin-top: 55px; justify-content: center;">
									<button type="button" style=" cursor:pointer; margin: 0; font-size: 16px; border: none; color: #fff; width: 145px; height: 50px; background: #003388; border-radius: 12px;" color="#fff" id="openModalworkassign" type="button" >업무 하달하기</button>
								</div>
							</div>
						</form>
						<!-- 업무 하달하기 모달 -->
						<div id="assignModal" class="modal">
  						<div class="modal-content" style="margin:4.5% auto;width: 663px; height: 816px;">
    						<div style="text-align: center;background-color: #F8F8F8;border-radius: 10px; padding: 30px;height: 93px">
    							<div style=" font-weight: bolder; font-size: 20px;color: #333333;">업무 하달</div>
    						</div>
    						<div class="info" style="display: flex;height: 250px;margin-top: 10px;">
    							<ul style="font-weight: bold; color: #333333; font-size: 15px; padding:0px;margin-left: 30px;">
    								<li>위치</li>
    								<li>근무자</li>
    								<li>내용</li>
   									<li>이미지</li>
  								</ul>
  								<ul style="list-style: none; padding: 0px; margin-left: 35px; font-size: 15px;">
  									<li style="color: #777777;">A구역 D-2</li>
  									<li style="color: #777777;">김길동</li>
  									<li style="color: #777777;">현장관리</li>
  									<%-- <li style="color:#DDDDDD;" >
  										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/img_03.png">
  									</li> --%>
    							</ul>
    						</div>
    						<div style="display: flex;justify-content: center;">
    							<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/img_03.png">
    						</div>
    						
    						<div style="color:#D31616;font-size: 14px;display: flex;margin: 40px auto 15px auto;">위 내용으로 업무를 하달하시겠습니까?</div>
    						
    						<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;padding: 10px;">
    							<span id="closeModal42" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; "id="btninsert"> 확인</button></span>
    						</div>
    					</div>
  					</div>
                    
  <!--end wrapper-->
  </div>
<%@ include file="include/footer.jsp"%>
<style>
.custom-checkbox {
  display: none; /* 기본 체크박스 숨김 */
}

.custom-label {
  width: 17px; /* 이미지의 너비 */
  height: 17px; /* 이미지의 높이 */
 /* 체크되지 않은 상태 이미지 경로 설정 */
  background: url("${pageContext.request.contextPath}/resources/assets/img/icon_check_02.png") no-repeat;
  background-size: cover; /* 이미지 크기를 라벨에 맞춤 */
  cursor: pointer;
  display: inline-block;
}

.custom-checkbox:checked + .custom-label {
  background: url("${pageContext.request.contextPath}/resources/assets/img/icon_check_01.png") no-repeat; /* 체크된 상태 이미지 경로 설정 */
  background-size: cover; /* 이미지 크기를 라벨에 맞춤 */
}
.title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
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
    const liElement = document.getElementById('work'); // id로 li 엘리먼트 선택
    const title = document.getElementById('work1');
    const iconimg = document.getElementById('work2');
    liElement.style.background = '#D8E0EF'; // 원하는 스타일로 변경
    liElement.style.borderRadius = '10px'; // 원하는 스타일로 변경
    title.style.color="#003388";
    title.style.fontWeight ="bold";
    iconimg.src ="${pageContext.request.contextPath}/resources/assets/img/icon_menu_02.png";
  }

  
  
const fileInput3 = document.getElementById('file3');
const selectedFileName3 = document.getElementById('selectedFileName3');
fileInput3.addEventListener('change', function() {
	   if (fileInput3.files.length > 0) {
	    const selectedFile = fileInput3.files[0];
	    const selectedFileNameValue = selectedFile.name;
	    selectedFileName3.value = selectedFileNameValue; // 선택한 파일의 이름을 input에 출력
	  } else {
	    selectedFileName3.value = ''; // 파일 선택을 취소한 경우 input을 비움
	  } 
	});

  var openModallocation = document.getElementById("openModallocation");	//위치
  var openModalworkassign = document.getElementById("openModalworkassign");		//업무 하달하기 
  var locationModal = document.getElementById("locationModal");		//위치
  var assignModal = document.getElementById("assignModal");		//업무 하달하기
  
  var closeModal41 = document.getElementById("closeModal41");
  var closeModal42 = document.getElementById("closeModal42");

  openModallocation.addEventListener("click", function() {
	  locationModal.style.display = "block";
	  
	  //지도 불러오기
	  var container = document.getElementById('map');
	  var options = {
	  		center: new kakao.maps.LatLng(35.105530, 129.084726),
	  		level: 3,
	  };

	  var map = new kakao.maps.Map(container, options);
	  map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);	//스카이뷰 지도 유형으로 설정
	  
	// 지도를 클릭한 위치에 표출할 마커입니다
	  var marker = new kakao.maps.Marker({ 
	      // 지도 중심좌표에 마커를 생성합니다 
	      //position: map.getCenter() 
	  }); 
	  // 지도에 마커를 표시합니다
	  marker.setMap(map);
	  
	  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('result'); 
		    resultDiv.innerHTML = message;
		    locationinput.value = latlng.getLat() +',' +latlng.getLng()
		});
	// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
		    {
		        title: 'a', 
		        latlng: new kakao.maps.LatLng(35.105688, 129.084690)
		    },
		    {
		        title: 'b', 
		        latlng: new kakao.maps.LatLng(35.105422, 129.084095)
		    },
		    {
		        title: 'c', 
		        latlng: new kakao.maps.LatLng(35.106031, 129.086775)
		    },
		    {
		        title: 'd',
		        latlng: new kakao.maps.LatLng(35.105385, 129.086878)
		    }
		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "${pageContext.request.contextPath}/resources/assets/img/icon_location_01.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
	  
  });
  openModalworkassign.addEventListener("click", function() {
	  assignModal.style.display = "block";
  });

  closeModal41.addEventListener("click", function() {
	  locationModal.style.display = "none";
  });
  closeModal42.addEventListener("click", function() {
	  assignModal.style.display = "none";
  });

  window.addEventListener("click", function(event) {
    if (event.target === locationModal) {
    	locationModal.style.display = "none";
    }
  });
  window.addEventListener("click", function(event) {
    if (event.target === assignModal) {
    	assignModal.style.display = "none";
    }
  });
  

  
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/workstatus.js"></script>