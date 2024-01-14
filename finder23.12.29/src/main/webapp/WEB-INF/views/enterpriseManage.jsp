<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<%@ include file="include/head.jsp"%>
<%@ include file="include/navbar.jsp"%>
<%@ include file="include/sidebar.jsp"%>

  <!--start wrapper-->
  <div class="wrapper" style="margin: 100px 0px 0px 260px; padding: 45px 150px 24px 150px; background-color: #fff;height: 934px;">
  <h3 style="text-align: center; font-weight: bold;">담당업무</h3>
		
       <!--start content-->
      	<form action="${pageContext.request.contextPath}/positionform" method="POST" id="positionform">
      		<div style="display: flex;justify-content: center;">
				<div class="sc-lcujXC bnKPcn" style="width: 149px; height:52px; margin-right: 15px; ">
					<div class=" ">
						<div class=" ">
							<div class="" style="color: #555555;">업무명칭<span style="color:red;">*</span></div> 
							<div class="" style="margin-top: 5px; ">
								<input type="text" class="" id="position" style="padding: 0 20px; height: 52px; border-radius: 10px; width: 100%; border: 1px solid #DDDDDD;" placeholder="업무명칭" name="position">
							</div>
						</div>
					</div>
				</div>
				<div class="sc-lcujXC bnKPcn" style="width: 923px;height:52px;margin-right: 15px; ">
					<div class=" ">
						<div class=" ">
							<div class="" style="color: #555555;">내용 <span style="color:red;">*</span></div> 
							<div class="" style="margin-top: 5px; ">
								<input type="text" class="" id="positioncontent" style="padding: 0 20px; height: 52px; border-radius: 10px; width: 100%; border: 1px solid #DDDDDD;" placeholder="내용" name="positioncontent">
							</div>
						</div>
					</div>
				</div>
				<div style="height: 77px; display: flex; align-items: flex-end;">
					<button type="button" style=" cursor:pointer; margin: 0; font-size: 15px; border: none; color: #fff; width: 145px; height: 52px; background: #0088C3; border-radius: 8px;" color="#fff" id="positionadd" type="button" onclick="positionadd()">추가하기</button>
				</div>
			</div>
				<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
				<div class="" style=" margin: 20px auto;  width: 1247px; height: 633px; border: 1px solid #E1E1E1; border-radius: 8px" id="positionbox">
					<!-- 추가하기 클릭시 여기에 출력되도록 -->
					<div style="display : none;" id = "user_idx">${enterpriseNumber}</div>
					<c:forEach items="${enterpriseManage}" var = "enterpriseManage" varStatus = "status">
					<c:if test="${not empty enterpriseManage.workcategory_name}">
					<div class="d-flex align-items-center one-row bg-gray" style="width: 1213px; height: 39px;margin: 10px;padding: 0 17px;">
						<div class="w-100">												
							${enterpriseManage.workcategory_name} - ${enterpriseManage.workcategory_content}
						</div>        											
					<div class="option-delete">
						<img class="delete-img pointer" src="http://gobigeats.cafe24.com/image/icon_close_01.png" onclick="deleteImg(this)" style="width: 13px; height: 12px;">
					</div>										
					</div>
					</c:if>
					</c:forEach>
				</div>
				
				<div class="" style="display: flex; margin-top: 35px; justify-content: center;">
					<button type="button" style=" cursor:pointer; margin: 0; font-size: 16px; border: none; color: #fff; width: 145px; height: 52px; background: #003388; border-radius: 12px;" color="#fff" id="positionsave" type="button" onclick="positionsave()">저장</button>
				</div>
		</form>
		
      	
  <!--end wrapper-->
  </div>
<%@ include file="include/footer.jsp"%>
<style>
.bg-gray{
	background-color: #F9F9F9;
}
</style>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
window.onload = function() {
    const liElement = document.getElementById('enterprise'); // id로 li 엘리먼트 선택
    const title = document.getElementById('enterprise1');
    const iconimg = document.getElementById('enterprise2');
    liElement.style.background = '#D8E0EF'; // 원하는 스타일로 변경
    liElement.style.borderRadius = '10px'; // 원하는 스타일로 변경
    title.style.color="#003388";
    title.style.fontWeight ="bold";
    iconimg.src ="${pageContext.request.contextPath}/resources/assets/img/icon_menu_06.png";
  }

$(document).ready(function() {
	$("#position, #positioncontent").keypress(function(event) {
        if (event.which === 13) { // 13은 Enter 키의 키코드입니다
            positionadd();
            event.preventDefault(); // 폼 전송 방지
        }
    });
	
    $("#positionadd").click(function() {
        // 업무명칭과 내용 입력값 가져오기
        var position = $("#position").val();
        var positioncontent = $("#positioncontent").val();
        
        if(position=="") {
            alert("업무명칭을 입력해주세요.");
            $("#position").focus();
            return false;
        } 
        if(positioncontent=="") {
            alert("내용을 입력해주세요.");
            $("#positioncontent").focus();
            return false;
        } 
        // 새로운 업무 정보 생성
        var newPositionDiv = $("<div>");
        newPositionDiv.addClass("d-flex align-items-center one-row bg-gray");
        newPositionDiv.css({
            "width": "1213px",
            "height": "39px",
            "margin": "10px",
            "padding": "0 17px"
        });

        // 업무 정보 추가
        newPositionDiv.html('<div class="w-100">' + position + ' - ' + positioncontent + '</div>' +
            '<div class="option-delete">' +
            '<img class="delete-img pointer" src="http://gobigeats.cafe24.com/image/icon_close_01.png" style="width: 13px; height: 12px;">' +
            '</div>');

        // "positionbox"에 새로운 업무 정보 추가
        $("#positionbox").append(newPositionDiv);

        // 입력 필드 초기화
        $("#position").val("");
        $("#positioncontent").val("");
    });

    $(document).on("click", ".delete-img", function() {
        // 삭제 버튼 클릭 시 해당 업무 정보 삭제
        $(this).closest(".d-flex.align-items-center.one-row.bg-gray").remove();
    });
});
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/enterpriseManage.js"></script>