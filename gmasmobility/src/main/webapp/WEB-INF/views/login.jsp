<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ include file="include/head.jsp"%>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}
</style>
</head>
<body  class="loginbg">
	<div class="wrapper">
		<!--start content-->
		<main class="authentication-content">
			<div class="container-fluid">
				<div class="authentication-card">
					<div class="rounded-0 overflow-hidden">
						<div class="row g-0">
							<div class="col-lg-12">
								<div class="text-center">
									<img src="${pageContext.request.contextPath}/resources/assets/img/logo.png" class="img-fluid"
									alt="셔틀왕 로고">
								</div>
								<div class="card-body p-4 p-sm-5">
									<c:if test="${not empty error}">
										<div class="error">${error}</div>
									</c:if>
									<c:if test="${not empty msg}">
										<div class="msg">${msg}</div>
									</c:if>
									<form class="form-body" name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>
										<div class="row g-3">
											<div class="col-12">
												<!-- <label for="inputEmailAddress" class="form-label">Email Address</label> -->
												<div class="ms-auto position-relative">
													<div class="position-absolute top-50 translate-middle-y search-icon px-3">
														<i class="bi bi-person-fill"></i>
													</div>
													<input type="text" class="form-control radius-30 ps-5" id="admin_id" placeholder="아이디를 입력해주세요." name='admin_id'>
												</div>
											</div>
											<div class="col-12">
												<!-- <label for="inputChoosePassword" class="form-label">Enter Password</label> -->
												<div class="ms-auto position-relative">
													<div
														class="position-absolute top-50 translate-middle-y search-icon px-3">
														<i class="bi bi-lock-fill"></i>
													</div>
													<input type="password" class="form-control radius-30 ps-5" name='admin_pw' 
														id="admin_pw" placeholder="비밀번호를 입력해주세요.">
													<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												</div>
											</div>
											<div class="col-12">
												<div class="d-grid">
													<button type="submit" class="btn btn-primary radius-30" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
												</div>
											</div>
										</div>
									</form>
									<!-- Modal -->
									<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-body">
													로그인 정보가<br> 일치하지 않습니다.
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<!--end page main-->
	</div>
</body>
</html>