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
  <div class="wrapper" style="margin: 100px 0px 0px 260px; padding: 45px 150px 24px 150px; background-color: #fff;">
  <h3 style="text-align: center; font-weight: bold;margin-bottom: 40px;">업무 현황</h3>
		
       <!--start content-->       				
  					<div class="container" style="margin-bottom: 60px;">
    					<div class="row">
        					<div class="col-md-4" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/workStatus_main'">
            					<div class=" p-3" style=" width:395px; height:160px; display: flex; flex-direction: column; align-items: center; justify-content:center; border-radius: 10px; box-shadow: 0 0 20px #0000001A;"> 
            						<img alt="진행중 로고" src="${pageContext.request.contextPath}/resources/assets/img/icon_04.png" style="width: 45px; height: 40px; "> 
            						<div style="width: fit-content; height: 30px; color:#BEBEBE; text-decoration: underline;font-size: 25px; margin-top: 10px;font-weight: bold;">진행중</div>
            					</div>
        					</div>
        					<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
        					<div class="col-md-4" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/workStatus_complete'">
            					<div class=" p-3" style=" width:395px; height:160px; display: flex; flex-direction: column; align-items: center; justify-content:center; border-radius: 10px; box-shadow: 0 0 20px #0000001A;"> 
            						<img alt="완료 로고" src="${pageContext.request.contextPath}/resources/assets/img/icon_02.png" style="width: 45px; height: 40px;"> 
            						<div style="width: fit-content; height: 30px; color:#0088C3; text-decoration: underline; font-size: 25px;margin-top: 10px;font-weight: bold;">완료업무</div>
            					</div>
        					</div>
        					<div class="col-md-4" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/workStatus_hand/${enterpriseinfo}'">
            					<div class=" p-3" style=" width:395px; height:160px; display: flex; flex-direction: column; align-items: center; justify-content:center; border-radius: 10px; box-shadow: 0 0 20px #0000001A;"> 
            						<img alt="업무하달 로고" src="${pageContext.request.contextPath}/resources/assets/img/icon_06.png" style="width: 45px; height: 40px;; "> 
            						<div style="width: fit-content; height: 30px; color:#BEBEBE; text-decoration: underline; font-size: 25px;margin-top: 10px;font-weight: bold;">업무하달</div>
            					</div>
        					</div>
    					</div>
					</div>
  					
  					<div style="display: flex;">
  						<div style="display: flex; text-align: center;margin-bottom: 20px;">  					
  							<div style="height: 25px; width: 1px; background-color: #333333"></div>
  							<button class="filter" id="dateData" style="width: 95px; height: 25px; font-weight:bold;background-color: #fff; border:none; color:#0088C3;">일일</button>
  							<div style="height: 25px; width: 1px; background-color: #333333"></div>
  							<button class="filter" id="weekData" style="width: 96px; height: 25px; font-weight:bold;background-color: #fff; border:none;">주간</button>
  							<div style="height: 25px; width: 1px; background-color: #333333"></div>
  							<button class="filter" id="monthData" style="width: 96px; height: 25px; font-weight:bold;background-color: #fff; border:none;">월간</button>
  							<div style="height: 25px; width: 1px; background-color: #333333"></div>
  						</div>
  						<div style="display: flex;position: absolute;right: 152px;top: 325px;">
  							<div class="input-group mb-3" style="width: 387px; height: 52px; margin-right: 10px;">
                        		<div style="border:0.67px solid #DDDDDD; border-bottom-left-radius: 5px; border-top-left-radius: 5px; padding:8px 8px 8px 15px; border-right: none;">
        							<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_calendar.png" id="datepicker-icon">
        						</div>
    							<input type="text" class="form-control" placeholder="" id="datepicker-input" style="padding: 8px; border-left: none;">
  							</div>
	  						<button style="background-color: #707070; color:#fff; border:none; border-radius: 10px; padding:10px 20px; width: 122px; height:51px;"onclick="searchPost()">날짜로 검색</button>
  						</div>
  					</div>
  					
                    <div class="d-flex align-items-stretch justify-content-between">
                      <div class="w-100">
                        <div style="display:flex;justify-content: center;">
                        	<table style="width: 100%;margin-top: 10px; border-top: 1px solid #DDDDDD; text-align: center;border-spacing: 0; margin-bottom:30px;" id="board-list">
                        		<thead style="background-color: #F8FAFF;">
                        			<tr>
                        				<th width="18%">날짜(시간)</th>
                        				<th width="20%">업무명(이미지)</th>
                        				<th>업무내용</th>
                        				<th>담당자</th>
                        				<th>완료시간/상세보기</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        		<c:forEach items="${list}" var = "list" varStatus="status">
                        			<tr>
                        				<td>${list.formatted_createtime}</td>
                        				<c:if test="${empty list.work_nameimg}">
                        				<td> 이미지가 없습니다. <div style="margin-top: 10px;"'>${workList.work_name}</div> </td>
                        				</c:if>
                        				<c:if test="${not empty list.work_nameimg}">
                        				<td> <img alt="업무명(이미지)" src="http://codebrosdev.cafe24.com:8080/media/finder/work/${list.work_nameimg}" style="width:138px; height:87px"> <div>${list.work_name}</div> </td>
                        				</c:if>
                        				<td>${list.work_content}</td>
                        				<td>${list.user_name}</td>
                        				<td style="padding:7px;">
                        					<button id="openModalcomdetail1" style="text-decoration: underline; color: #707070; cursor: pointer;background-color: #fff;border: none;" onclick="optionChanged1(${list.work_index})"> ${list.work_completedatefull}</button>
                        				</td>
                        			</tr>
                        		</c:forEach>	
                        			
                        		</tbody>
                        	</table>
  							<!-- 완료시간/상세보기 모달 -->
  							<c:forEach items="${list}" var = "list" varStatus="status">
                        	<div id="complete_detailModal${list.work_index}" class="modal">
  								<div class="modal-content" style="margin:4.5% auto; height: 810px;">
  									<div style="text-align: center;background-color: #F8F8F8;border-radius: 10px; padding: 20px;">
    									<div style=" font-weight: bolder; ">진행상황</div>
    								</div>
    								
    								<div style="width: 90%; height:800px; margin: 1.5px auto; overflow-y: scroll; class="scrollbar">
    									<div style=" padding: 10px; margin-bottom: 20px;margin-top: 20px;">
    									
    										<div style="height:696px; border-left: 1px solid #DDDDDD;position: absolute;top: 110px;left: 50.87px;z-index: 1;"></div>
    										
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777; ">${list.general_formatted_createtime}</span>
    										<span style=" color:#777777;font-weight: bold; ">업무하달</span>
    									</div>
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777; ">${list.general_formatted_createtime}</span>
    										<span style=" color:#777777;font-weight: bold; ">${list.user_name} 근무자에게 업무하달</span>
    									</div>
    									
    									<c:if test="${list.work_status != 1}">
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777;font-size: 16px; ">${list.work_startdates}</span>
    										<span style=" color:#777777;font-size: 19px;font-weight: bold; ">업무 승인</span>
    									</div>
    									</c:if>
    									<c:if test="${list.work_status != 1}">
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777;font-size: 16px; ">${list.work_startdates}</span>
    										<span style=" color:#777777;font-size: 19px; font-weight: bold;">${list.user_name} 근무자 업무 시작</span>
    									</div>
    									</c:if>
    									<c:if test="${list.work_status != 1}">
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777;font-size: 16px; ">${list.work_startdates}</span>
    										<span style=" color:#777777;font-size: 19px;font-weight: bold; ">업무 진행중</span>
    									</div>
    									</c:if>
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777;font-size: 16px; ">15:30</span>
    										<span style=" color:#777777;font-size: 19px;font-weight: bold; ">컨테이너 하차중</span>
    									</div>
    									
    									<c:if test="${list.work_status == 3}">
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_01.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777;font-size: 16px; ">${list.work_completedates}</span>
    										<span style=" color:#777777;font-size: 19px;font-weight: bold; ">업무 완료</span>
    									</div>
    									</c:if>
    								</div>
    								
									<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;">
    									<span id="closeModal22" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; " id="btncheck${list.work_index}" onclick="close1(${list.work_index})"> 확인	</button></span> 
    								</div>
    							</div>
  							</div> 
  							</c:forEach>							
                        	<!-- 완료시간/상세보기 모달 끝 -->
                        </div>
                      </div>
                    </div>
  <!--end wrapper-->
  </div>
