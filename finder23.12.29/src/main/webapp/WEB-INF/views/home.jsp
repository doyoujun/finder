<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="include/head.jsp"%>


  <!--start wrapper-->
  <div class="wrapper" style="height: 923px;">
	<%@ include file="include/navbar.jsp"%>
	<%@ include file="include/sidebar.jsp"%>
		
        

       <!--start content-->
          <main class="page-content" style="display: flex;flex-direction: column;align-items: center;padding: 1.7rem 0px 0px 0px"> <!-- overflow-x: auto;white-space: nowrap; -->
            <div style="display:none;" id="context">${pageContext.request.contextPath}</div>  
            <div class="row" style="width: 1247px; height: 160px;">
              <div class="col-md-4" >
                <div class="card overflow-hidden radius-10">
                    <div class="card-body" style="background-color: #ECF6FF;">
                     <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                      <div class="w-100">
                        <p style="font-size: 20px; font-weight: bold;">현재 근무자 수</p>
                        <div style="display:flex;justify-content: center;">
                        	<h4 class="" style="font-size:55px; color: #2F62C6;">${working}</h4> 
                        	<span style="font-size:35px;color:#707070;margin:auto 10px;font-weight: bold;"> 명</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
               </div>
               <div class="col-md-4" >
                <div class="card overflow-hidden radius-10">
                    <div class="card-body" style="background-color: #F6F4FF;">
                     <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                      <div class="w-100">
                        <p style="font-size: 20px; font-weight: bold;">진행 업무 건</p>
                        <div style="display:flex;justify-content: center;">
                        	<h4 class="" style="font-size:55px; color: #5D45D6;">${workList}</h4>
                        	<span style="font-size:35px;color:#707070;margin:auto 10px;font-weight: bold;"> 건</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
               </div>
               <div class="col-md-4" >
                <div class="card overflow-hidden radius-10">
                    <div class="card-body" style="background-color: #FFECE6;">
                     <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                      <div class="w-100">
                        <p style="font-size: 20px; font-weight: bold;">현재 완료업무</p>
                        <div style="display:flex;justify-content: center;">
                        	<h4 class="" style="font-size:55px; color: #EB6938;">${list}</h4>
                        	<span style="font-size:35px;color:#707070;margin:auto 10px;font-weight: bold;"> 건</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
               </div>
            </div><!--end row-->

            <div class="row" style="position: relative;">
            <img alt="" src="${pageContext.request.contextPath}/resources/assets/img/icon_re.png" style="width: 60px; height: 35px; position: absolute;right: 35px;z-index: 999;top: 45px; cursor: pointer;" onclick="refreshKakaoMap()">
                    <div id="map" style="width:1223px;height:523px;margin:20px;"></div>
            </div><!--end row-->

			<div class="row" style="width: 1247px;display: flex;">
              <div class="col" style="width: 395px; height: 160px;">
                <div class="card overflow-hidden radius-10" style="width: 395px; height: 160px;">
                    <div class="card-body" style="background-color: #F0F0F0;height: 160px; text-align: center">
                     <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                      <div class="w-100">
                        <div style="display:flex;justify-content: center;padding: 40px;">
                        	<span onclick="location.href='${pageContext.request.contextPath}/notification'" style="font-size:25px;color:#333333;margin:auto;font-weight: bold; text-decoration: underline; cursor: pointer;">회원가입/ 정보변경 요청</span>
                        </div>
                        	<iconify-icon icon="emojione-monotone:letter-n" style="color: red;position: absolute;top: 20px;right: 20px;" width="20" height="20"></iconify-icon>
                      </div>
                    </div>
                  </div>
                </div>
               </div>
               <div class="col">
                <div class="card overflow-hidden radius-10">
                    <div class="card-body" style="background-color: #F0F0F0;height: 160px; text-align: center">
                     <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                      <div class="w-100">
                        <div style="display:flex;justify-content: center;padding: 40px">
                        	<span onclick="location.href='${pageContext.request.contextPath}/notification'" style="font-size:25px;color:#333333;margin:auto;font-weight: bold;text-decoration: underline;cursor: pointer;">실시간 보고</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
               </div>
               <div class="col">
                <div class="card overflow-hidden radius-10">
                    <div class="card-body" style="background-color: #F0F0F0;height: 160px;text-align: center">
                     <div class="d-flex align-items-stretch justify-content-between overflow-hidden">
                      <div class="w-100">
                        <div style="display:flex;justify-content: center;padding: 40px;">
                        	<span onclick="location.href='${pageContext.request.contextPath}/notification'" style="font-size:25px;color:#333333;margin:auto;font-weight: bold;text-decoration: underline;cursor: pointer;">메세지</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
               </div>
         </div><!--end row-->
          </main>
       <!--end page main-->

       <!--start overlay-->
        <div class="overlay nav-toggle-icon"></div>
       <!--end overlay-->

       <!--start footer-->
       <!-- <footer class="footer">
        <div class="footer-text">
           Copyright © 2022. All right reserved.
        </div>
        </footer> -->
        <!--end footer-->


       <!--Start Back To Top Button-->
		     <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
       <!--End Back To Top Button-->

       <!--start switcher-->
       <div class="switcher-body">
        <button class="btn btn-primary btn-switcher shadow-sm" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class="bi bi-paint-bucket me-0"></i></button>
        <div class="offcanvas offcanvas-end shadow border-start-0 p-2" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling">
          <div class="offcanvas-header border-bottom">
            <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Theme Customizer</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
          </div>
          <div class="offcanvas-body">
            <h6 class="mb-0">Theme Variation</h6>
            <hr>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="LightTheme" value="option1">
              <label class="form-check-label" for="LightTheme">Light</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="DarkTheme" value="option2">
              <label class="form-check-label" for="DarkTheme">Dark</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="SemiDarkTheme" value="option3">
              <label class="form-check-label" for="SemiDarkTheme">Semi Dark</label>
            </div>
            <hr>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="MinimalTheme" value="option3" checked>
              <label class="form-check-label" for="MinimalTheme">Minimal Theme</label>
            </div>
            <hr/>
            <h6 class="mb-0">Header Colors</h6>
            <hr/>
            <div class="header-colors-indigators">
              <div class="row row-cols-auto g-3">
                <div class="col">
                  <div class="indigator headercolor1" id="headercolor1"></div>
                </div>
                <div class="col">
                  <div class="indigator headercolor2" id="headercolor2"></div>
                </div>
                <div class="col">
                  <div class="indigator headercolor3" id="headercolor3"></div>
                </div>
                <div class="col">
                  <div class="indigator headercolor4" id="headercolor4"></div>
                </div>
                <div class="col">
                  <div class="indigator headercolor5" id="headercolor5"></div>
                </div>
                <div class="col">
                  <div class="indigator headercolor6" id="headercolor6"></div>
                </div>
                <div class="col">
                  <div class="indigator headercolor7" id="headercolor7"></div>
                </div>
                <div class="col">
                  <div class="indigator headercolor8" id="headercolor8"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
       </div>
       <!--end switcher-->

  </div>
  <!--end wrapper-->
<%@ include file="include/footer.jsp"%>
<script type="text/javascript">
var container = document.getElementById('map');
var options = {
		center: new kakao.maps.LatLng(35.105530, 129.084726),
		level: 3,
};

var map = new kakao.maps.Map(container, options);
map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);	//스카이뷰 지도 유형으로 설정

function refreshKakaoMap(){
	var container = document.getElementById('map');
	var options = {
			center: new kakao.maps.LatLng(35.105530, 129.084726),
			level: 3,
	};

	var map = new kakao.maps.Map(container, options);
	map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);	//스카이뷰 지도 유형으로 설정
}
</script>
<script src="${pageContext.request.contextPath}/resources/assets/js/enterprise/notification.js"></script>