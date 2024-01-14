package com.spring.project.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.Dto.dataDTO;

@Repository
public class user_DaoImpl implements user_Dao {
	private final String map = "com.spring.project.map.map";

	@Autowired
	private SqlSessionTemplate sqlSession;

	//계정 회원가입
	@Override
	public int insert_user_userInsert(dataDTO datadto) {
		
		System.out.println("회원가입 dao");
		return sqlSession.insert(map+".insert_user_userInsert", datadto);
	}

	@Override
	public dataDTO findUserByUsername(String username) {
		
		System.out.println("로그인 Dao");
		
		return sqlSession.selectOne(map+".loadMem", username);
	}

	@Override
	public List<dataDTO> urgentload(dataDTO dataDTO) {
		System.out.println("긴급보고 리스트");
		return sqlSession.selectList(map+".urgentload", dataDTO);
	}

	@Override
	public dataDTO urgentDetails(int urgent_no) {
		
		return sqlSession.selectOne(map+".urgentdetails", urgent_no);
	}

	@Override
	public List<dataDTO> generalload(dataDTO dataDTO) {
		System.out.println("일반보고 리스트");
		return sqlSession.selectList(map+".generalload", dataDTO);
	}

	//정보수정 대기 리스트
	@Override
	public List<dataDTO> userUpdate() {
		
		return sqlSession.selectList(map+".userEdit");
	}
	//회원가입 대기 리스트
	@Override
	public List<dataDTO> userappove() {
		
		return sqlSession.selectList(map+".userapprove");
	}
	//회원가입 승인
	@Override
	public int userUpdateApprove(dataDTO dataDTO) {
		
		System.out.println("회원가입 승인");
		
		return sqlSession.update(map+".userupdate", dataDTO);
	}
	//정보수정 승인
	@Override
	public int userChange(dataDTO dataDTO) {
		
		return sqlSession.update(map+".userchange", dataDTO);
	}

	@Override
	public int createContainer(dataDTO dataDTO) {
		
		return sqlSession.update(map+".createContainer", dataDTO);
	}

	@Override
	public List<dataDTO> containerList() {
		
		return sqlSession.selectList(map+".containerList");
	}

	//공지사항 등록
	@Override
	public int createNotice(dataDTO dataDTO) {
		
		return sqlSession.insert(map+".createNotice", dataDTO);
	}

	@Override
	public List<dataDTO> noticeList() {
		
		return sqlSession.selectList(map+".noticelist");
	}

	
	 @Override 
	 public List<dataDTO> searchContainer(String title) {
		 System.out.println("dao"+title);
			/*
			 * Map<String, Object> parameters = new HashMap<>();
			 * parameters.put("container_name", title);
			 */
	 return sqlSession.selectList(map+".searchList", title); 
	 }

	@Override
	public int createEnterpise(dataDTO dataDTO) {
		
		return sqlSession.insert(map+".createEnterprise", dataDTO);
	}

	@Override
	public List<dataDTO> EnterpriseList(int enterpriseNumber) {
		
		return sqlSession.selectList(map+".ListEnterprise", enterpriseNumber); 
	}

	@Override
	public List<dataDTO> userEnterpriseList(int enterpriseNumber) {
		
		return sqlSession.selectList(map+".workerList", enterpriseNumber);
	}

	@Override
	public List<dataDTO> enterpriseCheck(dataDTO dataDTO) {
		
		return sqlSession.selectList(map+".EnterpriseCheck", dataDTO);
	}

	@Override
	public int createWork(dataDTO dataDTO) {
		
		return sqlSession.insert(map+".createWork", dataDTO);
	}

	@Override
	public List<dataDTO> workerList(int enterpriseNumber) {
		
		return sqlSession.selectList(map+".workList", enterpriseNumber);
	}

	@Override
	public List<dataDTO> workcompleteList(int enterpriseNumber) {
		
		return sqlSession.selectList(map+".workcompleteList", enterpriseNumber);
	}

	@Override
	public List<dataDTO> working(int enterpriseNumber) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(map+".working", enterpriseNumber);
	}

	@Override
	public List<dataDTO> workerListadd(dataDTO dataDTO) {
		
		return sqlSession.selectList(map+".workerListadd", dataDTO);
	}

	@Override
	public List<dataDTO> noticedetails(dataDTO dataDTO) {
		
		return sqlSession.selectList(map+".noticedetails", dataDTO);
	}

	@Override
	public List<dataDTO> noticeBef(dataDTO datadto) {
		return sqlSession.selectList(map+".noticeBef", datadto);
	}

	@Override
	public List<dataDTO> noticeAft(dataDTO datadto) {
		return sqlSession.selectList(map+".noticeAft", datadto);
	}

	@Override
	public int updatenotice(dataDTO dataDTO) {
		return sqlSession.update(map+".updatenotice", dataDTO);
	}

	@Override
	public int updateview(dataDTO dataDTO) {
		
		return sqlSession.update(map+".updateview", dataDTO);
	}

	@Override
	public int viewdelete(dataDTO dataDTO) {
		
		return sqlSession.update(map+".viewdelete", dataDTO);
	}

	@Override
	public int createvehicle(dataDTO dataDTO) {
		
		return sqlSession.insert(map+".createvehicle", dataDTO);
	}

	@Override
	public List<dataDTO> vehiclelist(dataDTO dataDTO) {
		
		return sqlSession.selectList(map+".vehiclelist", dataDTO);
	}

	@Override
	public List<dataDTO> vehicledetail(int vehicle_index) {
		
		return sqlSession.selectList(map+".vehicledetail", vehicle_index);
	}

	@Override
	public int vehicledelete(int vehicle_index) {
		
		return sqlSession.update(map+".vehicledelete", vehicle_index);
	}

	@Override
	public int vehicleupdate(dataDTO dataDTO) {
		
		System.out.println(dataDTO.getVehicle_manager());
		return sqlSession.update(map+".vehicleupdate", dataDTO);
	}

	@Override
	public int updatecontainer(dataDTO dataDTO) {
		
		return sqlSession.update(map+".updatecontainer", dataDTO);
	}

	@Override
	public List<dataDTO> workcompletesearch(dataDTO dataDTO) {
		
		return sqlSession.selectList(map+".searchwork", dataDTO);
	}
}
	 


