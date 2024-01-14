package com.spring.project.Dao;

import java.util.List;

import com.spring.project.Dto.dataDTO;

public interface user_Service {
	//계정 회원가입
	public int userInsert(dataDTO datadto);

	public List<dataDTO> driverslist();

	public List<dataDTO> driversDetail(dataDTO datadto);

	public List<dataDTO> driversRoute(dataDTO datadto);

	public List<dataDTO> noticelist();

	public List<dataDTO> userList();

	public List<dataDTO> userDetail(dataDTO datadto);

	public void nocticeInsert(dataDTO datadto);

	public void nocticeImgInsert(dataDTO datadto);

	public List<dataDTO> noticeDetail(dataDTO datadto);

	public List<dataDTO> noticeBef(dataDTO datadto);

	public List<dataDTO> noticeAft(dataDTO datadto);

	public int noticeDelete(dataDTO datadto);

	public List<dataDTO> eventlist();

	public void eventInsert(dataDTO datadto);

	public void eventImgInsert(dataDTO datadto);

	public List<dataDTO> eventDetail(dataDTO datadto);

	public List<dataDTO> eventBef(dataDTO datadto);

	public List<dataDTO> eventAft(dataDTO datadto);

	public void eventUpdate(dataDTO datadto);

	public void eventImgUpdate(dataDTO datadto);
	//승객 한명의 노선
	public List<dataDTO> passengerlist(dataDTO dataDTO);
	//모든 기사 노선 리스트
	public List<dataDTO> alldriverlist();
	//중단 신청 기사 목록
	public List<dataDTO> stopdriverlist();
	//승객 노선 리스트
	public List<dataDTO> passengerroutelist();
	//승객 상세 리스트
	public List<dataDTO> passengerroutedetails(int route_idx);
	//이체 관리 리스트
	public List<dataDTO> accounttransfer();
	//승객 노선 상단
	public dataDTO passengerdetailup(int route_idx);
	//이체 관리 등록
	public int createtransfer (dataDTO dataDTO);
	
	//이체관리 드라이버 정보
	public dataDTO driverinfo(int linenumber);
	//이체관리 유저id 가져오기
	public dataDTO searchuser(String userid);
	
	//문의사항 리스트
	public List<dataDTO> questionlist();
	//문의사항 등록
	public int createquestion(dataDTO dataDTO);
	//문의사항 상세보기
	public List<dataDTO> questiondetails(dataDTO datadto);
	//문의사항 이전
	public List<dataDTO> questionBef(dataDTO datadto);
	//문의사항 이후
	public List<dataDTO> questionAft(dataDTO datadto);
	
	//문의사항 댓글
	public List<dataDTO> questionanswerlist(dataDTO dataDTO);
	//문의사항 댓글달기
	public int createQuestionAnswer(dataDTO dataDTO);
	//관리자 정보
	public dataDTO adminload(dataDTO dataDTO);
	//댓글 삭제
	public int questiondelete(dataDTO dataDTO);
	//문의사항 삭제
	public int questiondetailsdelete(dataDTO dataDTO);
	//문의사항 수정
	public int answerupdate(dataDTO dataDTO);
}
