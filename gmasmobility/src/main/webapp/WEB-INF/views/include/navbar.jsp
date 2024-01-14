<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--start top header-->
<header class="top-header">
	<nav class="navbar navbar-expand gap-3">
		<div class="mobile-toggle-icon fs-3 d-flex d-lg-none">
			<i class="bi bi-list"></i>
		</div>
		
		<div class="dropdown dropdown-user-setting">
			<a class="dropdown-toggle dropdown-toggle-nocaret" href="#"
				data-bs-toggle="dropdown">
				<div class="user-setting d-flex align-items-center gap-3">
					
					<div class="d-none d-sm-block">
						<p class="user-name mb-0">${adminname}</p>
					</div>
				</div>
			</a>
			<ul class="dropdown-menu dropdown-menu-end" >
				<li><a class="dropdown-item" href="pages-user-profile.html" style="display:none;">
						<div class="d-flex align-items-center">
							<div class="">
								<i class="bi bi-person-fill"></i>
							</div>
							<div class="ms-3">
								<span>Profile</span>
							</div>
						</div>
				</a></li>
				<li><a class="dropdown-item" href="#" style="display:none;">
						<div class="d-flex align-items-center">
							<div class="">
								<i class="bi bi-gear-fill"></i>
							</div>
							<div class="ms-3">
								<span>Setting</span>
							</div>
						</div>
				</a></li>
				<li><a class="dropdown-item" href="index2.html" style="display:none;">
						<div class="d-flex align-items-center">
							<div class="">
								<i class="bi bi-speedometer"></i>
							</div>
							<div class="ms-3">
								<span>Dashboard</span>
							</div>
						</div>
				</a></li>
				<li><a class="dropdown-item" href="#" style="display:none;">
						<div class="d-flex align-items-center" >
							<div class="">
								<i class="bi bi-piggy-bank-fill"></i>
							</div>
							<div class="ms-3">
								<span>Earnings</span>
							</div>
						</div>
				</a></li>
				<li><a class="dropdown-item" href="#" style="display:none;">
						<div class="d-flex align-items-center">
							<div class="">
								<i class="bi bi-cloud-arrow-down-fill"></i>
							</div>
							<div class="ms-3">
								<span>Downloads</span>
							</div>
						</div>
				</a></li>
				<li><hr class="dropdown-divider"></li>
				
				<li><form action="/project/logout" method="POST">
					<a class="dropdown-item"
					href="authentication-signup-with-header-footer.html">
						<div class="d-flex align-items-center">
							<div class="">
								<i class="bi bi-lock-fill"></i>
							</div>
							<div class="ms-3">
								<span>Logout</span>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</a></form></li>
			</ul>
		</div>
	</nav>
</header>
<!--end top header-->