package com.spring.project.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.spring.project.Dto.dataDTO;



@Service
public class PrincipalDetailsService implements UserDetailsService{

	@Autowired
	private user_Dao user_Dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		dataDTO dataDto = null;
		
		try {
			dataDto = user_Dao.findUserByUsername(username);
			
			System.out.println("userDetailsService : " + username);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new UsernameNotFoundException(username);
		}
		
		if(dataDto == null) {
			throw new UsernameNotFoundException(username + "사용자이름을 사용할 수 없습니다.");
		}
		
		
		
		return new PrincipalDetails(dataDto);
	}

}
