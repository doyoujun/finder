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
				공지사항
			</b>
		</div>
		<div class="page-content-inside">
			<div class="page-breadcrumb mb-3">
				<div class="sub-contents">
					<div class="">
						<form
							action="${pageContext.request.contextPath}/noticeInsert?${_csrf.parameterName}=${_csrf.token}"
							id="noticeInsertForm" name="noticeInsertForm" method="post" class=""
							enctype="multipart/form-data">

							<div class="row mt-40">
								<div class="col-12">
									<label class="pointColor"><b>제목</b></label>
									<input id="club_information_position" class="form-control btn-radius"
										type="text" style="width: 100%; border: 1px solid #ddd;"
										name="notice_title" placeholder="제목을 입력해주세요.">
								</div>
							</div>

							<div class="row mt-3">	
								<div class="col-12">
									<label class="pointColor"><b>내용</b></label>
									<div>
										<textarea rows="10" cols="20" name="notice_description" class="form-control"></textarea>
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
										onclick="vaildate()">등록</button>
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
function vaildate() {
    var title = document.forms["noticeInsertForm"]["notice_title"].value;
    var description = document.forms["noticeInsertForm"]["notice_description"].value;

    if (title.trim() === "" || description.trim() === "") {
        alert("제목과 내용을 입력하세요.");
    } else {
        // If validation passes, submit the form
        document.forms["noticeInsertForm"].submit();
    }
}
</script>