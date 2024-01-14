<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
					공지사항
				</b>
			</div>
			<div class="sub-contents ">
				<div class="row underline_point">
					<div class="col-6 text-left pd-l-n notice-title">
						<b>${noticeDetail[0].notice_title}</b>
					</div>
					
					<div class="col-3 text-center pd-t-1">
						<b class="lightGrayColor">작성자</b>
						<span class="bold blackColor">관리자</span>
					</div>
					<fmt:parseDate var="created_at" value="${noticeDetail[0].notice_createtime}" pattern="yyyy-MM-dd" />
                    <fmt:formatDate var="created_at2" value="${created_at}" type="DATE" pattern="yyyy-MM-dd" />
					<div class="col-3 text-center pd-t-1">
						<b class="lightGrayColor">등록일</b>
						<span class="bold blackColor">${created_at2}</span>
					</div>
				</div>
				
				<div class="row board-cotents">
					<div class="col-12 text-center notice-img">
						<c:if test="${not empty noticeDetail[0].notice_img_url}">
						    <img src="http://codebrosdev.cafe24.com:8080/media/shuttleking/notice/${noticeDetail[0].notice_img_url}" class="user" alt="">
						</c:if>
						<c:if test="${empty noticeDetail[0].notice_img_url}">
						    -
						</c:if>
					</div>
					<div class="col-12">
						${noticeDetail[0].notice_description}
					</div>
				</div>
				
				<div class="page board-control">
					<ul>
						<li onclick="location.href='${pageContext.request.contextPath}/notice/${noticeBef[0].notice_idx }'">
							<div class="d-flex vertical">
								<img src="/project/resources/assets/img/icon_arrow_01.png" class="arrow">
								<c:if test="${not empty noticeBef[0].notice_title}">
								    <span class="centered-text">${noticeBef[0].notice_title }</span>
								</c:if>
								<c:if test="${empty noticeBef[0].notice_title}">
								    <span class="centered-text">-</span>
								</c:if>	
							</div>
						</li>
						<li onclick="location.href='${pageContext.request.contextPath}/notice/${noticeAft[0].notice_idx }'">
							<div class="d-flex vertical">
								<img src="/project/resources/assets/img/icon_arrow_02.png" class="arrow">
								<c:if test="${not empty noticeAft[0].notice_title}">
								    <span class="centered-text">${noticeAft[0].notice_title }</span>
								</c:if>
								<c:if test="${empty noticeAft[0].notice_title}">
								    <span class="centered-text">-</span>
								</c:if>
							</div>
						</li>
					</ul>
					
					<div class="text-right">
						<button class="btn mt-2 btn-bor-default btn-radius" type="button" onclick="delete_popup(1)">
							<img src="/project/resources/assets/img/icon_03.png" class="arrow">
							삭제
						</button>
					</div>
					
					<div class="row mt-5">
						<div class="col-12 btn-bottom text-center">
							<button class="btn-bor-point btn-radius" type="button" onclick="location.href='${pageContext.request.contextPath}/noticeEdit/${noticeDetail[0].notice_idx}'">수정</button>
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
						<div class="modal-footer d-flex">
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
			url : '${pageContext.request.contextPath}/noticeDelete?notice_idx='+board_num,
			success : function(data) {
				alert("삭제 되었습니다.");
				location.href="${pageContext.request.contextPath}/notice";
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