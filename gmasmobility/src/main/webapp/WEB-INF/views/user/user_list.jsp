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
	
	<main class="page-content">
		<!--breadcrumb-->
		<div class="breadcrumb-title pe-3 mb-3">
			<b>
				<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="page-icon" alt="">
				승객조회
			</b>
		</div>
		<div class="page-content-inside">
			<div class="page-breadcrumb mb-3">
				<div class="sub-contents">
					<div class="">
						<table id="example" class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th>NO</th>
									<th>이름</th>
									<th>전화번호</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="userList" items="${userList}" varStatus="c">
								<tr onclick="location.href='${pageContext.request.contextPath}/user/${userList.account_idx}'">
									<td>${userList.account_idx}</td>
									<td>${userList.account_name}</td>
									<td>
										<c:choose>
										    <c:when test="${fn:length(userList.account_phone) eq 10}">
										    	<c:out value="${fn:substring(userList.account_phone,0,3)}" /> -
												<c:out value="${fn:substring(userList.account_phone,3,6)}" /> -
												<c:out value="${fn:substring(userList.account_phone,6,12)}" />
										    </c:when>
										    <c:when test="${fn:length(userList.account_phone) eq 11}">
										        <c:out value="${fn:substring(userList.account_phone,0,3)}" /> -
												<c:out value="${fn:substring(userList.account_phone,3,7)}" /> -
												<c:out value="${fn:substring(userList.account_phone,7,13)}" /> 
										    </c:when>
										    <c:otherwise>
										        <c:out value="${userList.account_phone}" />
										    </c:otherwise>
										</c:choose>	
									</td>
									<td>${userList.account_createtime}</td>
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