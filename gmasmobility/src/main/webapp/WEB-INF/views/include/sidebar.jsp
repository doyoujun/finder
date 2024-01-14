<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--start sidebar -->
<aside class="sidebar-wrapper" data-simplebar="true">
	<div class="sidebar-header ">
		<div class="width100 margin-auto text-center">
			<img src="${pageContext.request.contextPath}/resources/assets/img/logo_02.png" class="logo-icon" alt="logo">
		</div>
	</div>
	<!--navigation-->
	<ul class="metismenu" id="menu">
		<li>
			<a href="javascript:;" class="has-arrow">
				<div class="parent-icon">
					<i class="bi bi-grid-fill"></i>
				</div>
				<div class="menu-title">계정관리</div>
			</a>
			<ul>
				<li><a href="${pageContext.request.contextPath}/drivers">기사조회</a></li>
				<li><a href="${pageContext.request.contextPath}/user">승객조회</a></li>
			</ul>
		</li>
		<li>
			<a href="javascript:;" class="has-arrow">
				<div class="parent-icon">
					<i class="bi bi-droplet-fill"></i>
				</div>
				<div class="menu-title">노선관리</div>
			</a>
			<ul>
				<li><a href="${pageContext.request.contextPath}/userroute">승객노선</a></li>
				<li><a href="${pageContext.request.contextPath}/driversroute">기사노선</a></li>
			</ul>
		</li>
		<li>
			<a href="javascript:;" class="has-arrow">
				<div class="parent-icon">
					<i class="bi bi-basket2-fill"></i>
				</div>
				<div class="menu-title">이체관리</div>
			</a>
			<ul style="">
				<li><a href="${pageContext.request.contextPath}/transfer">이체관리</a></li>
			</ul>
		</li>
		<li>
			<a class="has-arrow" href="javascript:;" >
				<div class="parent-icon">
					<i class="bi bi-award-fill"></i>
				</div>
				<div class="menu-title">게시판관리</div>
			</a>
			<ul>
				<li><a href="${pageContext.request.contextPath}/notice">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/event">이벤트</a></li>
				<li><a href="${pageContext.request.contextPath}/contact">문의사항</a></li>
			</ul>
		</li>
	</ul>
	<!--end navigation-->
</aside>
<!--end sidebar -->