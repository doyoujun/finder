package com.spring.project;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/* 
 * 타이틀: 베이스 프로젝트 KakaoController
 * 파라미터 : -
 * 리턴값 : -
 * 설명 : 카카오톡 SNS 로그인에 대한 설정과 사용자 정보를 받기위한 컨트롤러
 * */

@Controller
public class KakaoController {
	 	
		private final static String K_CLIENT_ID = "b6dc47cf5278f9e45acf48156420e359"; 		//카카오 클라이언트 아이디
	    private final static String K_REDIRECT_URI = "http://localhost:8080/leders/kakaologin"; //카카오톡 SNS 로그인 콜백 함수 주소
	 	
	    // 사용자 접속 토큰을 가져오기 위한 URL을 반환해주는 함수
	    // getAuthorizationUrl에서 반환되는 url을 a 태그 href에 적용
	    public String getAuthorizationUrl(HttpSession session) {

	      String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?"
	          + "client_id=" + K_CLIENT_ID + "&redirect_uri="
	          + K_REDIRECT_URI + "&response_type=code";
	      
	      return kakaoUrl;
	    }
	    
	    
	    /* 
	     * 타이틀: SNS 카카오 로그인 토큰 값 반환 함수
	     * 파라미터 : String autorize_code
	     * 리턴값 : String access_token
	     * 설명 : 사용자 접속 코드를 받아와 카카오톡 접속 토큰을 반환 받는 함수
	     * */
	    public String getAccessToken(String autorize_code) {

	      final String RequestUrl = "https://kauth.kakao.com/oauth/token"; //사용자 토큰을 반환해주기 위해 kakao 에서 지원해주는 api Url
	      final List<NameValuePair> postParams = new ArrayList<NameValuePair>(); // 사용자 토큰을 받기 위해 ArrayList 객체 생성해 사용자 정보 입력 
	      postParams.add(new BasicNameValuePair("grant_type", "authorization_code")); // 접속 코드 타입 'authorization_code' 고정
	      postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID)); // REST API KEY
	      postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URI)); // 리다이렉트 URI
	      postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정 중 얻은 code 값

	      //카카오톡에서 지원하는 RequestUrl에 접근
	      final HttpClient client = HttpClientBuilder.create().build();
	      final HttpPost post = new HttpPost(RequestUrl);
	      JsonNode returnNode = null;

	      try {

	        post.setEntity(new UrlEncodedFormEntity(postParams)); // RequestUrl 접근 후 사용자의 정보를 담은 postParams 객체를 전달
	        //반환되는 사용자데이터를 받기위한 HttpResponse 객체 생성
	        final HttpResponse response = client.execute(post);
	        final int responseCode = response.getStatusLine().getStatusCode();

	        // JSON 형태 반환값 처리
	        ObjectMapper mapper = new ObjectMapper();
	        returnNode = mapper.readTree(response.getEntity().getContent());

	      } catch (UnsupportedEncodingException e) {

	        e.printStackTrace();

	      } catch (ClientProtocolException e) {

	        e.printStackTrace();

	      } catch (IOException e) {

	        e.printStackTrace();

	      } finally {
	        // clear resources
	      }
	      return returnNode.get("access_token").toString(); //사용자 접근 토큰(access_token) 값 반환
	    }

	    
	    /* 
	     * 타이틀: SNS 카카오 로그인 사용자 정보 출력
	     * 파라미터 : String autorize_code,HttpSession session
	     * 리턴값 : JsonNode returnNode(사용자 정보)
	     * 설명 : SNS 카카오톡 접속 한 사용자에 대한 정보를 가져오기 위한 함수
	     * */
	    public JsonNode getKakaoUserInfo(String autorize_code,HttpSession session) {

	      //사용자 토큰을 반환해주기 위해 kakao 에서 지원해주는 api Url
	      final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
	      
	      String CLIENT_ID = K_CLIENT_ID; // REST API KEY
	      String REDIRECT_URI = K_REDIRECT_URI; // 리다이렉트 URI
	      String code = autorize_code; // 로그인 과정중 얻은 토큰 값
	      
	      //카카오톡에서 지원하는 RequestUrl에 접근
	      final HttpClient client = HttpClientBuilder.create().build();
	      final HttpPost post = new HttpPost(RequestUrl);
	      
	      String accessToken = getAccessToken(autorize_code);//getAccessToken 함수를 통해 토큰 값 받아옴
	      session.setAttribute("access_Token",accessToken); // 세션에 토큰값 저장
	      // add header	      
	      post.addHeader("Authorization", "Bearer " + accessToken); //사용자에 대한 토큰값을 HttpPost 객체에 토큰값 입력

	      JsonNode returnNode = null; //사용자 데이터 받을 jsonNode 객체 생성

	      try {

	        final HttpResponse response = client.execute(post); //HttpPost 객체에 담긴 사용자 접속 토큰을 execute함수를 통해 전달
	        final int responseCode = response.getStatusLine().getStatusCode(); // 카카오톡 로그인 상태 값을 반환(접속 성공, 접속 실패)
	        System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	        System.out.println("Response Code : " + responseCode);
	        
	        
	        // JSON 형태 반환값 처리
	        ObjectMapper mapper = new ObjectMapper();
	        returnNode = mapper.readTree(response.getEntity().getContent());
	      } catch (UnsupportedEncodingException e) {

	        e.printStackTrace();
	      } catch (ClientProtocolException e) {

	        e.printStackTrace();
	      } catch (IOException e) {

	        e.printStackTrace();
	      } finally {

	        // clear resources
	      }
	      return returnNode;
	    }
	    
	    /* 
	     * 타이틀: SNS 카카오 로그아웃
	     * 파라미터 : String access_Token
	     * 리턴값 : -
	     * 설명 : SNS 카카오톡 로그아웃을 하기위한 함수
	     * */
	    public void kakaoLogout(String access_Token) {
	    	//사용자 로그아웃을 실행하기 위해 kakao 에서 지원해주는 api Url
	        String reqURL = "https://kapi.kakao.com/v1/user/logout";
	        try {
	            URL url = new URL(reqURL); //URL 객체에 reqURL를 삽입해 url 형태로 캐스팅
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection(); //로그아웃을 위한 url 소스코드를 이용해 연결
	            conn.setRequestMethod("POST"); // 연결된 로그아웃 페이지에 Post 형태로 데이터 전달 설정
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token.replaceAll("\"", ""));//로그아웃 페이지에 사용자 접근 토큰값 설정
	            
	            int responseCode = conn.getResponseCode(); // 로그아웃 페이지에서 반환 해주는 결과값 저장(로그아웃 성공, 실패)
	            System.out.println("responseCode : " + responseCode);
	            
	            //로그아웃에서 반환해주는 로그아웃 관련 Buffer 정보를 읽어 로그아웃 진행
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            
	            String result = "";
	            String line = "";
	            
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println(result);
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }

	    
}
