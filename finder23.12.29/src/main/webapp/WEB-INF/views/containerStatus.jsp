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
  <div class="wrapper" style="margin: 100px 0px 0px 300px; padding: 45px 150px 24px 150px; background-color: #fff;">
  <h3 style="text-align: center; font-weight: bold;">컨테이너 현황</h3>
		
       <!--start content-->
       				<div class="containermain" style="width:100%; height:513px; display: flex;justify-content: center;margin-top: 30px;">
       					<div id="map" style="width:1102px;height:462px;"></div>
       				</div>
       				<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
       				<div class="" style="margin-bottom: 35px; width:100%;">
    					<div class="" style="width:100%; display: flex;">
      						<div class="col-md-3" style="padding: 0px;">
								<div style="font-size: 18px; color: #333333;">청코드</div>
								<input type="text" style="width: 347px; height: 52px; border: 0.67px solid #DDDDDD; border-radius: 5px;" onkeyup="enterkeySearch()" id="search1" data-index="1">
							</div>
      						<div class="col-md-3" style="padding: 0px;">
								<div style="font-size: 18px; color: #333333;">등록연도</div>
								<input type="text" style="width: 347px; height: 52px; border: 0.67px solid #DDDDDD; border-radius: 5px;" onkeyup="enterkeySearch()" id="search2" data-index="2">
							</div>
      						<div class="col-md-3" style="padding: 0px;">
								<div style="font-size: 18px; color: #333333;">컨테이너명</div>
								<input type="text" style="width: 347px; height: 52px; border: 0.67px solid #DDDDDD; border-radius: 5px;" onkeyup="enterkeySearch()" id="search3" data-index="3">
								<div id="code" class="menu-title" style="display : none;"><c:out value="${enterprise}"/></div>
							</div>
      						
      						<div class="col-md-3" style="padding: 0px; width: 145px;display: flex;align-items: flex-end;"> 
      							<button style="background-color: #707070; color:#fff; border:none; border-radius: 10px; padding:10px 20px; width: 145px; height:51px;" onclick="searchPost()">검색</button>
      						</div>
    					</div>
  					</div>
  
  
                    <div class="d-flex align-items-stretch justify-content-between">
                      <div class="w-100">
                        <div style="display: flex;">
                        	<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="logo-icon" alt="" style="width: 41px; height: 25px;margin-right: 15px;">
                        	<span style="color: #333333; font-weight: bold; font-size: 20px">구역 컨테이너 정보</span>
                        </div>
                        <div style="display:flex;justify-content: center;">
                        	<table style="width: 100%;margin-top: 10px; border-top: 1px solid #DDDDDD; text-align: center;border-spacing: 0; margin-bottom:30px;"id="board-list">
                        		<thead style="background-color: #F8FAFF;">
                        			<tr>
                        				<th>선박명(이미지)</th>
                        				<th>선사/대리점</th>
                        				<th>선박국적</th>
                        				<th>선박종류</th>
                        				<th>국제총톤수</th>
                        				<th>등록일</th>
                        				<th>출하일(출하시간)</th>
                        				<th>B/I / D/O</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        		<c:if test="${empty containerList}">
   								<p>검색 결과를 찾을 수 없습니다.</p>
								</c:if>
								<c:if test="${not empty containerList}">
                        		<c:forEach items="${containerList}" var = "containerList" varStatus="status">
                        			<tr>
                        				<c:if test="${empty containerList.container_img}">
                        				<td> 이미지가 없습니다. <div style="margin-top: 10px;">${containerList.container_name}</div> </td>
                        				</c:if>
                        				<c:if test="${not empty containerList.container_img}">
                        				<td> <img alt="선박명(이미지)" src="http://codebrosdev.cafe24.com:8080/media/finder/container/${containerList.container_img}" id="openModalshipname${containerList.container_index}" onclick="looking (${containerList.container_index})" style="width:138px; hieght:87px"> <div style="margin-top: 10px;">${containerList.container_name}</div> </td>
                        				</c:if>
                        				<%-- <td> <img alt="선박명(이미지)" src="${pageContext.request.contextPath}/resources/assets/img/img_01.png" id="openModalshipname${containerList.container_index}" onclick="looking (${containerList.container_index})"> <div style="margin-top: 10px;">${containerList.container_name}</div> </td> --%>
                        				<td>${containerList.container_team}</td>
                        				<td>${containerList.container_nationality}</td>
                        				<td>${containerList.container_type}</td>
                        				<td>${containerList.container_IGT}</td>
                        				<td>${containerList.formatted_createtime}</td>
                        				<td>
                        					<div class="input-group mb-3">
                        						<div style="border:0.67px solid #DDDDDD; border-bottom-left-radius: 5px; border-top-left-radius: 5px; padding:8px; border-right: none;">
        											<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_calendar.png" id="openModalDate1">
        										</div>
    											<input type="text" class="form-control openModalDate" data-index="${containerList.container_index}" placeholder="${containerList.container_shippingdate}" id="openModalDates${containerList.container_index}" style="padding: 8px; border-left: none;" onclick="lookdate(${containerList.container_index})">
  											</div>
                        				</td>
                        				<td style="padding:7px;">
                        					<button class="btn" style="color: #fff; background-color:#0088C3;width:100px;" id="openModalBIDO" onclick="look(${containerList.container_index})"> 보기	</button>
                        				</td>
                        			</tr>
                        		</c:forEach>
                        		</c:if>	
                        		
                        		</tbody>
                        	</table>
                        	
  							<!-- 선박명(이미지) 모달 -->
  							<c:forEach items="${containerList}" var = "containerList" varStatus="status">
                        	<div id="shipnameModal${containerList.container_index}" class="modal">
  								<div class="modal-content" style="margin:9.5% auto;width: 663px; height: 580px;">
  									<div style="text-align: center;background-color: #F8F8F8;border-radius: 10px; padding: 20px;">
    									<div style=" font-weight: bolder; font-size: 15px;">${containerList.container_name}</div>
    								</div>
    								<div style="width: 90%; height:400px; margin: 20px auto;">
    								<c:if test="${empty containerList.container_img}">
    									이미지가 없습니다.
    								</c:if>
    								<c:if test="${not empty containerList.container_img}">
    									<img alt="선박 이미지" src="http://codebrosdev.cafe24.com:8080/media/finder/container/${containerList.container_img}" style="width: 100%; height:100%; border-radius: 10px; ">
    								</c:if>
    								</div>
									<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;">
    									<span id="closeModal11" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; " onclick="closedship(${containerList.container_index})"> 확인	</button></span> 
    								</div>
    							</div>
  							</div>
  							<!-- B/I / D/O 모달 -->
                        	<div id="BIDOModal${containerList.container_index}" class="modal">
  								<div class="modal-content" style="margin:3.5% auto;width: 663px; height: fit-content;">
    								
    								<div style="width: 100%; height:70%; margin: 20px auto;">
    								<c:if test="${not empty containerList.container_BIDOimg}">
    									<img alt="선박 이미지" src="http://codebrosdev.cafe24.com:8080/media/finder/BIDO/${containerList.container_BIDOimg}" style="width: 90%; height:100%; border-radius: 10px; margin: 0 auto; display: flex; ">
    								</c:if>
    								<c:if test="${empty containerList.container_BIDOimg}">
    									이미지가 없습니다.
    								</c:if>
    								</div>
    								
									<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;">
    									<span id="closeModal12" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; " onclick="closed(${containerList.container_index})"> 확인	</button></span> 
    								</div>
    							</div>
  							</div>
  							<!-- 출하일(출하시간) -->
  							<div id="dateModal${containerList.container_index}" class="modal">
  								<div class="modal-content" style="margin:3.5% auto;width:400px;">    								
    								<div style="text-align: center; display: flex;align-items: center; max-width: 95%;margin-left: 2%;padding:30px 20px;">
    									<img alt="이미지" src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" style="margin-right: 10px;">
    									<span style="font-weight: bold; color: #313133; font-size: 20px;">출하 날짜</span>
    									<span id="closeModal13${containerList.container_index}" class="close" style="color:#DDDDDD; font-size:40px; position: absolute; top: 5px; right: 25px;"data-index="${containerList.container_index}" onclick="closeddate(${containerList.container_index})">&times;</span> 
    								</div>
    								<div style="display: flex;justify-content: center;">
    									<div class="calender" style="box-shadow: 2px 2px 20px #0000001A; width: 349px; height:320px; border-radius: 10px;display: flex;padding: 10px;">
    										<div id="datepicker-container${containerList.container_index}" style="width: 100px; height: 100px;">
    											<input type="text" id="datepicker${containerList.container_index}" style="display: none;">
    											<div style="display : none;" id = "checkid">${CombinedList.urgent_report_index}</div>
    										</div>
	    								</div>
    								</div>								
    								<div style="padding: 20px; margin: 15px 0px;">
    									<img alt="이미지" src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" style="margin-right: 10px;">
    									<span style="font-weight: bold; color: #313133; font-size: 20px;">출하 시간</span>
    									
    									<div style="display: flex; margin-top: 20px;">
  											<select id="timezone${containerList.container_index}" class="select" onchange="timeChanged()" style="margin-right: 10px;">
                        						<option value="" selected disabled>오전/오후</option>
  												<option value="am">오전</option>
  												<option value="pm">오후</option>
											</select>
  										<input id="hour1${containerList.container_index}" maxlength="1" style="width: 41px; height: 44px; text-align:center;border: 0.67px solid #DDDDDD; border-radius: 8px;margin-right: 10px;">
  										<input id="hour2${containerList.container_index}" maxlength="1" style="width: 41px; height: 44px; text-align:center;border: 0.67px solid #DDDDDD; border-radius: 8px;margin-right: 10px;">
  										<span style="margin-right: 10px; display: flex;align-items: center;">시</span>
  										<input id="minute1${containerList.container_index}" maxlength="1" style="width: 41px; height: 44px; text-align:center;border: 0.67px solid #DDDDDD; border-radius: 8px;margin-right: 10px;">
  										<input id="minute2${containerList.container_index}" maxlength="1" style="width: 41px; height: 44px; text-align:center;border: 0.67px solid #DDDDDD; border-radius: 8px;margin-right: 10px;">
  										<span style="margin-right: 10px;display: flex;align-items: center;">분</span>
  										</div>
    								</div>
    								
									<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;">
    									<span id="closeModal14" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px;" onclick="registerDate(${containerList.container_index})"> 등록	</button></span> 
    								</div>
    							</div>
  							</div>
  							</c:forEach>
                        </div>
                        <button type="button" style="float:right; cursor:pointer; margin: 0; font-size: 16px; border: none; color: #fff; width: 163px; height: 50px; background: #003388; border-radius: 12px;" color="#fff" id="containerRegist" type="button" onclick="location.href='${pageContext.request.contextPath}/containerRegist'">컨테이너 등록</button>
                        
                      </div>
                    </div>
  <!--end wrapper-->
  </div>
