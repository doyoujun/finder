<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<%@ include file="include/head.jsp"%>
<%@ include file="include/navbar.jsp"%>
<%@ include file="include/sidebar.jsp"%>

  <!--start wrapper-->
  <div class="wrapper" style="margin: 100px 0px 0px 260px; padding: 45px 150px 24px 150px; background-color: #fff;height: 934px;">
  <h3 style="text-align: center; font-weight: bold;">공지사항</h3>
		
       <!--start content-->
       			<div class="d-flex justify-content-center" style="margin:40px;">
       				<div style="background-color: #F6F6F6;border-radius: 23px; width: 715px;">
       					<button type="button" style="cursor:pointer;width: 174px; height: 45px; background-color: #fff; border: 1px solid #003388; border-radius: 23px;">긴급</button>
       					<button type="button" style="cursor:pointer;width: 174px; height: 45px; background-color: #F6F6F6; color:#A9A9A9;border:none;  border-radius: 23px;">실시간</button>
       					<button type="button" style="cursor:pointer;width: 174px; height: 45px; background-color: #F6F6F6; color:#A9A9A9;border:none; border-radius: 23px;">월간</button>
       					<button type="button" style="cursor:pointer;width: 174px; height: 45px; background-color: #F6F6F6; color:#A9A9A9;border:none; border-radius: 23px;">주간</button>
       				</div>
       			</div>
       			<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
                     <div class="d-flex align-items-stretch justify-content-between">
                      <div class="w-100">
                        <div style="display:flex;justify-content: center;">
                        	<table style="width: 100%;  margin-top: 10px; border-top: 1px solid #DDDDDD; text-align: center;border-spacing: 0; margin-bottom:30px;">
                        		<thead style="background-color: #F8FAFF;height:60px;">
                        			<tr>
                        				<th width="10%">번호</th>
                        				<th width="30%">제목</th>
                        				<th width="10%">작성자</th>
                        				<th width="20%">등록일</th>
                        				<th width="10%">조회수</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        		<c:forEach items="${noticeList}" var = "noticeList" varStatus="status">
                        		<c:choose>
                        		<c:when test="${noticeList.notice_category == 0}">
                        			<tr>
                        				<td>${totalLength + status.count}</td>
                        				<td style="display: flex;justify-content: start;align-items: center;" data-index="${status.index}" id="click${status.index}" onclick="notice('${pageContext.request.contextPath}/notice_detail/${noticeList.notice_index}', ${noticeList.notice_index})">
                        					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_notice_02.png" style="width: 51px; height: 26px;margin-right: 15px; ">${noticeList.notice_title}
                        				</td>
                        				<td>${noticeList.notice_writer}관리자</td>
                        				<td>${noticeList.formatted_createtime}</td>
                        				<td>${noticeList.notice_view}</td>
                        			</tr>
                        		</c:when>
                        		<c:otherwise>	
                        			<tr>
                        				<td>${totalLength + status.count}</td>
                        				<td style="display: flex;justify-content: start;align-items: center;" data-index="${status.index}" id="click${status.index}" onclick="notice('${pageContext.request.contextPath}/notice_detail/${noticeList.notice_index}', ${noticeList.notice_index})">
                        					<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_notice_01.png" style="width: 51px; height: 26px;margin-right: 15px; ">${noticeList.notice_title}
                        				</td>
                        				<td>${noticeList.notice_writer}관리자</td>
                        				<td>${noticeList.formatted_createtime}</td>
                        				<td>${noticeList.notice_view}</td>
                        			</tr>
                        		</c:otherwise>
								</c:choose>
								</c:forEach>	
                        		</tbody>
                        	</table>
							</div>
                        </div>
                      </div>
                      <button type="button" style="float:right; cursor:pointer; margin: 0; font-size: 16px; border: none; color: #fff; width: 163px; height: 50px; background: #003388; border-radius: 12px;" color="#fff" id="vehicleRegist" onclick="location.href='${pageContext.request.contextPath}/noticeRegist'">공지사항 등록</button>
                    
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
  
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/noticelist.js"></script>