<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<b>
				<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="page-icon" alt="">
				공지사항
			</b>
		</div>
		<div class="page-content-inside">
			<div class="page-breadcrumb mb-3">
				<div class="sub-contents">
					<div class="">
						<form
							id="userInsertForm" name="userInsertForm" method="post" class=""
							enctype="multipart/form-data">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div class="row mt-40">
								<div class="col-12">
									<label class="pointColor"><b>제목</b></label>
									<input id="club_information_position" class="form-control btn-radius"
										type="text" style="width: 100%; border: 1px solid #ddd;"
										name="club_information_position" placeholder="제목을 입력해주세요.">
								</div>
							</div>

							<div class="row mt-3">	
								<div class="col-12">
									<label class="pointColor"><b>내용</b></label>
									<div>
										<textarea rows="10" cols="20" name="" class="form-control" id="textarea"></textarea>
									</div>
								</div>
							</div>
							
							<div class="row mt-3">	
								<div class="col-12">
									<label class="pointColor"><b>대표 이미지</b></label>
									<div class="filebox ">
										<input class="form-control" type="file" id="formFile" name="file"  accept="image/jpeg, image/png">
									</div>
									 
								</div>
							</div>
							
							

							<div class="row mt-5">
								<div class="col-12 btn-bottom text-center">
									<button class="btn-point btn-radius" type="button"
										onclick="userAdd_vail()">등록</button>
								</div>
							</div>

						</form>
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
<script src="${pageContext.request.contextPath}/resources/assets/js/question.js"></script>