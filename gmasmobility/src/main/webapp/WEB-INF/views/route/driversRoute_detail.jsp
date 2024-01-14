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
					승객노선
				</b>
			</div>
			<div class="sub-contents ">
				<div class="row">
					<div class="col-4 text-center">
						<div class=" block-info">
							<img src="${pageContext.request.contextPath}/resources/assets/img/icon_10.png" class="page-icon" alt="">
							<p class="pointColor"><b>노선번호</b></p>
							<span>6</span>
						</div>
					</div>
					
					<div class="col-4 text-center">
						<div class=" block-info">
							<img src="${pageContext.request.contextPath}/resources/assets/img/icon_07.png" class="page-icon" alt="">
							<p class="pointColor"><b>현재인원</b></p>
							<span>2</span>
						</div>
					</div>
					
					<div class="col-4 text-center">
						<div class=" block-info">
							<img src="${pageContext.request.contextPath}/resources/assets/img/icon_11.png" class="page-icon" alt="">
							<p class="pointColor"><b>가시매칭</b></p>
							<span>가능</span>
						</div>
					</div>
				</div>
				
				<div class="row mt-4 border-b pd-b-2">
					<div class="col-6 text-center d-flex vertical">
						<img src="${pageContext.request.contextPath}/resources/assets/img/icon_start.png">
						<span class="centered-text">부산시 사상구 사상로 10</span>
					</div>
					
					<div class="col-6 text-center d-flex vertical">
						<img src="${pageContext.request.contextPath}/resources/assets/img/icon_arrival.png">
						<span class="centered-text">부산시 사상구 사상로 10</span>
					</div>
				</div>
				
				<div class="row">
					<div class="col-12 block-title mt-5">
						<span><b>이용중인 노선</b></span>
					</div>
					<div class="col-12">
						<table id="example" class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th>이름</th>
									<th>아이디</th>
									<th>입금여부</th>
									<th>중단사유</th>
									<th>중단/취소</th>
								</tr>
							</thead>
							<tbody>
								<%
								for(int i=0;i<50;i++){
								%>
								<tr>
									<td>홍길동</td>
									<td>hong01</td>
									<td>입금완료</td>
									<td>어떠 어떠한 이유로 인해 중단 신청합니다.</td>
									<td>
										<select class="custom-select">
											<option value="중단" >중단</option>
											<option value="취소">취소</option>
										</select>
									</td>
								</tr>
								<%		
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!--end breadcrumb-->
	</main>
</div>

<%@ include file="../include/footer.jsp"%>


<script>
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