<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<%@ include file="include/head.jsp"%>
<%@ include file="include/navbar.jsp"%>
<%@ include file="include/sidebar.jsp"%>

  <!--start wrapper-->
  <div class="wrapper" style="margin: 100px 0px 0px 260px; padding: 45px 150px 24px 150px; background-color: #fff;height: 934px;">
  <h3 style="text-align: center; font-weight: bold; margin-bottom: 50px;">공지사항 상세</h3>
		
       <!--start content-->
      	<div>
      		<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
       		<div style="display: flex;align-items: center;justify-content: center;">
       			<c:if test="${data[0].notice_category == 1}">
       			<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_notice_01.png" style="width: 51px; height: 26px;margin-right: 15px; ">
       			</c:if>
       			<c:if test="${data[0].notice_category == 0}">
       			<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_notice_02.png" style="width: 51px; height: 26px;margin-right: 15px; ">
       			</c:if>
       			<span class="notice_titlecontent" style="margin-right: 0;font-size:20px; ">${data[0].notice_title}</span>
       			
       			<span class="notice_title" style=" margin-left: 37%;">작성자</span> 		<span class="notice_titlecontent" style=" ">${data[0].notice_writer}</span>
       			<span class="notice_title">등록일</span> 									<span class="notice_titlecontent" style=" ">${data[0].formatted_createtime}</span>
       			<span class="notice_title">조회수</span> 									<span class="notice_titlecontent" style="margin-right: 0;">${data[0].notice_view}</span>
       		</div>
       		<div style="width: 90%; height:3px; background-color:#0088C3; margin-top: 10px;margin: 10px auto 0 auto;"></div>
       		<pre style="width: 90%; height: 450px;color: #141414; font-size: 11px; padding: 15px; margin: 0 auto;">
				${data[0].notice_content}
       		</pre>
       		<div class="movenoticepage">
				<div class="noticeline"></div>
				
				<c:if test="${not empty noticeAft[0].notice_title}">
				<div class="imgdiv" onclick="location.href='${pageContext.request.contextPath}/notice_detail/${noticeAft[0].notice_index }'">
					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_arrow_03.png" style=""> ${noticeAft[0].notice_title}
				</div>
				</c:if>
				<c:if test="${empty noticeAft[0].notice_title}">
				<div class="imgdiv">	
					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_arrow_03.png" style=""> -
				</div>
				</c:if>
				
				<div class="noticeline"></div>
				
				<c:if test="${not empty noticeBef[0].notice_title}">
				<div class="imgdiv" onclick="location.href='${pageContext.request.contextPath}/notice_detail/${noticeBef[0].notice_index }'">
					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_arrow_02.png" style=""> ${noticeBef[0].notice_title}
				</div>
				</c:if>
				
				<c:if test="${empty noticeBef[0].notice_title}">
				<div class="imgdiv">
					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_arrow_02.png" style=""> -
				</div>
				</c:if>
				
				<div class="noticeline"></div>	       		
       		</div>
       		
       		<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;">
    			<span id="closeModal1" class="close"><button class="btn" style="color: #003388; background-color:#fff;width:140px;height: 45px; border: 1px solid #003388; margin-right: 10px" onclick="deleted(${data[0].notice_index})"> 삭제	</button></span> 
    			<span id="" class=""><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px;" onclick="location.href='${pageContext.request.contextPath}/noticeEdit/${data[0].notice_index}'"> 수정	</button></span> 
    		</div>
       	</div>
                    
  <!--end wrapper-->
  </div>
<%@ include file="include/footer.jsp"%>
<style>

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
window.onload = function() {
    const liElement = document.getElementById('notice'); // id로 li 엘리먼트 선택
    const title = document.getElementById('notice1');
    const iconimg = document.getElementById('notice2');
    liElement.style.background = '#D8E0EF'; // 원하는 스타일로 변경
    liElement.style.borderRadius = '10px'; // 원하는 스타일로 변경
    title.style.color="#003388";
    title.style.fontWeight ="bold";
    iconimg.src ="${pageContext.request.contextPath}/resources/assets/img/icon_menu_05.png";
  }


function deleted(num) {
	
	
	
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
	$.ajax({
			async: false,
			type: "post",
			url: $("#context").text()+'/viewdelete',
			data: {
				notice_index : num
			},
			beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token);
			},
			success: (response) => {
				
					
					alert("삭제되었습니다.");
					location.href = $("#context").text()+"/notice";
			},
					error: (error) => {
					
				}
		});
}
</script>
