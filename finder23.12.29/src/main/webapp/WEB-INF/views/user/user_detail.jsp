<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/head.jsp"%>


<!--start wrapper-->
<div class="wrapper">
	<%@ include file="../include/navbar.jsp"%>
	<%@ include file="../include/sidebar.jsp"%>
	
	<main class="page-content bg-w">
		<!--breadcrumb-->
		<div class="page-breadcrumb mb-3">
			<div class="breadcrumb-title pe-3 mb-3">
				<b>
					<img src="${pageContext.request.contextPath}/resources/assets/img/icon09.png" class="page-icon" alt="">
					클럽회원관리
				</b>
			</div>
			<div class="sub-contents ">
				<div class="row">
					<div class="col-12 block-title">
						<img src="${pageContext.request.contextPath}/resources/assets/img/icon11.png" class="title-icon" alt="">
						<span><b>개인정보</b></span>
					</div>
					<div class="col-3 text-center">
						<img src="${pageContext.request.contextPath}/resources/assets/img/img03.png" class="user" alt="">
					</div>
					<div class="col-9">
						<div class="table-responsive user-info">
							<table class="width100">
								<tr>
									<th><span>이름(한글)</span></th>
									<td><span>홍길동</span></td>
								</tr>
								<tr>
									<th><span>이름(한문)</span></th>
									<td><span>홍길동</span></td>
								</tr>
								<tr>
									<th><span>이름(영어)</span></th>
									<td><span>홍길동</span></td>
								</tr>
								<tr>
									<th><span>입회일</span></th>
									<td><span>23.12.12</span></td>
								</tr>
								<tr>
									<th><span>생년월일</span></th>
									<td><span>1688.02.02</span></td>
								</tr>
								<tr>
									<th><span>주소</span></th>
									<td><span>홍길ㅁㄴㅇㅁㄴㅇㄴㅁㅁ동</span></td>
								</tr>
								<tr>
									<th><span>핸드폰</span></th>
									<td><span>010-123-4456</span></td>
								</tr>
								<tr>
									<th><span>자택</span></th>
									<td><span>051-12-4578</span></td>
								</tr>
								<tr>
									<th><span>회원번호</span></th>
									<td><span>12345678</span></td>
								</tr>
								<tr>
									<th><span>NS여부</span></th>
									<td><span>홍길동</span></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<div class="row mt-40">
					<div class="col-12 block-title">
						<img src="${pageContext.request.contextPath}/resources/assets/img/icon11.png" class="title-icon" alt="">
						<span><b>NS정보</b></span>
					</div>
					<div class="col-3 text-center">
						<img src="${pageContext.request.contextPath}/resources/assets/img/img03.png" class="user" alt="">
					</div>
					<div class="col-9">
						<div class="table-responsive user-info">
							<table class="width100">
								<tr>
									<th><span>이름(한글)</span></th>
									<td><span>홍길동</span></td>
								</tr>
								<tr>
									<th><span>핸드폰</span></th>
									<td><span>010-123-4456</span></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<div class="row mt-40">
					<div class="col-12 block-title">
						<img src="${pageContext.request.contextPath}/resources/assets/img/icon11.png" class="title-icon" alt="">
						<span><b>직장정보</b></span>
					</div>
					<div class="col-3 text-center">
						<img src="${pageContext.request.contextPath}/resources/assets/img/img04.png" class="user" alt="">
					</div>
					<div class="col-9">
						<div class="table-responsive user-info">
							<table class="width100">
								<tr>
									<th><span>업체명</span></th>
									<td><span>홍길동</span></td>
								</tr>
								<tr>
									<th><span>전화번호</span></th>
									<td><span>010-123-4456</span></td>
								</tr>
								<tr>
									<th><span>FAX번호</span></th>
									<td><span>010-123-4456</span></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<div class="row mt-40">
					<div class="col-12 block-title">
						<img src="${pageContext.request.contextPath}/resources/assets/img/icon11.png" class="title-icon" alt="">
						<span><b>클럽정보</b></span>
					</div>
					<div class="col-3 text-center">
						<img src="${pageContext.request.contextPath}/resources/assets/img/img05.png" class="user" alt="">
					</div>
					<div class="col-9">
						<div class="table-responsive user-info">
							<table class="width100">
								<tr>
									<th><span>클럽직위</span></th>
									<td><span>홍길동</span></td>
								</tr>
								<tr>
									<th><span>소속분과</span></th>
									<td><span>010-123-4456</span></td>
								</tr>
								<tr>
									<th><span>추천인</span></th>
									<td><span>010-123-4456</span></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<div class="row mt-40">
					<div class="col-3 offset-8 btn-bottom text-right">
						<button class="btn-point">수정</button>
						<button class="btn-default">목록</button>
					</div>
				</div>
			</div>
		</div>
		<!--end breadcrumb-->
	</main>
</div>

<%@ include file="../include/footer.jsp"%>
