<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/head.jsp"%>
<%@ include file="include/navbar.jsp"%>
<%@ include file="include/sidebar.jsp"%>

  <!--start wrapper-->
  <div class="wrapper" style="margin: 100px 0px 0px 260px; padding: 45px 150px 24px 150px; background-color: #fff;">
  <h3 style="text-align: center; font-weight: bold;margin-bottom: 40px;">근무자 / 장비관리</h3>
		
       <!--start content-->      
       				<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
					<div style="margin-bottom: 50px;display: flex;">
                       	<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="logo-icon" alt="" style="width: 41px; height: 24px;margin-right: 15px;">
                       	<span style="color: #333333; font-weight: bold; font-size: 20px">근무자</span>
                   </div>  					
  					<div style="display: flex; margin-bottom: 10px;">
                        	<div style="display: flex; align-items: flex-end;">
                        		<div> 
                        			<span style="color: #333333; font-size: 16px;font-weight: bold;">전체 <span style="font-weight: normal;">${size}명  |</span></span>    
                        			<span style="color: #333333; font-size: 16px;font-weight: bold;">근무중 <span style="font-weight: normal;">${working}명</span> </span>    
                        		</div>
                        	</div>
                        	<div  style="display: flex;align-items: center; margin-left: auto;">
                        		<input type="checkbox" class="custom-checkbox" id="checkWorking" onchange="worker()"> <label for="checkWorking" class="custom-label" style="margin-right: 10px;"></label>
								<span style="font-size: 16px; color:#333333;margin-right: 10px;" >근무중인 근로자만 검색</span>
								<input type="text" id="distanceSearch" style="width: 386px; height: 52px; border: 0.67px solid #DDDDDD;border-radius:5px; margin-right: 10px;">
								<button style="width:122px; height:52px; color: #fff; border: 0.67px solid #DDDDDD; border-radius: 5px; background-color: #707070;">근무자 검색</button>
                        	</div>
                        </div>
  					
                    <div class="d-flex align-items-stretch justify-content-between">
                      <div class="w-100">
                        <div style="display:flex;justify-content: center;">
                        	<table style="width: 100%;margin-top: 10px; border-top: 1px solid #DDDDDD; text-align: center;border-spacing: 0; margin-bottom:30px; font-size: 18px;" id="workersTable">
                        		<thead style="background-color: #F8FAFF;">
                        			<tr>
                        				<th>근무자명</th>
                        				<th>직책 / 담당업무</th>
                        				<th>입사일</th>
                        				<th>근무현황</th>
                        				<th>상세보기</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        			<c:forEach items="${worker}" var = "worker">
                        			<tr>
                        				<td>${worker.user_name}</td>
                        				<td>${worker.user_duty}</td>
                        				<td>${worker.formatted_createtime}</td>
                        				<c:if test="${worker.user_workstate == 0}">
                        				<td>휴무</td>
                        				</c:if>
                        				<c:if test="${worker.user_workstate == 1}">
                        				<td>근무중</td>
                        				</c:if>
                        				<td style="padding:7px;">
                        					<button class="btn" style="color: #fff; background-color:#0088C3;width:100px;" id="openModalinfo1${worker.user_index}" data-index="${worker.user_index}" onclick ="modal(${worker.user_index})"> 정보보기	</button>
                        				</td>
                        			</tr>
                        			</c:forEach>	
                        		</tbody>
                        	</table>
  							<!-- 정보보기 모달 -->
  							<c:forEach items="${worker}" var = "worker">
                        	<div id="infoModal${worker.user_index}" class="modal" style=display:none;>
  								<div class="modal-content">
    									<div style="text-align: center;background-color: #F8F8F8;border-radius: 10px; padding: 20px 10px 10px 10px;">
    										<img src="${pageContext.request.contextPath}/resources/assets/img/img_09.png" class="logo-icon" alt="프로필 사진" style="width:60px;height:60px;border-radius: 50px;">
    										<div style="margin-top: 10px; font-weight: bold; font-size: 18px;">${worker.user_name}</div>
    									</div>
    									<div class="info" style="display: flex;justify-content: center;height: 450px;">
    										<ul style="font-weight: bold; color: #333333; font-size: 15px; padding:0px;">
    											<li>성명</li>
    											<li>소속</li>
    											<li>담당업무</li>
    											<li>담당차량</li>
    											<li>생년월일</li>
    											<li>주소</li>
    											<li>담당자 휴대폰번호</li>
    											<li>이메일</li>
    										</ul>
    										<ul style="list-style: none; padding: 0px; margin: 0px; font-size: 15px;">
    											<c:if test="${empty worker.user_name}">
    											<li style="margin-left: 0px;"> - </li>
    											</c:if>
    											<c:if test="${not empty worker.user_name}">
    											<li style="margin-left: 0px;">${worker.user_name}</li>
    											</c:if>
    											<c:if test="${empty worker.user_team}">
    											<li style="margin-left: 0px;"> - </li>
    											</c:if>
    											<c:if test="${not empty worker.user_team}">
    											<li style="margin-left: 0px;">${worker.user_team}</li>
    											</c:if>
    											<c:if test="${empty worker.user_duty}">
    											<li style="margin-left: 0px;"> - </li>
    											</c:if>
    											<c:if test="${not empty worker.user_duty}">
    											<li style="margin-left: 0px;">${worker.user_duty}</li>
    											</c:if>
    											<c:if test="${empty worker.user_vehicle}">
    											<li style="margin-left: 0px;color:#DDDDDD;" > 담당차량없음</li>
    											</c:if>
    											<c:if test="${not empty worker.user_vehicle}">
    											<li style="margin-left: 0px;color:#DDDDDD;" > ${worker.user_vehicle}</li>
    											</c:if>
    											<c:if test="${empty worker.user_birth}">
    											<li style="margin-left: 0px;"> - </li>
    											</c:if>
    											<c:if test="${not empty worker.user_birth}">
    											<li style="margin-left: 0px;">${worker.user_birth}</li>
    											</c:if>
    											<c:if test="${empty worker.user_address}">
    											<li style="margin-left: 0px;"> - </li>
    											</c:if>
    											<c:if test="${not empty worker.user_address}">
    											<li style="margin-left: 0px;">${worker.user_address} ${worker.user_daddress}</li>
    											</c:if>
    											<c:if test="${empty worker.user_managerphone}">
    											<li style="margin-left: 0px;"> - </li>
    											</c:if>
    											<c:if test="${not empty worker.user_managerphone}">
    											<li style="margin-left: 0px;">${worker.user_managerphone}</li>
    											</c:if>
    											<c:if test="${empty worker.user_email}">
    											<li style="margin-left: 0px;"> - </li>
    											</c:if>
    											<c:if test="${not empty worker.user_email}">
    											<li style="margin-left: 0px;">${worker.user_email}</li>
    											</c:if>
    										</ul>
    									</div>
    									<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;">
    										<span id="closeModal1${worker.user_index}" class="close" onclick="closed(${worker.user_index})"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; "> 확인	</button></span> 
    									</div>
    									<div class="" style="justify-content: center;display: none;margin-bottom: 25px;" id="info">
    										${worker.user_index}
    									</div>
    								</div>
  								</div>
  								</c:forEach>							
                        </div>
                      </div>
                    </div>
                    <button style="color: #0088C3; font-size: 16px; background-color: #fff;border: none;margin: auto;display: flex;margin-bottom: 40px;">더보기</button>
                    
                    <div style="margin-bottom: 50px;display: flex;">
                       	<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="logo-icon" alt="" style="width: 41px; height: 24px;margin-right: 15px;">
                       	<span style="color: #333333; font-weight: bold; font-size: 20px">장비 / 차량관리</span>
                   </div>
                    
                    <div class="d-flex align-items-stretch justify-content-between">
                      <div class="w-100">
                        <div style="display:flex;justify-content: center;">
                        	<table style="width: 100%;margin-top: 10px; border-top: 1px solid #DDDDDD; text-align: center;border-spacing: 0; margin-bottom:30px; font-size: 18px;">
                        		<thead style="background-color: #F8FAFF;">
                        			<tr>
                        				<th>차량/장비명</th>
                        				<th>차량번호</th>
                        				<th>등록날짜</th>
                        				<th>담당자</th>
                        				<th>상세보기</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        		<c:forEach items="${vehicle}" var = "vehicle">
                        			<tr>
                        				<td>${vehicle.vehicle_name}</td>
                        				<td>${vehicle.vehicle_num}</td>
                        				<td>${vehicle.formatted_createtime}</td>
                        				<td>${vehicle.vehicle_manager}</td>
                        				<td style="padding:7px;">
                        					<button class="btn" style="color: #fff; background-color:#0088C3;width:100px;height: 40px;" onclick="location.href='${pageContext.request.contextPath}/management_detail/${vehicle.vehicle_index}'"> 정보보기	</button>
                        				</td>
                        			</tr>
                        		</c:forEach>		
                        		</tbody>
                        	</table>						
                        </div>
                      </div>
                    </div>
                    <button style="color: #0088C3; font-size: 16px; background-color: #fff;border: none;margin: auto;display: flex;margin-bottom: 40px;">더보기</button>
                    <button type="button" style="float:right; cursor:pointer; margin: 0; font-size: 16px; border: none; color: #fff; width: 163px; height: 50px; background: #003388; border-radius: 12px;" color="#fff" id="vehicleRegist" onclick="location.href='${pageContext.request.contextPath}/vehicleRegist'">차량등록</button>
  <!--end wrapper-->
  </div>
<%@ include file="include/footer.jsp"%>
<style>
/* 기본 날짜 선택 아이콘 숨김 */
input[type="date"]::-webkit-calendar-picker-indicator {
    display: none;
}
/* 사용자 정의 아이콘 스타일 */
input[type="date"]::before {
    content: url('${pageContext.request.contextPath}/resources/assets/img/icon_calendar.png'); /* 사용자 정의 아이콘 이미지 경로 */
    position: absolute;
    right: 10px; /* 아이콘의 위치 조절 */
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
}
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
    const liElement = document.getElementById('management'); // id로 li 엘리먼트 선택
    const title = document.getElementById('management1');
    const iconimg = document.getElementById('management2');
    liElement.style.background = '#D8E0EF'; // 원하는 스타일로 변경
    liElement.style.borderRadius = '10px'; // 원하는 스타일로 변경
    title.style.color="#003388";
    title.style.fontWeight ="bold";
    iconimg.src ="${pageContext.request.contextPath}/resources/assets/img/icon_menu_04.png";
  }
  

  
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/workerequipment.js"></script>