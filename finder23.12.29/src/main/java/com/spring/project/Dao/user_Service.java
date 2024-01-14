package com.spring.project.Dao;

import java.util.List;

import com.spring.project.Dto.dataDTO;

public interface user_Service {
	//계정 회원가입
	public int userInsert(dataDTO datadto);
	//긴급보고 리스트
	public List<dataDTO> urgentload(dataDTO dataDTO);
	//긴급보고 상세보기
	public dataDTO details(int urgent_no);
	
	
	//일반보고 리스트
	public List<dataDTO> generalload(dataDTO dataDTO);
	//수정 요청 리스트
	public List<dataDTO> updateUser();
	//회원가입 대기 리스트
	public List<dataDTO> userApprove();
	
	//회원가입 승인
	public int updateUser(dataDTO dataDTO);
	//회원정보 승인 시 user업데이트
	public int userUpdateApprove(dataDTO dataDTO);
	
	//컨테이너 등록
	public int createContainer(dataDTO dataDTO);
	//컨테이너 리스트
	public List<dataDTO> containerList();
	//컨테이너 검색 리스트 
	public List<dataDTO> searchContainer(String title);
	//컨테이너 출하일
	public int updatecontainer (dataDTO dataDTO);
	 
	
	//공지사항 등록
	public int createNotice(dataDTO dataDTO);
	//공지사항 리스트
	public List<dataDTO> noticeList();
	//공지사항 상세보기
	public List<dataDTO> noticedetails(dataDTO dataDTO);
	//공지사항 이전
	public List<dataDTO> noticeBef(dataDTO datadto);
	//공지사항 이후
	public List<dataDTO> noticeAft(dataDTO datadto);
	//공지사항 수정
	public int updatenotice(dataDTO dataDTO);
	//공지사항 조회수
	public int updateview(dataDTO dataDTO);
	//공지사항 삭제
	public int viewdelete(dataDTO dataDTO);
	
	
	
	//기업관리
	public int createEnterprise(dataDTO dataDTO);
	//기업관리 리스트
	public List<dataDTO> EnterpriseList(int enterpriseNumber);
	//기업관리 존재유무
	public boolean checkData(dataDTO dataDTO);
	
	//유저리스트
	public List<dataDTO> userEnterpriseList(int enterpriseNumber);
	
	//업무하달 등록
	public int createWork(dataDTO dataDTO); 
	//업무하달 리스트
	public List<dataDTO> workList(int enterpriseNumber);
	//업무하달 완료 리스트
	public List<dataDTO> workcompleteList(int enterpriseNumber);
	//업무하달 검색
	public List<dataDTO> workcompletesearch (dataDTO dataDTO);
	
	
	//근무중 리스트
	public List<dataDTO> working(int enterpriseNumber);
	
	//차량등록
	public int createvehicle(dataDTO dataDTO);
	//차량리스트
	public List<dataDTO> vehiclelist(dataDTO dataDTO);
	//차량상세정보
	public List<dataDTO> vehicledetail(int vehicle_index);
	//차량삭제
	public int vehicledelete(int vehicle_index);
	//차량수정
	public int vehicleupdate(dataDTO dataDTO);
	
}
