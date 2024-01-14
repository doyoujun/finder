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
				중단 신청 기사 목록
			</b>
		</div>
		<div class="page-content-inside">
			<div class="page-breadcrumb mb-3">
				<div class="sub-contents">
					<div class="">
						<table id="example" class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th>기사</th>
									<th>노선 번호</th>
									<th>현재인원</th>
									<th>출발지/도착지</th>
									<th>중단사유</th>
									<th>중단/취소</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${stopdriverlist}" var = "stopdriverlist" varStatus="status">
								<tr>
									<td class="underLine">NO.${status.count}</td>
									<td>${stopdriverlist.line_idx}</td>
									<td>${stopdriverlist.current_people_count}</td>
									<td>
										출발지 : ${stopdriverlist.line_location_address}<br>
										도착지 : ${stopdriverlist.line_destination_address}
									</td>
									<td>
										<button type="button" class="btn btn-primary" onclick="openModal(${stopdriverlist.line_idx})">보기</button>
									</td>
									<td>
										<select class="custom-select">
											<option value="중단" >중단</option>
											<option value="취소">취소</option>
										</select>
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
			<c:forEach items="${stopdriverlist}" var = "stopdriverlist" varStatus="status">
			<div class="modal fade" id="memoModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							
						</div>
						<div class="modal-body text-center" id="memoModalBody">
							어떠 어떠한 이유로 운행을 못하게 되었습니다.<br> 중단 신청 합니다~
						</div>
						<div class="modal-body text-center" id="memoModalBody${stopdriverlist.line_idx}" style = "display:none;">
							${stopdriverlist.driver_stop_reason}
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
		console.log(idx);
		
		var index = "memoModalBody" + idx;
		
		const showbox = document.getElementById(index);
		
		
		const content = showbox.innerText;
		var show_text = "";
		
		$("#memoModalBody").html(content);
		//$("#memoModal").show();
		$("#memoModal").modal("show"); // 모달 팝업 열기
		
	}
    jQuery(document).ready(function() {
        var table = $('#userlist').DataTable({
            lengthChange: false,
            dom: 'Bfrtip',
            buttons: [ { extend: 'csv', charset: 'UTF-8', bom: true, text:"CSV 다운로드" }],
            language : lang_kor
        } );
     
        table.buttons().container()
            .appendTo( '#userlist_wrapper .col-sm-6:eq(0)' );
    } );
</script>
