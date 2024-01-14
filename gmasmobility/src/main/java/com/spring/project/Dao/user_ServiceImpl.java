package com.spring.project.Dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.Dto.dataDTO;

@Service
public class user_ServiceImpl implements user_Service {

	@Autowired
	private user_Dao user_dao;

	//계정 회원가입
	@Override
	public int userInsert(dataDTO datadto) {		
		//datadto.setRole("ROLE_USER"); // 사용자 회원가입 시 권한 값 설정
		return user_dao.insert_user_userInsert(datadto);
	}

	@Override
	public List<dataDTO> driverslist() {
		return user_dao.driverslist();
	}

	@Override
	public List<dataDTO> driversDetail(dataDTO datadto) {
		return user_dao.driversDetail(datadto);
	}

	@Override
	public List<dataDTO> driversRoute(dataDTO datadto) {
		return user_dao.driversRoute(datadto);
	}

	@Override
	public List<dataDTO> noticelist() {
		return user_dao.noticelist();
	}

	@Override
	public List<dataDTO> userList() {
		return user_dao.userList();
	}

	@Override
	public List<dataDTO> userDetail(dataDTO datadto) {
		return user_dao.userDetail(datadto);
	}

	@Override
	public void nocticeInsert(dataDTO datadto) {
		user_dao.nocticeInsert(datadto);
	}

	@Override
	public void nocticeImgInsert(dataDTO datadto) {
		user_dao.nocticeImgInsert(datadto);
	}

	@Override
	public List<dataDTO> noticeDetail(dataDTO datadto) {
		return user_dao.noticeDetail(datadto);
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
	public int noticeDelete(dataDTO datadto) {
		return user_dao.noticeDelete(datadto);
	}

	@Override
	public List<dataDTO> eventlist() {
		return user_dao.eventlist();
	}

	@Override
	public void eventInsert(dataDTO datadto) {
		user_dao.eventInsert(datadto);
	}

	@Override
	public void eventImgInsert(dataDTO datadto) {
		user_dao.eventImgInsert(datadto);
	}

	@Override
	public List<dataDTO> eventDetail(dataDTO datadto) {
		return user_dao.eventDetail(datadto);
	}

	@Override
	public List<dataDTO> eventBef(dataDTO datadto) {
		return user_dao.eventBef(datadto);
	}

	@Override
	public List<dataDTO> eventAft(dataDTO datadto) {
		return user_dao.eventAft(datadto);
	}

	@Override
	public void eventUpdate(dataDTO datadto) {
		user_dao.eventUpdate(datadto);
	}

	@Override
	public void eventImgUpdate(dataDTO datadto) {
		user_dao.eventImgUpdate(datadto);
	}

	@Override
	public List<dataDTO> passengerlist(dataDTO dataDTO) {
		
		return user_dao.passengerlist(dataDTO);
	}

	@Override
	public List<dataDTO> alldriverlist() {
		
		return user_dao.alldriverlist();
	}

	@Override
	public List<dataDTO> stopdriverlist() {
		
		return user_dao.stopdriverlist();
	}

	@Override
	public List<dataDTO> passengerroutelist() {
		
		return user_dao.passengerroutelist();
	}

	@Override
	public List<dataDTO> passengerroutedetails(int route_idx) {
		
		return user_dao.passengerroutedetails(route_idx);
	}

	@Override
	public List<dataDTO> accounttransfer() {
		
		return user_dao.accounttransfer();
	}

	@Override
	public dataDTO passengerdetailup(int route_idx) {
		
		return user_dao.passengerdetailup(route_idx);
	}

	@Override
	public int createtransfer(dataDTO dataDTO) {
		
		return user_dao.createtransfer(dataDTO);
	}

	@Override
	public dataDTO driverinfo(int linenumber) {
		
		return user_dao.driverinfo(linenumber);
	}

	@Override
	public dataDTO searchuser(String userid) {
		
		return user_dao.searchuser(userid);
	}

	@Override
	public List<dataDTO> questionlist() {
		
		return user_dao.questionlist();
	}

	@Override
	public int createquestion(dataDTO dataDTO) {
		
		return user_dao.createquestion(dataDTO);
	}

	@Override
	public List<dataDTO> questiondetails(dataDTO datadto) {
		
		return user_dao.questiondetails(datadto);
	}

	@Override
	public List<dataDTO> questionBef(dataDTO datadto) {
		
		return user_dao.questionBef(datadto);
	}

	@Override
	public List<dataDTO> questionAft(dataDTO datadto) {
		
		return user_dao.questionAft(datadto);
	}

	@Override
	public List<dataDTO> questionanswerlist(dataDTO dataDTO) {
		
		return user_dao.questionanswerlist(dataDTO);
	}

	@Override
	public int createQuestionAnswer(dataDTO dataDTO) {
		
		return user_dao.createQuestionAnswer(dataDTO);
	}

	@Override
	public dataDTO adminload(dataDTO dataDTO) {
		
		return user_dao.adminload(dataDTO);
	}

	@Override
	public int questiondelete(dataDTO dataDTO) {
		
		return user_dao.questiondelete(dataDTO);
	}

	@Override
	public int questiondetailsdelete(dataDTO dataDTO) {
		
		return user_dao.questiondetailsdelete(dataDTO);
	}

	@Override
	public int answerupdate(dataDTO dataDTO) {
		// TODO Auto-generated method stub
		return user_dao.answerupdate(dataDTO);
	}

	
}
