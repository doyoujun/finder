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
	
	<main class="page-content">
		<!--breadcrumb-->
		<div class="page-breadcrumb mb-3">
			<div class="breadcrumb-title pe-3 mb-3">
				<b>
					<img src="${pageContext.request.contextPath}/resources/assets/img/icon09.png" class="page-icon" alt="">
					클럽회원관리
				</b>
			</div>
			<div class="sub-contents">
				<div class="table-responsive">
					<table id="example" class="table table-striped text-center vertical-mid" style="width:100%">
						<thead>
							<tr>
								<th>번호</th>
								<th>사진</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>직책</th>
								<th>직장</th>
								<th>추천인</th>
								<th>입회일</th>
							</tr>
						</thead>
						<tbody>
							
							<%
								for(int i=0;i<50;i++){
							%>
							<tr onclick="location.href='${pageContext.request.contextPath}/userdetail/1'">
								<td>1</td>
								<td>
									<img src="${pageContext.request.contextPath}/resources/assets/img/img02.png" class="page-icon" alt="">
								</td>
								<td>홍길동</td>
								<td>123123123</td>
								<td>정보기술위원장</td>
								<td>라온소프트</td>
								<td>고길동</td>
								<td>2011/04/25</td>
							</tr>
							<%		
								}
							%>
								
						</tbody>
						<tfoot class="posi-rel">
							<tr>
								<td colspan="8" class="text-right bor-b-n pd-n" style="background:transparent !important">
									<button class="btn-point btn-ab-right">신규등록</button>
								</td>
							</tr>
						</tfoot>
					</table>
					
				</div>
			</div>
		</div>
		<!--end breadcrumb-->
	</main>
</div>

<%@ include file="../include/footer.jsp"%>
