package com.spring.project.Dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.spring.project.Dto.dataDTO;


public class PrincipalDetails implements UserDetails{


	private static final long serialVersionUID = 1L;

	
	
	private dataDTO dataDto;
	private Map<String, Object> attributes;
	
	

	
	public PrincipalDetails(dataDTO dataDto) {
		this.dataDto = dataDto;
	}

	
	
	public PrincipalDetails(dataDTO dataDto, Map<String, Object> attributes) {
		this.dataDto = dataDto;
		this.attributes = attributes;
	}


	//계정이 가지고있는 권한 목록을 리턴
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		
		grantedAuthorities.add(new SimpleGrantedAuthority(dataDto.getEnterprise_role()));
		
		System.out.println(dataDto.getEnterprise_role());
		
		return grantedAuthorities;
	}

	//계정의 비밀번호 리턴
	@Override
	public String getPassword() {
		
		return dataDto.getEnterprise_pw();
	}

	//계정의 id를 리턴
	@Override
	public String getUsername() {
		
		return dataDto.getEnterprise_id();
	}

	//계정이 만료되지 않았는지 리턴한다. (true:만료안됨)
	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	//계정이 잠겨있지 않았는지 리턴한다. (true:잠기지 않음)
	@Override
	public boolean isAccountNonLocked() {
		
		return true;
	}

	//비밀번호가 만료되지 않았는지 리턴한다. (true: 만료안됨)
	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}

	//계정이 활성화 되어있는지 리턴한다. (true: 활성화)
	@Override
	public boolean isEnabled() {
		
		return true;
	}

	public Map<String, Object> getAttributes() {
		return attributes;
	}
	
	public int getEnterprise_index() {
		return dataDto.getEnterprise_index();
	}
	
	public String getenterpirse_name() {
		return dataDto.getEnterprise_name();
	}
	
	public String getenterprise_id() {
		return dataDto.getEnterprise_id();
	}
	
	public String getenterprise_pw() {
		return dataDto.getEnterprise_pw();
	}
	
	public String getenterprise_terminal() {
		return dataDto.getEnterprise_terminal();
	}
	
	public String getenterprise_companycode() {
		return dataDto.getEnterprise_companycode();
	}
	
	public String getenterprise_createtime() {
		return dataDto.getEnterprise_createtime();
	}
	
	public String getenterprise_updatetime() {
		return dataDto.getEnterprise_updatetime();
	}
	
	public int getenterprise_enterprise_info_index() {
		return dataDto.getEnterprise_enterprise_info_index();
	}
	
	public String getenterprise_role() {
		return dataDto.getEnterprise_role();
	}
	
	public int getenterprise_info() {
		return dataDto.getEnterprise_enterprise_info_index();
	}
}


