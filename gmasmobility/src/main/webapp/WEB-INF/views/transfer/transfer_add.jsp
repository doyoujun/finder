<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<%@ include file="../include/head.jsp"%>


<!--start wrapper-->
<div class="wrapper">
	<%@ include file="../include/navbar.jsp"%>
	<%@ include file="../include/sidebar.jsp"%>

	<main class="page-content">
		<!--breadcrumb-->
		<div class="breadcrumb-title pe-3 mb-3">
			<b> <img
				src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png"
				class="page-icon" alt=""> 이체관리
			</b>
		</div>
		<div class="page-content-inside">
			<div class="page-breadcrumb mb-3">
				<div class="sub-contents">
					<div class="">
						<p class="pointColor"><b>이체등록</b></p>
						<form
							action="${pageContext.request.contextPath}/userInsert?${_csrf.parameterName}=${_csrf.token}"
							id="userInsertForm" name="userInsertForm" method="post" class="width60"
							enctype="multipart/form-data">

							<div class="row mt-40">
								<div class="col-12">
									<input id="club_information_position1" class="form-control btn-radius"
										type="text" style="width: 100%; border: 1px solid #ddd;"
										name="club_information_position" placeholder="노선 번호 입력">
									<input type="hidden" id="line_idx" name="line_idx" value="${line_idx}" />
									<input type="hidden" id="line_idx" name="line_idx" value="${price}" />
								</div>
							</div>

							<div class="row mt-3">	
								<div class="col-12">
									<input id="club_information_position2" class="form-control btn-radius"
										type="text" style="width: 100%; border: 1px solid #ddd;"
										name="club_information_position" placeholder="입금 승객 아이디 입력">
								</div>
							</div>

							<div class="row mt-4">
								<div class="col-12 btn-bottom text-right">
									<button class="btn-point width100 btn-radius" type="button"
										onclick="userAdd_vail()">등록</button>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="memoModal" tabindex="-1"
			aria-labelledby="loginModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header"></div>
					<div class="modal-body text-center" id="memoModalBody">
						어떠 어떠한 이유로 운행을 못하게 되었습니다.<br> 중단 신청 합니다~
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary width100 btn-radius"
							data-bs-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
		<!--end breadcrumb-->
	</main>
</div>

<%@ include file="../include/footer.jsp"%>
<script>
	function openModal(idx) {
		var show_text = "";

		$("#memoModalBody").html("idx");
		//$("#memoModal").show();
		$("#memoModal").modal("show"); // 모달 팝업 열기

	}
	jQuery(document).ready(
			function() {
				var table = $('#userlist').DataTable({
					lengthChange : false,
					searching : false,
					dom : 'Bfrtip',
					buttons : [ {
						extend : 'csv',
						charset : 'UTF-8',
						bom : true,
						text : "CSV 다운로드"
					} ],
					language : lang_kor
				});

				table.buttons().container().appendTo(
						'#userlist_wrapper .col-sm-6:eq(0)');
			});
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/transfer.js"></script>