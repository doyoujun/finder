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
<script src="<%=request.getContextPath()%>/resources/assets/js/ckeditor/ckeditor.js"></script>
  <!--start wrapper-->
  <div class="wrapper" style="margin: 100px 0px 0px 260px; padding: 45px 150px 24px 150px; background-color: #fff;height: 934px;">
  <h3 style="text-align: center; font-weight: bold;">공지사항 등록</h3>
		
       <!--start content-->
      	<div style="display: flex;justify-content: center;margin:70px auto 25px auto; ">
      		<select style="border: 0.67px solid #DDDDDD; border-radius: 5px; width: 130px; height: 52px;margin-right: 20px;text-align: center;" onchange="select(this)">
      			<option value="" selected disabled>공지/긴급</option>
      			<option value ="0">공지</option>
      			<option value ="1">긴급</option>
      		</select>
      		<input type="text" class="" id="noticetitle" style="padding: 0 20px; height: 52px; border-radius: 5px; width: 582px;border: 0.67px solid #DDDDDD;" placeholder="제목을 입력해주세요." name="noticetitle">   		
       		<input type="text" name="managername" id="managername" style="display: none;" value="${username}">
       	</div>
       	<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
		<div style="width: 1247px;margin: 0px auto; ">
      		<textarea rows="5" cols="50" id="gdsDes1" class="event-editor mt-4" name="event_contents" ></textarea>
				<script>
					CKEDITOR.replace("gdsDes1",{
						filebrowserUploadUrl : '${pageContext.request.contextPath}/goods/ckUploads?${_csrf.parameterName}=${_csrf.token}'
					});
				</script>
      		
      	</div>
      	<div class="" style="display: flex; margin-top: 55px; justify-content: center;">
			<button type="button" style=" cursor:pointer; margin: 0; font-size: 16px; border: none; color: #fff; width: 122px; height: 50px; background: #003388; border-radius: 12px;" color="#fff" id="noticeRegist" type="button" >등록</button>
		</div>
  <!--end wrapper-->
  </div>
   
<style>
.cke_editable {
	height:400px;
}
</style>
<%@ include file="include/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
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
let selected = 0;

function select(index) {
	var num = $(index).val();
	
	
	selected = num;
}

$(document).ready(function() {
    // CKEditor 초기화
    CKEDITOR.replace('gdsDes1');
    
    // noticeRegist 버튼 클릭 이벤트
    $('#noticeRegist').click(function() {
        // CKEditor에서 내용 가져오기
        var editor = CKEDITOR.instances['gdsDes1'];
        var content = editor.getData();
        
        var textContent = $('<div>' + content + '</div>').text();
        alert(textContent);
        
					
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		
		$.ajax({
    			async: false,
    			type: "post",
    			url: $("#context").text()+'/createNotice',
    			data: {
    				notice_category : selected,
    				notice_writer : $("#managername").val(),
    				notice_title : $("#noticetitle").val(),
    				notice_view : 1,
    				notice_content : textContent,
    				notice_img : 1
    				
    			},
    			beforeSend: function(xhr) {
    			xhr.setRequestHeader(header, token);
    			},
    			success: (response) => {
    				
    					location.href = $("#context").text()+"/notice";
    			},
    					error: (error) => {
    				}
    		});
        
        
    });
});
</script>
