<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom_style.css">

<!--start sidebar -->
<aside class="sidebar-wrapper" data-simplebar="true">
	<div class="sidebar-header">
		<div>
			<img src="${pageContext.request.contextPath}/resources/assets/img/logo.png" class="logo-icon"
				alt="파인드이알 로고" onclick="location.href='${pageContext.request.contextPath}/'" style="cursor: pointer;">
		</div>
	</div>
	<!--navigation-->
	<ul class="metismenu" id="menu">	
		<li style="margin: 10px;" id="container">
			<a onclick="goToContainerStatus()">
				<div class="parent-icon">
					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_menu_07.png" id="container2">
				</div>
				<div id="container1" class="menu-title" style="font-color:#707070;" >컨테이너 현황</div>
			</a>
		</li>
		<li style="margin: 10px;" id="work">
			<a onclick="goToworkStatus()">
				<div class="parent-icon">
					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_menu_08.png" id="work2">
				</div>
				<div id="work1" class="menu-title">업무 현황</div>
			</a>
		</li>
		<li style="margin: 10px;" id="yard">
			<a onclick="goToyardStatus()">
				<div class="parent-icon">
					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_menu_09.png" id="yard2">
				</div>
				<div id="yard1" class="menu-title">야드관리</div>
			</a>
		</li>
		<li style="margin: 10px;" id="management">
			<a onclick="goTomanagementStatus()">
				<div class="parent-icon">
					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_menu_10.png" id="management2">
				</div>
				<div id="management1" class="menu-title">근무자 / 장비관리</div>
			</a>
		</li>
		<li style="margin: 10px;" id="notice">
			<a onclick="goTonoticekStatus()">
				<div class="parent-icon">
					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_menu_11.png" id="notice2">
				</div>
				<div id="notice1" class="menu-title">공지사항</div>
			</a>
		</li>
		<li style="height:10px; width:300px; background-color:#fff;margin:20px 10px 10px 0; " ></li>
		<li style="margin:15px 10px 10px 10px" id="enterprise">
			<a onclick="goToEnterpriseStatus()">
				<div class="parent-icon">
					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_menu_12.png" id="enterprise2">
				</div>
				<div id="enterprise1" class="menu-title" >기업관리</div>
				<div id="code" class="menu-title" style="display : none;"><c:out value="${enterprise}"/></div>
			</a>
		</li>
	</ul>
	<div style="display: flex;justify-content: center;">
	<div style="width:auto; text-align: center; color:#003388; position: absolute; bottom: 10px;">(주)파인드이알</div>
	</div>
	<!--end navigation-->
</aside>
<!--end sidebar -->
<script type="text/javascript">

//컨테이너 현황 페이지로 이동하는 함수
function goToContainerStatus() {
  // 페이지 이동
  location.href = '${pageContext.request.contextPath}/containerStatus';
}
function goToworkStatus(){
  location.href = '${pageContext.request.contextPath}/workStatus_main';
}
function goToyardStatus(){
	location.href = '${pageContext.request.contextPath}/yard';
}
function goTomanagementStatus(){
	location.href = '${pageContext.request.contextPath}/workerequipmentManage';
}
function goTonoticekStatus(){
	location.href = '${pageContext.request.contextPath}/notice';
}
function goToEnterpriseStatus(){
	location.href = '${pageContext.request.contextPath}/enterpriseManage/${enterprise}';
}
</script>