package com.spring.project.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.Dto.dataDTO;

@Repository
public class user_DaoImpl implements user_Dao {
	private final String NS = "com.spring.project.map.map";

	@Autowired
	private SqlSessionTemplate sqlSession;

	//계정 회원가입
	@Override
	public int insert_user_userInsert(dataDTO datadto) {
		return sqlSession.insert(NS+".insert_user_userInsert", datadto);
	}

	@Override
	public List<dataDTO> driverslist() {
		return sqlSession.selectList(NS + ".driverslist");
	}

	@Override
	public List<dataDTO> driversDetail(dataDTO datadto) {
		return sqlSession.selectList(NS + ".driversDetail", datadto);
	}

	@Override
	public List<dataDTO> driversRoute(dataDTO datadto) {
		return sqlSession.selectList(NS + ".driversRoute", datadto);
	}

	@Override
	public List<dataDTO> noticelist() {
		return sqlSession.selectList(NS + ".noticelist");
	}

	@Override
	public List<dataDTO> userList() {
		return sqlSession.selectList(NS + ".userList");
	}

	@Override
	public List<dataDTO> userDetail(dataDTO datadto) {
		return sqlSession.selectList(NS + ".userDetail", datadto);
	}

	@Override
	public void nocticeInsert(dataDTO datadto) {
		sqlSession.insert(NS+".nocticeInsert", datadto);
	}

	@Override
	public void nocticeImgInsert(dataDTO datadto) {
		sqlSession.insert(NS+".nocticeImgInsert", datadto);
	}

	@Override
	public List<dataDTO> noticeDetail(dataDTO datadto) {
		return sqlSession.selectList(NS + ".noticeDetail", datadto);
	}

	@Override
	public List<dataDTO> noticeBef(dataDTO datadto) {
		return sqlSession.selectList(NS + ".noticeBef", datadto);
	}

	@Override
	public List<dataDTO> noticeAft(dataDTO datadto) {
		return sqlSession.selectList(NS + ".noticeAft", datadto);
	}

	@Override
	public int noticeDelete(dataDTO datadto) {
		return sqlSession.update(NS + ".noticeDelete", datadto);
	}

	@Override
	public List<dataDTO> eventlist() {
		return sqlSession.selectList(NS + ".eventlist");
	}

	@Override
	public void eventInsert(dataDTO datadto) {
		sqlSession.insert(NS+".eventInsert", datadto);
	}

	@Override
	public void eventImgInsert(dataDTO datadto) {
		sqlSession.insert(NS+".eventImgInsert", datadto);
	}

	@Override
	public List<dataDTO> eventDetail(dataDTO datadto) {
		return sqlSession.selectList(NS + ".eventDetail",datadto);
	}

	@Override
	public List<dataDTO> eventBef(dataDTO datadto) {
		return sqlSession.selectList(NS + ".eventBef", datadto);
	}

	@Override
	public List<dataDTO> eventAft(dataDTO datadto) {
		return sqlSession.selectList(NS + ".eventAft", datadto);
	}

	@Override
	public void eventUpdate(dataDTO datadto) {
		sqlSession.update(NS + ".eventUpdate", datadto);
	}

	@Override
	public void eventImgUpdate(dataDTO datadto) {
		sqlSession.update(NS + ".eventImgUpdate", datadto);
	}

	@Override
	public List<dataDTO> passengerlist(dataDTO dataDTO) {
		
		return sqlSession.selectList(NS + ".passengerlist", dataDTO);
	}

	@Override
	public List<dataDTO> alldriverlist() {
		
		return sqlSession.selectList(NS + ".alldriverlist");
	}

	@Override
	public List<dataDTO> stopdriverlist() {
		
		return sqlSession.selectList(NS + ".stopdriverlist");
	}

	@Override
	public List<dataDTO> passengerroutelist() {
		
		return sqlSession.selectList(NS + ".passengerroutelist");
	}

	@Override
	public List<dataDTO> passengerroutedetails(int route_idx) {
		
		return sqlSession.selectList(NS + ".passengerroutedetails", route_idx);
	}

	@Override
	public List<dataDTO> accounttransfer() {
		
		return sqlSession.selectList(NS + ".accounttransfer");
	}

	@Override
	public dataDTO passengerdetailup(int route_idx) {
		
		return sqlSession.selectOne(NS + ".passengerdetailup", route_idx);
	}

	@Override
	public int createtransfer(dataDTO dataDTO) {
		
		return sqlSession.insert(NS+".createtransfer", dataDTO);
	}

	@Override
	public dataDTO driverinfo(int linenumber) {
		
		return sqlSession.selectOne(NS + ".driverinfo", linenumber);
	}

	@Override
	public dataDTO searchuser(String userid) {
		
		return sqlSession.selectOne(NS + ".searchuser", userid);
	}

	@Override
	public List<dataDTO> questionlist() {
		
		return sqlSession.selectList(NS + ".questionlist");
	}

	@Override
	public int createquestion(dataDTO dataDTO) {
		
		return sqlSession.insert(NS+".createquestion", dataDTO);
	}

	@Override
	public List<dataDTO> questiondetails(dataDTO dataDTO) {
		
		return sqlSession.selectList(NS + ".questiondetails", dataDTO);
	}

	@Override
	public List<dataDTO> questionBef(dataDTO datadto) {
		
		return sqlSession.selectList(NS + ".contactBef", datadto);
	}

	@Override
	public List<dataDTO> questionAft(dataDTO datadto) {
		
		return sqlSession.selectList(NS + ".contactAft", datadto);
	}

	@Override
	public List<dataDTO> questionanswerlist(dataDTO dataDTO) {
		
		return sqlSession.selectList(NS + ".questionanswerlist", dataDTO);
	}

	@Override
	public int createQuestionAnswer(dataDTO dataDTO) {
		
		return sqlSession.insert(NS + ".createQuestionAnswer", dataDTO);
	}

	@Override
	public dataDTO adminload(dataDTO dataDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS + ".adminload", dataDTO);
	}

	@Override
	public int questiondelete(dataDTO dataDTO) {
		
		return sqlSession.update(NS + ".questiondelete", dataDTO);
	}

	@Override
	public int questiondetailsdelete(dataDTO dataDTO) {
		
		return sqlSession.update(NS + ".questiondetailsdelete", dataDTO);
	}

	@Override
	public int answerupdate(dataDTO dataDTO) {
		
		return sqlSession.update(NS + ".answerupdate", dataDTO);
	}
	

}
