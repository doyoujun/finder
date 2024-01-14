package com.spring.project;
import java.io.IOException;



import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class CORSFilter implements Filter {

	 /* 
	 * 타이틀: 크로스 도메인 필터 클래스
	 * 파라미터 : -
	 * 리턴값 : -
	 * 설명 : 웹에서 자주 발생하는 크로스 도메인 이슈를 해결하기 위한 클래스
	 * */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) res;
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE"); //Post, Get 형식과 같은 페이지 접근 방식을 허용
        response.setHeader("Access-Control-Max-Age", "3600"); // 허용할 포트번호 설정

        response.setHeader("Access-Control-Allow-Headers", "x-requested-with");  //허용할 데이터 전송 방식 설정       

        /* *을통해  내가 허용하고 싶은 모든  크로스 도메인을 허용하게된다. 여러 도메인의 경우 여러번 설정하면된다. */
        response.setHeader("Access-Control-Allow-Origin", "*");  // 접근 허용할 도메인 설정

        chain.doFilter(req, res); //FilterChain 객체의 doFilter 함수를 이용해 설정된 값을 서비스 중인 웹에 적용

    }

    public void init(FilterConfig filterConfig) {}

    public void destroy() {}

}