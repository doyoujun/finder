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
			<b> <img
				src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png"
				class="page-icon" alt=""> 이벤트
			</b>
		</div>
		<div class="page-content-inside">
			<div class="page-breadcrumb mb-3">
				<div class="sub-contents">
					<div class="text-right">
						<button type="button" class="btn btn-primary btn-radius pd-rl-40"
							onclick="location.href='${pageContext.request.contextPath}/eventAdd'">
							등록</button>
					</div>
					<div class="row" id="eventList">
						<div class="col-6">
							<div class="eventList-content"
								onclick="location.href='${pageContext.request.contextPath}/event/1'">
								<img
									src="${pageContext.request.contextPath}/resources/assets/img/img_03.png">
								<div class="event-title">이벤트 제목입니다.</div>
								<div class="event-ctr">
									<span class="event-state event-end">종료</span> <span
										class="event-date">2023-09-09 ~ 2023-10-10</span>
								</div>
							</div>
						</div>
						<c:forEach var="eventlist" items="${eventlist}" varStatus="c">
							<div class="col-6">
								<div class="eventList-content"
									onclick="location.href='${pageContext.request.contextPath}/event/${eventlist.event_idx}'">
									<div class="thumbnail">
										<c:if test="${not empty eventlist.event_img_url}">
										    <img class="thumImg" src="http://codebrosdev.cafe24.com:8080/media/shuttleking/event/${eventlist.event_img_url}" class="user" alt="">
										</c:if>
										<c:if test="${empty eventlist.event_img_url}">
										    -
										</c:if>	
									</div>
									
									<div class="event-title">${eventlist.event_title}</div>
									<div class="event-ctr">
										<span class="event-state event-ing">진행중</span> <span
											class="event-date">${eventlist.event_s} ~ ${eventlist.event_e}</span>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>

					<div id="paging"></div>

				</div>
			</div>
		</div>

		<!--end breadcrumb-->
	</main>
</div>

<%@ include file="../include/footer.jsp"%>
<script>
	$(document).ready(function() {
		setupPagination('eventList');
	});
</script>