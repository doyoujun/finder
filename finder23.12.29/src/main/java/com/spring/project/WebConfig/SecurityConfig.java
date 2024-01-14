package com.spring.project.WebConfig;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.spring.project.Dao.PrincipalDetailsService;
import com.spring.project.WebConfig.auth.AuthFailureHandler;


//스프링 MVC와 스프링 시큐리티를 결합하는 용도
@EnableWebSecurity
//xml을 대신해 설정한다.
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	
	@Autowired
	private PrincipalDetailsService principalDetailsService;
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		
		web.ignoring().antMatchers("/resources/assets/**", "/css/**", "/js/**", "/img/**");
	}



	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.userDetailsService(principalDetailsService).passwordEncoder(passwordEncoder());
	}
	
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		
		
		http
		
		
		.authorizeRequests()
		.antMatchers("/").access("hasRole('ROLE_ADMIN')")

		.and()
		.formLogin() //로그인 수행
		.loginPage("/login")
		.loginProcessingUrl("/login")
		.defaultSuccessUrl("/")
		.failureHandler(new AuthFailureHandler())
		.usernameParameter("username")
		.passwordParameter("password")
		.and()
		.logout() //로그아웃 수행
		.logoutUrl("/logout")
		.logoutSuccessUrl("/login")
		
		.and()
		.csrf()
		.and()
		.headers()
		.frameOptions()
		.disable();
			
		
			
	}
}
