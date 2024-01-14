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
		<div class="breadcrumb-title pe-3 mb-3">
			<b>
				<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="page-icon" alt="">
				이체관리
			</b>
		</div>
		<div class="page-content-inside">
			<div class="page-breadcrumb mb-3">
				<div class="text-right">
					<button type="button" class="btn btn-primary btn-radius pd-rl-40" onclick="location.href='${pageContext.request.contextPath}/transferAdd'"> 등록</button>
				</div>
				<div class="sub-contents">
					<div class="">
						<table id="example" class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th>노선 번호</th>
									<th>입금자명</th>
									<th>기사명</th>
									<th>입금등록일</th>
									<th>상세내역</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${accounttransfer}" var = "accounttransfer" varStatus="status">	
								<tr>
									<td>NO.${accounttransfer.line_idx}</td>
									<td class="underLine">${accounttransfer.account_name}</td>
									<td>${accounttransfer.driver_account_name}</td>
									<td>
										${accounttransfer.formatted_createtime}
									</td>
									<td>
										<button type="button" class="btn btn-primary pd-rl-40" onclick="openModal(${accounttransfer.line_operating_fee_idx})">보기</button>
									</td>
								</tr>
							</c:forEach>	
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
			<c:forEach items="${accounttransfer}" var = "accounttransfer" varStatus="status">
			<div class="modal fade" id="memoModal${accounttransfer.line_operating_fee_idx}" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center pd-b-n">
							<h5 class=" text-center margin-auto color-b">No.101</h5>
						</div>
						<div class="modal-body text-left" id="memoModalBody">
							<div class="border-top">
								<p class="pointColor mt-3"><b>입금자 정보</b></p>
								<div class="row">
									<div class="col-4 text-left">
										입금자명 : <span class="">${accounttransfer.account_name}</span>
									</div>
									<div class="col-4 text-left">
										입금자 아이디 : <span class="">${accounttransfer.account_id}</span>
									</div>
									<div class="col-4 text-left">
										입금자 날짜 : <span class="">${accounttransfer.line_operating_fee_date}</span>
									</div>
								</div>
								
								<div class="row">
									<div class="col-12 text-center d-flex vertical">
									    <img src="${pageContext.request.contextPath}/resources/assets/img/icon_start.png">
									    <span class="centered-text">${accounttransfer.line_location_address}</span>
									</div>
									<div class="col-12 text-center d-flex vertical">
									    <img src="${pageContext.request.contextPath}/resources/assets/img/icon_arrival.png">
									    <span class="centered-text">${accounttransfer.line_destination_address}</span>
									</div>
								</div>
								
								
								<p class="pointColor mt-5"><b>노선 기사 정보</b></p>
								<div class="row">
									<div class="col-4 text-left">
										기사명 : <span class="">${accounttransfer.driver_account_name}</span>
									</div>
									<div class="col-4 text-left">
										기사 아이디 : <span class="">${accounttransfer.driver_account_id}</span>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary width100 btn-radius" data-bs-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		<!--end breadcrumb-->
	</main>
</div>

<%@ include file="../include/footer.jsp"%>
<script>
	function openModal(idx) {
		var show_text = "";
		
		console.log(idx);
		
		var index = "memoModal" + idx;
		
		const showbox = document.getElementById(index);
		
		//$("#memoModalBody").html("idx");
		//$("#memoModal").show();
		$("#"+index).modal("show"); // 모달 팝업 열기
		
	}
    jQuery(document).ready(function() {
        var table = $('#userlist').DataTable({
            lengthChange: false,
            searching: false,
            dom: 'Bfrtip',
            buttons: [ { extend: 'csv', charset: 'UTF-8', bom: true, text:"CSV 다운로드" }],
            language : lang_kor
        } );
     
        table.buttons().container()
            .appendTo( '#userlist_wrapper .col-sm-6:eq(0)' );
    } );
</script>