<%@ include file="include/footer.jsp"%>
<style>

/* 기본 날짜 선택 아이콘 숨김 */
input[type="date"]::-webkit-calendar-picker-indicator {
    display: none;
}
</style>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Bootstrap Datepicker CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
<!-- jQuery -->
<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Bootstrap Datepicker JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous"></script>

<script>
window.onload = function() {
    const liElement = document.getElementById('work'); // id로 li 엘리먼트 선택
    const title = document.getElementById('work1');
    const iconimg = document.getElementById('work2');
    liElement.style.background = '#D8E0EF'; // 원하는 스타일로 변경
    liElement.style.borderRadius = '10px'; // 원하는 스타일로 변경
    title.style.color="#003388";
    title.style.fontWeight ="bold";
    iconimg.src ="${pageContext.request.contextPath}/resources/assets/img/icon_menu_02.png";
  }

  
  const dateData = document.getElementById("dateData");
  const weekData = document.getElementById("weekData");
  const monthData = document.getElementById("monthData");

  $.fn.datepicker.dates['ko'] = {
		  days: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
		  daysShort: ["일", "월", "화", "수", "목", "금", "토"],
		  daysMin: ["일", "월", "화", "수", "목", "금", "토"],
		  months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		  monthsShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
		  today: "오늘",
		  clear: "닫기",
		  format: "yyyy-mm-dd",
		  titleFormat: "yyyy MM", /* Leverages same syntax as 'format' */
		  weekStart: 0
  };

  
	$("#datepicker-input").datepicker({
		language: "ko",
		format: 'yyyy-mm-dd',
		autoclose: true, // 날짜 선택 후 자동으로 닫기
	});

	$("#datepicker-icon, #datepicker-input").click(function() {
		$("#datepicker-input").datepicker("show");
	});

	    
  var openModalcomdetail = document.getElementById("openModalcomdetail1");  // 모달 열기 링크
  var openModalcomdetail = document.getElementById("openModalcomdetail2");  // 모달 열기 링크
  var openModalcomdetail = document.getElementById("openModalcomdetail3");  // 모달 열기 링크
  var openModalcomdetail = document.getElementById("openModalcomdetail4");  // 모달 열기 링크
  var openModalcomdetail = document.getElementById("openModalcomdetail5");  // 모달 열기 링크
  var complete_detailModal = document.getElementById("complete_detailModal");          // 모달 엘리먼트
  var closeModal22 = document.getElementById("closeModal22");        // 닫기 버튼

  // 모달 열기
  

  // 모달 닫기 (닫기 버튼을 클릭했을 때)
  closeModal22.addEventListener("click", function() {
      complete_detailModal.style.display = "none";
  });

  // 모달 외부 클릭으로 닫기
  window.addEventListener("click", function(event) {
      if (event.target === complete_detailModal) {
          complete_detailModal.style.display = "none";
      }
  });
  
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/workcomplete.js"></script>