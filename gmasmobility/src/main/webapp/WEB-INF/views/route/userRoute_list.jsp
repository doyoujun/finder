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
				승객노선
			</b>
		</div>
		<div class="page-content-inside">
			<div class="page-breadcrumb mb-3">
				<div class="sub-contents">
					<div class="">
						<table id="example" class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th>노선 번호</th>
									<th>현재인원</th>
									<th>출발지</th>
									<th>도착지</th>
									<th>기사매칭</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${passengerroutelist}" var = "passengerroutelist" varStatus="status">	
								<tr onclick="location.href='${pageContext.request.contextPath}/userroute/${passengerroutelist.line_idx}'">
									<td>NO.${passengerroutelist.line_idx}</td>
									<td>${passengerroutelist.current_people_count}</td>
									<td>${passengerroutelist.line_location_address}</td>
									<td>${passengerroutelist.line_destination_address}</td>
									<c:if test="${passengerroutelist.hasDriver != 0}">
									<td>가능</td>
									</c:if>
									<c:if test="${passengerroutelist.hasDriver == 0}">
									<td>불가능</td>
									</c:if>
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