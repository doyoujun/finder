package com.spring.project.Dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.Dto.dataDTO;

@Service
public class user_ServiceImpl implements user_Service {

	@Autowired
	private user_Dao user_dao;
	
	@Autowired
	private final PasswordEncoder passwordEncoder;
	
	public user_ServiceImpl() {
		this.user_dao = null;
		this.passwordEncoder = null;
		
	}


	public user_ServiceImpl(SqlSession sqlSession, PasswordEncoder passwordEncoder) {
		this.user_dao = sqlSession.getMapper(user_Dao.class);
		this.passwordEncoder = passwordEncoder;
	}
	
	public void regist(dataDTO dataDto) throws Exception {
		dataDto.setEnterprise_pw(passwordEncoder.encode(dataDto.getEnterprise_pw()));
		user_dao.insert_user_userInsert(dataDto);
	}

	//계정 회원가입
	@Override
	public int userInsert(dataDTO datadto) {		
		
		datadto.setEnterprise_pw(passwordEncoder.encode(datadto.getEnterprise_pw()));
		
		
		return user_dao.insert_user_userInsert(datadto);
	}


	@Override
	public List<dataDTO> urgentload(dataDTO dataDTO) {
		return user_dao.urgentload(dataDTO);
	}


	@Override
	public dataDTO details(int urgent_no) {
		System.out.println("긴급보고 디테일");
		dataDTO dto = user_dao.urgentDetails(urgent_no);
		System.out.println(dto.getEnterprise_name());
		
		return dto;
	}


	


	@Override
	public List<dataDTO> generalload(dataDTO dataDTO) {
		return user_dao.generalload(dataDTO);
	}


	@Override
	public List<dataDTO> updateUser() {
		
		return user_dao.userUpdate();
	}


	@Override
	public List<dataDTO> userApprove() {
		
		return user_dao.userappove();
	}


	@Override
	public int updateUser(dataDTO dataDTO) {
		
		System.out.println("정보 수정");
		return user_dao.userUpdateApprove(dataDTO);
	}


	@Override
	public int userUpdateApprove(dataDTO dataDTO) {
		
		return user_dao.userChange(dataDTO);
	}


	@Override
	public int createContainer(dataDTO dataDTO) {
		
		return user_dao.createContainer(dataDTO);
	}


	@Override
	public List<dataDTO> containerList() {
		
		return user_dao.containerList();
	}


	@Override
	public int createNotice(dataDTO dataDTO) {
		
		return user_dao.createNotice(dataDTO);
	}


	@Override
	public List<dataDTO> noticeList() {
		
		return user_dao.noticeList();
	}


	
	 @Override public List<dataDTO> searchContainer(String title) {
	 
		 System.out.println("service" + title);
	 return user_dao.searchContainer(title); }


	@Override
	public int createEnterprise(dataDTO dataDTO) {
		
		return user_dao.createEnterpise(dataDTO);
	}


	@Override
	public List<dataDTO> EnterpriseList(int enterpriseNumber) {
		
		return user_dao.EnterpriseList(enterpriseNumber);
	}


	@Override
	public boolean checkData(dataDTO dataDTO) {
		List<dataDTO> List = user_dao.enterpriseCheck(dataDTO);
		
		System.out.println(List.size());
		
		return !List.isEmpty();
	}


	@Override
	public List<dataDTO> userEnterpriseList(int enterpriseNumber) {
		
		return user_dao.userEnterpriseList(enterpriseNumber);
	}


	@Override
	public int createWork(dataDTO dataDTO) {
		
		return user_dao.createWork(dataDTO);
	}


	@Override
	public List<dataDTO> workList(int enterpriseNumber) {
		
		return user_dao.workerList(enterpriseNumber);
	}


	@Override
	public List<dataDTO> workcompleteList(int enterpriseNumber) {
		
		return user_dao.workcompleteList(enterpriseNumber);
	}


	@Override
	public List<dataDTO> working(int enterpriseNumber) {
		
		return user_dao.working(enterpriseNumber);
	}


	@Override
	public List<dataDTO> noticedetails(dataDTO dataDTO) {
		
		return user_dao.noticedetails(dataDTO);
	}


	@Override
	public List<dataDTO> noticeBef(dataDTO datadto) {
		return user_dao.noticeBef(datadto);
	}


	@Override
	public List<dataDTO> noticeAft(dataDTO datadto) {
		return user_dao.noticeAft(datadto);
	}


	@Override
	public int updatenotice(dataDTO dataDTO) {
		
		return user_dao.updatenotice(dataDTO);
	}


	@Override
	public int updateview(dataDTO dataDTO) {
		
		return user_dao.updateview(dataDTO);
	}


	@Override
	public int viewdelete(dataDTO dataDTO) {
		
		return user_dao.viewdelete(dataDTO);
	}


	@Override
	public int createvehicle(dataDTO dataDTO) {
		
		return user_dao.createvehicle(dataDTO);
	}


	@Override
	public List<dataDTO> vehiclelist(dataDTO dataDTO) {
		
		return user_dao.vehiclelist(dataDTO);
	}


	@Override
	public List<dataDTO> vehicledetail(int vehicle_index) {
		
		return user_dao.vehicledetail(vehicle_index);
	}


	@Override
	public int vehicledelete(int vehicle_index) {
		
		return user_dao.vehicledelete(vehicle_index);
	}


	@Override
	public int vehicleupdate(dataDTO dataDTO) {
		
		System.out.println(dataDTO.getVehicle_manager());
		return user_dao.vehicleupdate(dataDTO);
	}


	@Override
	public int updatecontainer(dataDTO dataDTO) {
		
		return user_dao.updatecontainer(dataDTO);
	}


	@Override
	public List<dataDTO> workcompletesearch(dataDTO dataDTO) {
		
		return user_dao.workcompletesearch(dataDTO);
	}
	 

	
}
