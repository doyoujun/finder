<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/head.jsp"%>
<%@ include file="include/navbar.jsp"%>
<%@ include file="include/sidebar.jsp"%>

  <!--start wrapper-->
  <div class="wrapper" style="margin: 100px 0px 0px 260px; padding: 45px 150px 24px 150px; background-color: #fff;">
		<h3 style="text-align: center; font-weight: bold; margin-bottom: 40px;">업무 현황</h3>
       <!--start content-->       				
  					<div class="container" style="margin-bottom: 40px;">
    					<div class="row">
        					<div class="col-md-4" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/workStatus_main'">
            					<div class=" p-3" style=" width:395px; height:160px; display: flex; flex-direction: column; align-items: center; justify-content:center; border-radius: 10px; box-shadow: 0 0 20px #0000001A;"> 
            						<img alt="진행중 로고" src="${pageContext.request.contextPath}/resources/assets/img/icon_01.png" style="width: 45px; height: 40px; "> 
            						<div style="width: fit-content; height: 30px; color:#0088C3; text-decoration: underline; font-size: 25px;margin-top: 10px;font-weight: bold;">진행중</div>
            					</div>
        					</div>
        					<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
        					<div class="col-md-4" style="cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/workStatus_complete'">
            					<div class=" p-3" style=" width:395px; height:160px; display: flex; flex-direction: column; align-items: center; justify-content:center; border-radius: 10px; box-shadow: 0 0 20px #0000001A;"> 
            						<img alt="완료 로고" src="${pageContext.request.contextPath}/resources/assets/img/icon_05.png" style="width: 45px; height: 40px;"> 
            						<div style="width: fit-content; height: 30px; color:#BEBEBE; text-decoration: underline; font-size: 25px;margin-top: 10px;font-weight: bold;">완료업무</div>
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
  
                    <div class="d-flex align-items-stretch justify-content-between">
                      <div class="w-100">
                        <div style="display:flex;justify-content: center;">
                        	<table id="" style="width: 100%;margin-top: 10px; border-top: 1px solid #DDDDDD; text-align: center;border-spacing: 0; margin-bottom:30px;">
                        		<thead style="background-color: #F8FAFF;">
                        			<tr>
                        				<th width="18%">날짜(시간)</th>
                        				<th width="20%">업무명(이미지)</th>
                        				<th>업무내용</th>
                        				<th>담당자</th>
                        				<th>진행상황</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        		<c:forEach items="${workList}" var = "workList" varStatus="status">
                        			<tr>
                        				<td>${workList.formatted_createtime}</td>
                        				<c:if test="${empty workList.work_nameimg}">
                        				<td> 이미지가 없습니다. <div style="margin-top: 10px;"'>${workList.work_name}</div> </td>
                        				</c:if>
                        				<c:if test="${not empty workList.work_nameimg}">
                        				<td> <img alt="업무명(이미지)" src="http://codebrosdev.cafe24.com:8080/media/finder/work/${workList.work_nameimg}" style="width:138px; height:87px"> <div style="margin-top: 10px;"'>${workList.work_name}</div> </td>
                        				</c:if>
                        				<td>${workList.work_content}</td>
                        				<td>${workList.user_name}</td>
                        				<td style="display:none;">${workList.work_status}</td>
                        				<td style="padding:7px;">
                        					<button class="btn" style="color: #fff; background-color:#0088C3;width:100px;" id="openModalprogress${workList.work_index}" onclick="optionChanged1(${workList.work_index})"> 보기</button>
                        				</td>
                        			</tr>
                        		</c:forEach>	
                        		</tbody>
                        		
                        	</table>
                        </div>
                        
                      </div>
                    </div>
                    
                    <!-- 진행중-진행상황 모달 -->
                    		<c:forEach items="${workList}" var = "workList" varStatus="status">
                        	<div id="progressModal${workList.work_index}" class="modal">
  								<div class="modal-content" style="margin:2.5% auto; height: 800px;">
  									<div style="text-align: center;background-color: #F8F8F8;border-radius: 10px; padding: 20px;">
    									<div style=" font-weight: bolder; font-size: 15px;">진행상황</div>
    								</div>
    								
    								<div class="custom-scroll" style="width: 90%; height:628px; margin: 20px auto; overflow-y: scroll;" >
    									<div style=" padding: 10px; margin-bottom: 20px;">
    									
    										<div style="height:600px; border-left: 1px solid #DDDDDD;position: absolute;top: 110px;left: 47.87px;z-index: 1;"></div>
    										
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										
    										<span style=" color:#777777;font-size: 16px; ">${workList.general_formatted_createtime}</span>
    										<span style=" color:#777777;font-size: 19px;font-weight: bold; ">업무하달</span>
    										
    									</div>
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777;font-size: 16px; ">${workList.general_formatted_createtime}</span>
    										<span style=" color:#777777;font-size: 19px;font-weight: bold; ">${workList.user_name} 근무자에게 업무하달</span>
    									</div>
    									
    									<c:if test="${workList.work_status != 1}">
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777;font-size: 16px; ">${workList.work_startdates}</span>
    										<span style=" color:#777777;font-size: 19px;font-weight: bold; ">업무 승인</span>
    									</div>
    									</c:if>
    									<c:if test="${workList.work_status != 1}">
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777;font-size: 16px; ">${workList.work_startdates}</span>
    										<span style=" color:#777777;font-size: 19px; font-weight: bold;">${workList.user_name} 근무자 업무 시작</span>
    									</div>
    									</c:if>
    									<c:if test="${workList.work_status != 1}">
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777;font-size: 16px; ">${workList.work_startdates}</span>
    										<span style=" color:#777777;font-size: 19px;font-weight: bold; ">업무 진행중</span>
    									</div>
    									</c:if>
    									
    			
    									<c:if test="${workList.work_status == 3}">
    									<div style=" padding: 10px; margin-bottom: 20px;">
    										<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_radio_02.png" style="width: 21px; height: 21px;position: relative;z-index: 99;">
    										<span style=" color:#777777;font-size: 16px; ">${workList.work_completedates}</span>
    										<span style=" color:#777777;font-size: 19px;font-weight: bold; ">업무 완료</span>
    									</div>
    									</c:if>
    								</div>
    								
									<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;">
    									<span id="closeModal21" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; "id="btncheck${workList.work_index}" onclick="close1(${workList.work_index})"> 확인	</button></span> 
    								</div>
    							</div>
  							</div>
  							</c:forEach>
                      <!-- 진행중-진행상황 모달 끝 -->
                    
  <!--end wrapper-->
  		<div id="pagination"></div>
  </div>
