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
					<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="page-icon" alt="">
					이벤트
				</b>
			</div>
			<div class="sub-contents ">
				<div class="row underline_point">
					<div class="col-6 text-left pd-l-n event-title">
						<b>${eventDetail[0].event_title}</b>
					</div>
					
					<div class="col-3 text-center pd-t-1">
						<b class="lightGrayColor">작성자</b>
						<span class="bold blackColor">관리자</span>
					</div>
					
					<div class="col-3 text-center pd-t-1">
						<b class="lightGrayColor">등록일</b>
						<span class="bold blackColor">${eventDetail[0].event_createtime}</span>
					</div>
				</div>
				
				<div class="row board-cotents">
					<div class="event-ctr">
						<span class="event-state event-end">종료</span>
						<span class="event-date">${eventDetail[0].event_s} ~ ${eventDetail[0].event_e}</span>
					</div>
					<div class="col-12 text-center event-img">
						<img class="thumImg" src="http://codebrosdev.cafe24.com:8080/media/shuttleking/event/${eventDetail[0].event_img_url}" class="user" alt="">
					</div>
					<div class="col-12">
						${eventDetail[0].event_description}
					</div>
				</div>
				
				<div class="page board-control">
					<ul>
						<li onclick="location.href='${pageContext.request.contextPath}/event/${eventBef[0].event_idx }'">
							<div class="d-flex vertical">
								<img src="/project/resources/assets/img/icon_arrow_01.png" class="arrow">
								<c:if test="${not empty eventBef[0].event_title}">
								    <span class="centered-text">${eventBef[0].event_title }</span>
								</c:if>
								<c:if test="${empty eventBef[0].event_title}">
								    <span class="centered-text">-</span>
								</c:if>	
							</div>
						</li>
						<li onclick="location.href='${pageContext.request.contextPath}/event/${eventAft[0].event_idx }'">
							<div class="d-flex vertical">
								<img src="/project/resources/assets/img/icon_arrow_02.png" class="arrow">
								<c:if test="${not empty eventAft[0].event_title}">
								    <span class="centered-text">${eventAft[0].event_title }</span>
								</c:if>
								<c:if test="${empty eventAft[0].event_title}">
								    <span class="centered-text">-</span>
								</c:if>
							</div>
						</li>
					</ul>
					
					<div class="text-right">
						<button class="btn mt-2 btn-bor-default btn-radius" type="button" onclick="delete_board(1)">
							<img src="/project/resources/assets/img/icon_03.png" class="arrow">
							삭제
						</button>
					</div>
					
					<div class="row mt-5">
						<div class="col-12 btn-bottom text-center">
							<button class="btn-bor-point btn-radius" type="button" onclick="location.href='${pageContext.request.contextPath}/eventEdit/${eventDetail[0].event_idx }'">수정</button>
							<button class="btn-point btn-radius" type="button" onclick="history.back()">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
			<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header text-center pd-b-n">
						</div>
						<div class="modal-body text-left" id="deleteModalBody">
							<div class="text-center">
								<p class="mt-3"><b>삭제하시겠습니까?</b></p>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary flex btn-radius" onclick="delete_board()">확인</button>
							<button type="button" class="btn btn-dark flex btn-radius" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		<!--end breadcrumb-->
	</main>
</div>

<%@ include file="../include/footer.jsp"%>


<script>
	var board_num = 0;
	function delete_board() {
		$.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath}/eventDelete?event_idx='+board_num,
			success : function(data) {
				alert("삭제 되었습니다.");
				location.href="${pageContext.request.contextPath}/event";
			}
		});
	}
	function delete_popup(idx) {
		var show_text = "";
		board_num = idx;
		//$("#memoModalBody").html("idx");
		//$("#memoModal").show();
		$("#deleteModal").modal("show"); // 모달 팝업 열기
	}
    jQuery(document).ready(function() {
        var table = $('#routelist').DataTable({
            lengthChange: false,
            dom: 'Bfrtip',
            buttons: [ { extend: 'csv', charset: 'UTF-8', bom: true, text:"CSV 다운로드" }],
            language : lang_kor
        } );
     
        table.buttons().container()
            .appendTo( '#routelist_wrapper .col-sm-6:eq(0)' );
    } );
</script>