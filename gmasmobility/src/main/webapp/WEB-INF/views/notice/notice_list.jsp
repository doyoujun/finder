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
				공지사항
			</b>
		</div>
		<div class="page-content-inside">
			<div class="page-breadcrumb mb-3">
				<div class="sub-contents">
					<div class="text-right">
						<button type="button" class="btn btn-primary btn-radius pd-rl-40" onclick="location.href='${pageContext.request.contextPath}/noticeAdd'"> 등록</button>
					</div>
					<div class="">
						<table id="example" class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th>이미지</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="noticelist" items="${noticelist}" varStatus="c">
								<tr onclick="location.href='${pageContext.request.contextPath}/notice/${noticelist.notice_idx}'">
									<td>
										<div class="thumbnail">
											<c:if test="${not empty noticelist.notice_img_url}">
											    <img class="thumImg" src="http://codebrosdev.cafe24.com:8080/media/shuttleking/notice/${noticelist.notice_img_url}" class="user" alt="">
											</c:if>
											<c:if test="${empty noticelist.notice_img_url}">
											    -
											</c:if>	
										</div>
									</td>
									<td>${noticelist.notice_title}</td>
									<td>관리자</td>
									<fmt:parseDate var="created_at" value="${noticelist.notice_createtime}" pattern="yyyy-MM-dd" />
                                    <fmt:formatDate var="created_at2" value="${created_at}" type="DATE" pattern="yyyy-MM-dd" />
                                    <td>${created_at2}</td>
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