<%@ include file="include/footer.jsp"%>
<style>
#dropdownButton1, #dropdownButton2 {
  width:100px;
  height:40px;
  cursor: pointer;
}

.dropdown-list1 {
  display: none;
  position: absolute;
  background-color: #fff;
  border: 1px solid #707070;
  list-style: none;
  padding: 0;
}
.dropdown-list2{
	display: none;
  position: absolute;
  background-color: #fff;
  border: 1px solid #707070;
  list-style: none;
  padding: 0;
}

.dropdown-list1,.dropdown-list2 li {
  width:95px;
  padding: 5px 19px;
}
.dropdown-list1,.dropdown-list2 li a {
  color:#707070;
}

.custom-select.active .dropdown-list1 {
  display: block;
}
.custom-select.active .dropdown-list2 {
	display: block;
}
 .custom-scroll::-webkit-scrollbar {
    width: 5px;
}

.custom-scroll::-webkit-scrollbar-thumb {
    background: #D1D1D1;
    border-radius: 50px;
}

.custom-scroll::-webkit-scrollbar-track {
    background: #EBEBEB;
    border-radius: 50px;
} 
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<!-- Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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

  var openModalprogress = document.getElementById("openModalprogress");	//진행상황
  var openModalprogress = document.getElementById("openModalprogress1");	//진행상황
  var openModalprogress = document.getElementById("openModalprogress2");	//진행상황
  var openModalprogress = document.getElementById("openModalprogress3");	//진행상황
  var openModalprogress = document.getElementById("openModalprogress4");	//진행상황
  var openModalprogress = document.getElementById("openModalprogress5");	//진행상황
  var progressModal = document.getElementById("progressModal");		//진행상황
  
  var closeModal21 = document.getElementById("closeModal21");

  


  
  
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/workmain.js"></script>