<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Login Page</title>
<style>

</style>
</head>
<body>
	<!-- 
		onsubmit : form submit 하기전 실행되는 함수 설정
		method : 데이터 전달 형식 설정(Post, GET)
		action : submit 실행 시 데이터를 전송할 Controller URL 입력 
	 -->
	<form onsubmit="return validate();" name="" method="POST" action="userjoin">
			<div class="">
				<div class="">
					<!-- 토큰 삽입 -->					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
					<!-- 정보입력  -->
					<section id="" class=" ">
						<div class="">
							<div class="">
								<div class="">
									<h5 class="">가입자 정보</h5>
								</div>
								<div class="">
									<label>아이디</label>
								</div>
								<div class="">
									<div class="">
										<input type="text" id="user_id" name="user_id" class="" > 
									</div>
								</div>
								
								<div class="">
									<label>비밀번호</label>
								</div>
								<div class="">
									<div class="">
										<input type="password" id="user_pw" name="user_pw" class="" > 
									</div>
								</div>
								
								<div class="">
									<label>이메일</label>
								</div>
								<div class="">
									<div class="">
										<input type="text" id="user_email" name="user_email" class="" > 
									</div>
								</div>
								
								<div class="">
									<label>이름</label>
								</div>
								<div class="">
									<div class="">
										<input type="text" id="user_name" name="user_name" class="" > 
									</div>
								</div>
								
								<div class="">
									<label>전화번호</label>
								</div>
								<div class="">
									<div class="">
										<input type="text" id="user_tel" name="user_tel" class="" > 
									</div>
								</div>
								
								<div class="">
									<label>성별</label>
								</div>
								<div class="">
									<div class="">
										<input type="radio" id="" name="user_sex" class="" value="남"> 
										<input type="radio" id="" name="user_sex" class="" value="여"> 
									</div>
								</div>
								
								<div class="">
									<label>주소</label>
								</div>
								<div class="">
									<div class="">
										<input type="text" id="sample6_postcode" name="user_zipcode" placeholder="우편번호"  class="">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class=""><br>
										<input type="text" id="sample6_address" placeholder="주소" name="user_add" class=""><br>
										<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="user_adddetail" class="">
									</div>
								</div>							
							</div>
						</div>
					</section>
					<!-- 약관동의 -->
	
					<!--가입 버튼-->
					<section id="" class=" ">
						<div class="">
							<div class="">
								<div class="">
									<button type="submit" class="" >가입</button>
								</div>
							</div>
						</div>
					</section>
					<!--가입 버튼-->
				</div>
			</div>
	</form>  
</body>
</html>
<!-- 주소 API를 CDN 형태로 가져옴 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소 API 함수
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script language="javascript">
      function validate() {
          var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
          var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
          // 이메일이 적합한지 검사할 정규식

          //회원가입시 Form에 입력 되는 변수
          var user_id = document.getElementById("user_id");
          var user_pw = document.getElementById("user_pw");
          var user_email = document.getElementById("user_email");
          var user_name = document.getElementById("user_name");
          var user_tel = document.getElementById("user_tel"); 
          var user_sex = document.querySelector('input[name="user_sex"]').checked; // 체크 여부(checked)
          
          //사용자 주소 정보
          var sample6_postcode = document.getElementById("sample6_postcode"); 
          var sample6_address = document.getElementById("sample6_address"); 
          var sample6_detailAddress = document.getElementById("sample6_detailAddress"); 
          
 
          if(user_id.value=="") {
              alert("아이디를 입력해주세요.");
              user_id.focus();
              return false;
          }  
          if(user_pw.value=="") {
              alert("비밀번호를 입력해주세요.");
              user_pw.focus();
              return false;
          } 
          if(user_email.value=="") {
              alert("이메일을 입력해주세요.");
              user_email.focus();
              return false;
          } 
          if(user_name.value=="") {
              alert("이름을 입력해주세요.");
              user_name.focus();
              return false;
          } 
          if(user_tel.value=="") {
              alert("번호를 입력해주세요.");
              user_tel.focus();
              return false;
          } 
          if(user_sex==false) {
              alert("성별을 선택해주세요.");              
              document.getElementsByName("user_sex")[0].focus();
              return false;
          } 
          if(sample6_postcode.value=="") {
              alert("우편번호를 입력해주세요.");
              sample6_postcode.focus();
              return false;
          } 
          if(sample6_address.value=="") {
              alert("주소를 입력해주세요.");
              sample6_postcode.focus();
              return false;
          }
          if(sample6_detailAddress.value=="") {
              alert("상세주소를 입력해주세요.");
              sample6_detailAddress.focus();
              return false;
          }
          alert("등록이 완료되었습니다.");
          return false;
 
      }   
      //정규식을 사용할 시 사용하는 check 함수
      function check(re, what, message) {
          if(re.test(what.value)) {
              return true;
          }
          alert(message);
          what.value = "";
          what.focus();
          //return false;
      }         
 </script>