<%@ include file="include/footer.jsp"%>
<style>
@media (min-width: 768px){
.col-md-3 {
    flex: 0 0 auto;
    width: 29.5%;
    }
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
    	const liElement = document.getElementById('container'); // id로 li 엘리먼트 선택
    	const title = document.getElementById('container1');
    	const iconimg = document.getElementById('container2');
    	liElement.style.background = '#D8E0EF'; // 원하는 스타일로 변경
    	liElement.style.borderRadius = '10px'; // 원하는 스타일로 변경
    	title.style.color="#003388";
    	title.style.fontWeight ="bold";
    	iconimg.src ="${pageContext.request.contextPath}/resources/assets/img/icon_menu_01.png"
  }
  
	var container = document.getElementById('map');
	var options = {
  		center: new kakao.maps.LatLng(35.105530, 129.084726),
  		level: 3,
	};

	var map = new kakao.maps.Map(container, options);
	map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);	//스카이뷰 지도 유형으로 설정
	
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
  
	
	

	
	
  

  window.addEventListener("click", function(event) {
    if (event.target === shipnameModal) {
    	shipnameModal.style.display = "none";
    }
  });
  window.addEventListener("click", function(event) {
    if (event.target === BIDOModal) {
    	BIDOModal.style.display = "none";
    }
  });
  window.addEventListener("click", function(event) {
    if (event.target === dateModal) {
    	dateModal.style.display = "none";
    }
  });
  
  
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/containerstatus.js"></script>