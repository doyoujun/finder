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
  <h3 style="text-align: center; font-weight: bold;">알림</h3>
		
       <!--start content-->
                     <div class="d-flex align-items-stretch justify-content-between">
                      <div class="w-100">
                        <div style="display: flex;">
                        	<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="logo-icon" alt="" style="width: 41px; height: 25px;margin-right: 15px;">
                        	<span style="color: #333333; font-weight: bold; font-size: 20px">회원가입 / 정보변경 요청</span>
                        </div>
                        <div style="display:none;" id="context">${pageContext.request.contextPath}</div>
                        <div style="display:flex;justify-content: center;">
                        	<table style="width: 100%;margin-top: 15px; border-top: 1px solid #DDDDDD; text-align: center;border-spacing: 0; margin-bottom:50px;">
                        		<thead style="background-color: #F8FAFF;">
                        			<tr>
                        				<th width="20%">근무자명</th>
                        				<th width="30%">내용</th>
                        				<th width="30%">구분</th>
                        				<th width="20%">승인/거절</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                       			<c:forEach items="${userList}" var = "userList">
                        		<c:choose>
                        		<c:when test="${userList.user_edit_name == null}">
                        			<tr>
                        				<td>${userList.user_name}</td>
                        				<td style="text-decoration: underline; cursor: pointer;" id="openModalinfo1">근무자 시스템 가입</td>
                        				<td>회원가입</td>
                        				<td style="padding:7px;">
                        					<select id="decision_${userList.user_index}" class="select" onchange="optionChanged(this, ${userList.user_index})">
                        						<option value="" selected disabled>승인/거절</option>
  												<option value="1">승인</option>
  												<option value="0">거절</option>
											</select>
                        				</td>
                        				<td style="display : none;" id = "user_idx2_${userList.user_index}">${userList.user_index}</td>
                        			</tr>
                        		</c:when>
                        		<c:otherwise>	
                        			<tr>
                        				<td>${userList.user_edit_name}</td>
                        				<td style="text-decoration: underline;cursor: pointer;" id="openModalinfo2">근무자 정보 변경</td>
                        				<td>정보변경</td>
                        				<td style="padding:7px;">
                        					<select id="decision1" class="select" onchange="optionChanged1(this, ${userList.user_edit_user_index})">
  												<option value="" selected disabled>승인/거절</option>
  												<option value="1">승인</option>
  												<option value="0">거절</option>
											</select>
                        				</td>
                        				<td style="display : none;" id = "user_idx3">${userList.user_edit_user_index}</td>
                        			</tr>
                        		</c:otherwise>
								</c:choose>
								</c:forEach>	
                        		</tbody>
                        	</table>
                        	<!-- 회원가입/정보변경 요청 모달 -->
                        	<c:forEach items="${userList}" var = "userList">
                       		<c:choose>
                       		<c:when test="${userList.user_edit_name == null}">
                        	<div id="infoModal" class="modal">
  								<div class="modal-content">
    									<div style="text-align: center;background-color: #F8F8F8;border-radius: 10px; padding: 20px 10px 10px 10px;">
    										<img src="${pageContext.request.contextPath}/resources/assets/img/img_09.png" class="logo-icon" alt="프로필 사진" style="width:60px;height:60px;border-radius: 50px;">
    										<div style="margin-top: 10px; font-weight: bold; font-size: 18px;">김두팔</div>
    									</div>
    									<div class="info" style="display: flex;justify-content: center;height: 450px;">
    										<ul style="font-weight: bold; color: #333333; font-size: 15px; padding:0px;">
    											<li>성명</li>
    											<li>소속</li>
    											<li>담당업무</li>
    											<li>담당차량</li>
    											<li>생년월일</li>
    											<li>주소</li>
    											<li>담당자 휴대폰번호</li>
    											<li>이메일</li>
    										</ul>
    										<ul style="list-style: none; padding: 0px; margin: 0px; font-size: 15px;">
    											<li style="margin-left: 0px;">${userList.user_name}</li>
    											<li style="margin-left: 0px;">${userList.user_team}</li>
    											<li style="margin-left: 0px;">${userList.user_duty}</li>
    											<c:if test="${empty userList.user_vehicle}">
    											<li style="margin-left: 0px;color:#DDDDDD;" > 담당차량없음</li>
    											</c:if>
    											<c:if test="${!empty userList.user_vehicle}">
    											<li style="margin-left: 0px;color:#DDDDDD;" > ${userList.user_vehicle}</li>
    											</c:if>
    											<li style="margin-left: 0px;">${userList.user_birth}</li>
    											<li style="margin-left: 0px;">${userList.user_address} ${userList.user_daddress}</li>
    											<li style="margin-left: 0px;">${userList.user_managerphone}</li>
    											<li style="margin-left: 0px;">${userList.user_email}</li>
    											<li style="display : none;" id = "user_idx">${userList.user_index}</li>
    										</ul>
    									</div>
    									<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;">
    										<span id="closeModal1" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; "> 확인	</button></span> 
    									</div>
    								</div>
  								</div>
							</c:when>
                       		<c:otherwise>
	                       		<div id="infoModal2" class="modal">
	  								<div class="modal-content">
	    									<div style="text-align: center;background-color: #F8F8F8;border-radius: 10px; padding: 20px 10px 10px 10px;">
	    										<img src="${pageContext.request.contextPath}/resources/assets/img/img_09.png" class="logo-icon" alt="프로필 사진" style="width:60px;height:60px;border-radius: 50px;">
	    										<div style="margin-top: 10px; font-weight: bold; font-size: 18px;">김두팔</div>
	    									</div>
	    									<div class="info" style="display: flex;justify-content: center;height: 450px;">
	    										<ul style="font-weight: bold; color: #333333; font-size: 15px; padding:0px;">
	    											<li>성명</li>
	    											<li>소속</li>
	    											<li>담당업무</li>
	    											<li>담당차량</li>
	    											<li>생년월일</li>
	    											<li>주소</li>
	    											<li>담당자 휴대폰번호</li>
	    											<li>이메일</li>
	    										</ul>
	    										<ul style="list-style: none; padding: 0px; margin: 0px; font-size: 15px;">
	    											<li style="margin-left: 0px;" id = "user_edit_name">${userList.user_edit_name}</li>
	    											<li style="margin-left: 0px;" id = "user_edit_team">${userList.user_edit_team}</li>
	    											<li style="margin-left: 0px;" id = "user_edit_duty">${userList.user_edit_duty}</li>
	    											<c:if test="${empty userList.user_edit_vehicle}">
	    											<li style="margin-left: 0px;color:#DDDDDD;" id = "user_edit_vehicle"> 담당차량없음</li>
	    											</c:if>
	    											<c:if test="${!empty userList.user_edit_vehicle}">
	    											<li style="margin-left: 0px;color:#DDDDDD;" id = "user_edit_vehicle">${userList.user_edit_vehicle} </li>
	    											</c:if>
	    											<li style="margin-left: 0px;" id = "user_edit_birth">${userList.user_edit_birth}</li>
	    											<li style="margin-left: 0px;" id = "user_edit_address">${userList.user_edit_address} ${userList.user_edit_detailaddress}</li>
	    											<li style="margin-left: 0px; display : none;" id = "user_edit_detailaddress" >${userList.user_edit_detailaddress}</li>
	    											<li style="margin-left: 0px;" id = "user_edit_managerphone">${userList.user_edit_managerphone}</li>
	    											<li style="margin-left: 0px;" id = "user_edit_email">${userList.user_edit_email}</li>
	    											<li style="display : none;" id = "user_edit_user_index">${userList.user_edit_user_index}</li>
	    										</ul>
	    									</div>
	    									<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;">
	    										<span id="closeModal11" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; "> 확인	</button></span> 
	    									</div>
	    								</div>
	  								</div>
  								</c:otherwise>
								</c:choose>
								</c:forEach>
  								</div>
							</div>
                        </div>
                    
                    <div class="d-flex align-items-stretch justify-content-between">
                      
                      <div class="w-100">
                        <div style="display: flex;">
                        	<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="logo-icon" alt="" style="width: 41px; height: 25px;margin-right: 15px;">
                        	<span style="color: #333333; font-weight: bold; font-size: 20px">실시간 보고</span>
                        </div>
                        <div style="display:flex;justify-content: center;">
                        	<table style="width: 100%;margin-top: 15px; border-top: 1px solid #DDDDDD; text-align: center;border-spacing: 0; margin-bottom:50px;">
                        		<thead style="background-color: #F8FAFF;">
                        			<tr>
                        				<th width="20%">근무자명</th>
                        				<th width="30%">내용</th>
                        				<th width="30%">구분</th>
                        				<th width="20%">확인</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        		<c:forEach items="${CombinedList}" var = "CombinedList">
                        		<c:choose>
                        		<c:when test="${CombinedList.general_report_content == null}">
                        			<tr>
                        				<td>${CombinedList.user_name}</td>
                        				<td style="text-decoration: underline;cursor: pointer;" id="openModalreport1"><c:out value="${CombinedList.formatted_createtime}"/>${CombinedList.user_name} 근무자 위치에서 사고발생</td>
                        				<td>긴급</td>
                        				<td style="padding:7px;">
                        					<button class="btn" style="color: #fff; background-color:#0088C3;width:100px; " type="button" id="btnCheck"> 확인	</button>
                        				</td>
                        				<td style="display : none;">${CombinedList.urgent_report_index}</td>
                        			</tr>
                        			
                        		</c:when>
                        		<c:otherwise>	
                        			<tr>
                        				<td>${CombinedList.user_name}</td>
                        				<td style="text-decoration: underline;cursor: pointer;" id="openModalreport2">${CombinedList.user_name} 근무자 위치에서 특이사항 전달</td>
                        				<td>일반</td>
                        				<td style="padding:7px;">
                        					<!-- <select name="status" class="select">
  												<option value="accept">승인<iconify-icon icon="material-symbols:play-arrow" width="20" height="20" rotate="90deg"></iconify-icon></option>
  												<option value="redirect">거절</option>
											</select> -->
											<button class="btn" style="color: #fff; background-color:#0088C3;width:100px; " type="button" id="btnCheck2"> 확인	</button>
                        				</td>
                        			</tr>
                        		</c:otherwise>
								</c:choose>
								</c:forEach>	
                        		</tbody>
                        	</table>
                        	<!-- 실시간보고 모달 -->
                        	<c:forEach items="${CombinedList}" var = "CombinedList">
                       		<c:choose>
                       		<c:when test="${CombinedList.general_report_content == null}">
                        	<div id="reportModal" class="modal">
  								<div class="modal-content" style="margin:4.5% auto;width: 571px;">
    								<div style="text-align: center;box-shadow:2px 2px 10px #0000001A; border-radius: 10px; display: flex;align-items: center;">    										
    									<div style="margin: 10px 20px;font-weight: bolder; font-size: 15px; color: #fff; background-color: #D31616; border-radius: 17px;width: 60px;height: 33px; display: flex;align-items: center;justify-content: center;"> <span>긴급</span></div>
    									<div style="margin: 10px 15px 10px 0;font-weight: bolder; font-size: 15px;" id="test">${CombinedList.formatted_createtime}</div>
    									<div style="font-weight: bolder; font-size: 15px;">${CombinedList.urgent_report_index}${CombinedList.user_name} 근무자 위치에서 사고발생</div>
    								</div>
    								<div class="situation" >
	                        		
    									<div style="display: flex;margin: 10px;">
		    								<div id="modalmap" style="width:534px;height:273px;margin:10px;border-radius: 10px"></div>
    									</div>
    									<div style="background-color: #0088C30D;padding: 5px 20px;"> <span style="color:#0088C3;font-weight: bold;">위치</span> ${CombinedList.urgent_report_location}</div>
    									<div style="margin: 11px 20px 0px 20px;"> ${CombinedList.formatted_createtime}분 ${CombinedList.urgent_report_content}</div>
	    								<img alt="사고난 현장 사진" src="${pageContext.request.contextPath}/resources/assets/img/img_04.png" style="width: 534px;height: 272px; max-width: 92%;  max-height: 100%;margin:20px; border-radius: 10px;">
    								</div>
	    							<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;padding: 10px;">
    									<span id="closeModal2" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; "> 확인	</button></span> 
    								</div>
		   							
    							</div>
  							</div>
  							</c:when>
                       		<c:otherwise>
                       		<div id="reportModal2" class="modal">
  								<div class="modal-content" style="margin:4.5% auto;width: 571px;">
    								<div style="text-align: center;box-shadow:2px 2px 10px #0000001A; border-radius: 10px; display: flex;align-items: center;">    										
    									<div style="margin: 10px 20px;font-weight: bolder; font-size: 15px; color: #fff; background-color: #D31616; border-radius: 17px;width: 60px;height: 33px; display: flex;align-items: center;justify-content: center;"> <span>일반</span></div>
    									<div style="margin: 10px 15px 10px 0;font-weight: bolder; font-size: 15px;">${CombinedList.general_formatted_createtime}</div>
    									<div style="font-weight: bolder; font-size: 15px;">${CombinedList.user_name} 근무자 위치에서 특이사항 전달</div>
    								</div>
    								<div class="situation" >
	                        		
    									<div style="display: flex;margin: 10px;">
		    								<div id="modalmap" style="width:534px;height:273px;margin:10px;border-radius: 10px"></div>
    									</div>
    									<div style="background-color: #0088C30D;padding: 5px 20px;"> <span style="color:#0088C3;font-weight: bold;">위치</span> ${CombinedList.general_report_location} </div>
    									<div style="margin: 11px 20px 0px 20px;"> ${CombinedList.general_formatted_createtime} 분 ${CombinedList.user_name} 근무자 위치에서 ${CombinedList.general_report_content}</div>
	    								<img alt="사고난 현장 사진" src="${pageContext.request.contextPath}/resources/assets/img/img_04.png" style="width: 534px;height: 272px; max-width: 92%;  max-height: 100%;margin:20px; border-radius: 10px;">
    								</div>
	    							<div class="" style="justify-content: center;display: flex;margin-bottom: 25px;padding: 10px;">
    									<span id="closeModal22" class="close"><button class="btn" style="color: #fff; background-color:#003388;width:140px;height: 45px; "> 확인	</button></span> 
    								</div>
		   							
    							</div>
  							</div>
  							</c:otherwise>
							</c:choose>
							</c:forEach>
                        </div>
                      </div>
                    </div>
                    
                    <div class="d-flex align-items-stretch justify-content-between">
                      <div class="w-100">
                        <div style="display: flex;">
                        	<img src="${pageContext.request.contextPath}/resources/assets/img/icon_title.png" class="logo-icon" alt="" style="width: 41px; height: 25px;margin-right: 15px;">
                        	<span style="color: #333333; font-weight: bold; font-size: 20px">메세지</span>
                        </div>
                        <div style="display:flex;justify-content: center;">
                        	<table style="width: 100%;margin-top: 10px; border-top: 1px solid #DDDDDD; text-align: center;border-spacing: 0;">
                        		<thead style="background-color: #F8FAFF;">
                        			<tr>
                        				<th width="20%">근무자명</th>
                        				<th width="30%">내용</th>
                        				<th width="30%">구분</th>
                        				<th width="20%">삭제</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        			<tr>
                        				<td>김길동</td>
                        				<td style="text-decoration: underline;" id="openModalmessage1">근무자 시스템 가입</td>
                        				<td>10월 15일 13:00</td>
                        				<td style="padding:7px;">
                        					<button class="btn" style="color: #fff; background-color:#0088C3;width:100px; "> 삭제	</button>
                        				</td>
                        			</tr>
                        			<tr>
                        				<td>김길동</td>
                        				<td style="text-decoration: underline;" id="openModalmessage2">근무자 시스템 가입</td>
                        				<td>10월 08일 13:00</td>
                        				<td style="padding:7px;">
                        					<!-- <select name="status" class="select">
  												<option value="accept">승인<iconify-icon icon="material-symbols:play-arrow" width="20" height="20" rotate="90deg"></iconify-icon></option>
  												<option value="redirect">거절</option>
											</select> -->
											 <button class="btn" style="color: #fff; background-color:#0088C3;width:100px; "> 삭제	</button>
                        				</td>
                        			</tr>
                        		</tbody>
                        	</table>
                        	<!-- 메시지 모달 -->
                        	<div id="messageModal" class="modal">
  								<div class="modal-content" style="margin:4.5% auto;height: 700px;">
    									<div style="text-align: center;border-bottom:1px solid #DDDDDD; display: flex;align-items: center; justify-content:center; max-width: 95%;margin-left: 2%;padding: 20px 0 10px 0;">
    										<span style="font-weight: bold; color: #313133; font-size: 20px;">차인우</span>
    										<span id="closeModal3" class="close" style="color:#DDDDDD; font-size:40px; position: absolute; top: 5px; right: 25px;">&times;</span> 
    									</div>
    									<div class="chat" style="height: fit-content;margin: 30px;">
    										<img alt="프로필 사진" src="${pageContext.request.contextPath}/resources/assets/img/img_08.png" style="width: 40px;height: 40px; border-radius: 35px;">
    										<span style="font-weight: bold; ">차인우</span>
    										<div style="margin: 0 44px; width: fit-content; background-color: #F8F8F8; border-radius: 8px; padding:5px;"> 안녕하세요!<br> 작업요청드립니다~ </div>
    								  </div>
    								  <div class="chat-messages" id="chatMessages" style="margin-left: auto;">
      										<!-- 채팅 메시지 추가 부분 -->
    								  </div>
    								  <div class="input"  style="background-color: #F8F8F8; height: 65px; border-radius: 10px; position: absolute; bottom: 0px; width:100%;">
    								  	<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_picture.png" style="margin: auto 5px 4px 20px">
    								  	<input type="text" id="messageInput" placeholder="내용을 입력해주세요." style="width: 75%; height: 44px;  margin: 11px auto; border: 1px solid #DDDDDD;">
    									<button id="sendMessageButton" style="background-color: #BEBEBE; color:#fff; border: 1px solid #DDDDDD; border-radius:10px; float: right; margin: 11px;width: 10%;height: 44px;">전송</button>
    								  </div>
  								</div>
                        </div>
                      </div>
                    </div>
     </div>
  <!--end wrapper-->
  </div>
  
