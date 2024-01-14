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
					승객조회
				</b>
			</div>
			<div class="sub-contents ">
				<div class="row">
					<div class="col-3 text-center">
						<div class=" block-info">
							<img src="${pageContext.request.contextPath}/resources/assets/img/icon_04.png" class="page-icon" alt="">
							<p class="pointColor"><b>아이디</b></p>
							<span>${userDetail[0].account_id}</span>
						</div>
					</div>
					
					<div class="col-3 text-center">
						<div class=" block-info">
							<img src="${pageContext.request.contextPath}/resources/assets/img/icon_05.png" class="page-icon" alt="">
							<p class="pointColor"><b>이름</b></p>
							<span>${userDetail[0].account_name}</span>
						</div>
					</div>
					
					<div class="col-3 text-center">
						<div class=" block-info">
							<img src="${pageContext.request.contextPath}/resources/assets/img/icon_07.png" class="page-icon" alt="">
							<p class="pointColor"><b>이메일</b></p>
							<span>${userDetail[0].account_email}</span>
						</div>
					</div>
					
					<div class="col-3 text-center">
						<div class=" block-info">
							<img src="${pageContext.request.contextPath}/resources/assets/img/icon_06.png" class="page-icon" alt="">
							<p class="pointColor"><b>전화번호</b></p>
							<span>${userDetail[0].account_phone}</span>
						</div>
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
									<th>노선번호</th>
									<th>출발지</th>
									<th>도착지</th>
									<th>운행시간</th>
								</tr>
							</thead>
							<tbody>
							
							<c:forEach items="${passengerRoute}" var = "passengerRoute" varStatus="status">	
								<tr onclick="location.href='${pageContext.request.contextPath}/userdetail/1'">
									<td>NO.${status.index}</td>
									<td>${passengerRoute.line_location_address}</td>
									<td>${passengerRoute.line_location_destination_address}</td>
									<td>${passengerRoute.start_time}</td>
								</tr>
								
							</c:forEach>
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