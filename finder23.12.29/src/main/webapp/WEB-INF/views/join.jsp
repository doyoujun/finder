<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
<title>join Page</title>
<style>
::placeholder {
    color: #DDDDDD; /* 원하는 색상 설정 */
}
</style>
</head>
<body style="margin:0px;">
	<!-- 
		onsubmit : form submit 하기전 실행되는 함수 설정
		method : 데이터 전달 형식 설정(Post, GET)
		action : submit 실행 시 데이터를 전송할 Controller URL 입력 
	 -->
	<div style="width:100%;height:120px;background-color: #F8FAFE;border-bottom: 1px solid #AFCDFF;">
		<div style="">
			<img src="${pageContext.request.contextPath}/resources/assets/img/logo.png" class="logo-icon" alt="파인드이알 로고" style="width: 152px; height: 61px;margin: 29px 72px;cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/'">
		</div>
		<div style="display:none;" id="context">${pageContext.request.contextPath}</div>
	</div>
			<div class="">
			<h2 style="text-align: center; margin:50px auto 30px auto;">회원가입</h2>
				<div class="" style="display:flex; justify-content: center;">
					<!-- 토큰 삽입 -->					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
					<!-- 정보입력  -->
					
					<div direction="column" class="" style="background: #fff; width:800px;justify-content: center;" >
						<form action="${pageContext.request.contextPath}/joinform" method="POST" id="joinform">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="sc-lcujXC bnKPcn" style="width: 72%; margin: 0 auto;">
								<div class=" ">
									<div class=" ">
										<div class="" style="color: #555555;">관리자명 <span style="color:red;">*</span></div> 
										<div class="" style="margin-top: 5px; ">
											<input type="text" class="" id="name" style="padding: 0 20px; height: 46px; border-radius: 10px; width: 100%; border: 1px solid #DDDDDD;" placeholder="관리자명을 입력해주세요." name="name">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">아이디 <span style="color:red;">*</span></div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="id" style="padding: 0 20px; height: 46px; border-radius: 10px; width: 100%;border: 1px solid #DDDDDD;" placeholder="아이디를 입력해주세요." name="id">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">비밀번호 <span style="color:red;">*</span></div>
										<div class="" style="margin-top: 5px;">
											<input type="password" class="" id="password" style="padding: 0 20px; height: 46px; border-radius: 10px; width: 100%;border: 1px solid #DDDDDD;" placeholder="비밀번호를 입력해주세요." name="password">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">비밀번호 확인 <span style="color:red;">*</span></div>
										<div class="" style="margin-top: 5px;">
											<input type="password" class="" id="password_check" style="padding: 0 20px; height: 46px; border-radius: 10px; width: 100%;border: 1px solid #DDDDDD;" placeholder="비밀번호를 한번 더 입력해주세요.">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">터미널 명칭 <span style="color:red;">*</span></div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="terminalname" style="padding: 0 20px; height: 46px; border-radius: 10px; width: 100%;border: 1px solid #DDDDDD;" placeholder="터미널명칭을 입력해주세요." name="terminalname">
										</div>
									</div>
								</div>
								<div class=" " style="margin-top: 25px;">
									<div class=" ">
										<div class="" style="color: #555555;">기업코드 <span style="color:red;">*</span></div>
										<div class="" style="margin-top: 5px;">
											<input type="text" class="" id="companycode" style="padding: 0 20px; height: 46px; border-radius: 10px; width: 100%;border: 1px solid #DDDDDD;" placeholder="기업코드를 입력해주세요." name="companycode">
										</div>
									</div>
								</div>
							</div>
							<div class="">
								<span id="input-error" style="color: #D31616; display: none; justify-content: center; margin-top:20px;"></span>
							</div>
							<div class="" style="display: flex; margin-top: 30px; justify-content: center;">
								<button type="button" style=" cursor:pointer; margin: 0; font-size: 16px; border: none; color: #fff; width: 230px; height: 50px; background: #003388; border-radius: 12px;" color="#fff" id="join" type="button" onclick="join1_btn()">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
</body>
</html>
 <script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/signup.js"></script>