<%@ include file="include/footer.jsp"%>
<style>
select{
	width:100px;
	height:35px;
	text-align: center;
	border: 0.67px solie #707070;
	border-radius: 5px;
}
#chatMessages div{
	padding: 10px; 
	margin: 10px; 
	background-color: #0088C30D;
	width: fit-content;
	border-radius: 10px;
	margin-left: auto;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
document.getElementById("messageInput").addEventListener("input", checkInput);
function checkInput() {
	  var inputValue = document.getElementById("messageInput").value;
	  var sendMessageButton = document.getElementById("sendMessageButton");

	  if (inputValue!=="" ) {
		  sendMessageButton.style.backgroundColor = "#003388";
	  } else {
		  sendMessageButton.style.backgroundColor = "#BEBEBE";
	  }
}


  const sendMessageButton = document.getElementById("sendMessageButton");
  const messageInput = document.getElementById("messageInput");
  const chatMessages = document.getElementById("chatMessages");
  function sendMessage(){
	  const messageText = messageInput.value;
	  if (messageText) {
	    const messageElement = document.createElement("div");
	    messageElement.innerText = messageText;
	    chatMessages.appendChild(messageElement);
	    messageInput.value = "";
	  }
  }
  sendMessageButton.addEventListener("click", sendMessage);
  messageInput.addEventListener("keydown", function(event) {
      if (event.key === "Enter") {
        sendMessage();
      }
    });
 
  

  
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/getList.js"></script>