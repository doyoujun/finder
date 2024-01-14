<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--start top header-->
<header class="top-header">
	<nav class="navbar navbar-expand gap-3">
		<div class="mobile-toggle-icon fs-3 d-flex d-lg-none">
			<i class="bi bi-list"></i>
		</div>
		
		<div class="dropdown dropdown-user-setting">
			<a class=" " href="#"
				data-bs-toggle="">
				<div class="user-setting d-flex align-items-center gap-3">
					<!-- <img src="${pageContext.request.contextPath}/resources/assets/img/img01.png" class="user-img"
						alt=""> -->
					<div class="d-none d-sm-block">
						<!-- <p class="user-name mb-0">username</p> -->
						<p class="user-name mb-0" style="color:#333333; font-size: 18px;margin-right: 50px;"> <strong><c:out value="${username}"/></strong> 관리자님 반갑습니다.</p>
					</div>
					<div class="side_logout">
						<form action="/project/logout" method="POST">
							<button type="submit" class="ai-icon" style="border: none; background: none; padding: 0; margin: 0;">
								<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_logout.png" style="margin-right: 10px;width: 20px;height: 25px;">
								<span class="nav-text" style="color:#707070; font-size: 18px;">로그아웃</span>
							</button>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>	
					</div>
				</div>
			</a>
			<!-- <ul class="dropdown-menu dropdown-menu-end">
				<li><a class="dropdown-item" href="pages-user-profile.html">
						<div class="d-flex align-items-center">
							<div class="">
								<i class="bi bi-person-fill"></i>
							</div>
							<div class="ms-3">
								<span>Profile</span>
							</div>
						</div>
				</a></li>
				<li><a class="dropdown-item" href="#">
						<div class="d-flex align-items-center">
							<div class="">
								<i class="bi bi-gear-fill"></i>
							</div>
							<div class="ms-3">
								<span>Setting</span>
							</div>
						</div>
				</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item"
					href="authentication-signup-with-header-footer.html">
						<div class="d-flex align-items-center">
							<div class="">
								<i class="bi bi-lock-fill"></i>
							</div>
							<div class="ms-3">
								<span>Logout</span>
							</div>
						</div>
				</a></li>
			</ul> -->
		</div>
	</nav>
</header>
<!--end top header-->