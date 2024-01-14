package com.spring.project;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.codehaus.jackson.JsonNode;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.spring.project.Dao.PrincipalDetails;
import com.spring.project.Dao.user_Service;
import com.spring.project.Dto.dataDTO;

import checkers.units.quals.mol;

/* 
 * 타이틀: 베이스 프로젝트 HomeController
 * 파라미터 : -
 * 리턴값 : -
 * 설명 : 로그인, SNS 로그인, 403페이지 같은 페이지 핸들을 위한 컨트롤러
 * */
@Controller
public class HomeController {
	@Autowired
	private user_Service user_service;
	
	
	protected static String FTP_IP = "110.10.174.243";
	protected static int FTP_PORT = 22;
	protected static String FTP_ID = "root";
	protected static String FTP_PWD = "code4554!";
	protected static String FTP_PATH = "";
	ChannelSftp chSftp = null;
	FileInputStream fi = null;
	// 세션체크
	public boolean sessionCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
		}

		String check = (String) session.getAttribute("login_check");
		// System.out.println(check);
		if (check != null) {
			if (check.equals("ok") || check != null) {
				return true;
			}
		}
		return false;
	}
	
	public void ftpOn() {
		Session ses = null; // 접속계정
		Channel ch = null; // 접속
		JSch jsch = new JSch(); // jsch 객체를 생성
		try {
			// 세션 객체를 생성(사용자 이름, 접속할 호스트, 포트)
			ses = jsch.getSession(FTP_ID, FTP_IP, FTP_PORT);
			// 비밀번호 설정
			ses.setPassword(FTP_PWD);

			// 세션과 관련된 정보를 설정
			Properties p = new Properties();

			// 호스트 정보를 검사하지 않음
			p.put("StrictHostKeyChecking", "no");
			ses.setConfig(p);
			System.out.println("연결중");
			// 접속
			ses.connect();
			// 채널을 오픈(sftp)
			ch = ses.openChannel("sftp");
			// 채널에 연결(sftp)
			ch.connect();
			// 채널을 FTP용 채널 객체로 개스팅
			chSftp = (ChannelSftp) ch;
			System.out.println("FTP 연결이 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("FTP 연결에 실패했습니다.");
		}
	}
	
	
	
	
	
	@RequestMapping(value = { "/userdetail/{user_idx}" }, method = RequestMethod.GET)
    public String userdetail(HttpSession session, HttpServletRequest request,@PathVariable("user_idx") int user_idx) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
		System.out.println("*** user_idx : "+user_idx);
        return "user/user_detail";
    }
	
	@RequestMapping(value = { "/userlist" }, method = RequestMethod.GET)
    public String userlist(HttpSession session, HttpServletRequest request) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
        return "user/user_list";
    }
	
	/* 
	 * 타이틀: 메인 페이지(첫페이지)
	 * 파라미터 : -
	 * 리턴값 : home.jsp 페이지 출력
	 * 설명 : 도메인을 통해 웹에 접속시 맨처음 전시되는 페이지
	 * */
    @RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
    public ModelAndView welcomePage(Model modeling) {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Hello World");
        model.addObject("message", "This is welcome page!");
        model.setViewName("home");
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
     	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
              PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

              // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
              System.out.println(userDetails.getenterprise_terminal());
              
              modeling.addAttribute("username", userDetails.getenterpirse_name());
              modeling.addAttribute("id", userDetails.getenterprise_id());
              modeling.addAttribute("pw", userDetails.getenterprise_pw());
              modeling.addAttribute("terminal", userDetails.getenterprise_terminal());
              modeling.addAttribute("companycode", userDetails.getenterprise_companycode());
              modeling.addAttribute("role", userDetails.getenterprise_role());
              modeling.addAttribute("companycode", userDetails.getenterprise_companycode());
              modeling.addAttribute("enterprise", userDetails.getEnterprise_index());
              
              System.out.println(userDetails.getEnterprise_index());
              
              

              
            List<dataDTO> worker =  user_service.userEnterpriseList(userDetails.getenterprise_enterprise_info_index());
      	 	List<dataDTO> working = user_service.working(userDetails.getenterprise_enterprise_info_index());
      	 		
      	 	modeling.addAttribute("worker", worker);
      	 		modeling.addAttribute("size", worker.size());
      	 		modeling.addAttribute("working", working.size());
      	 		
                List<dataDTO> workList = user_service.workList(userDetails.getenterprise_enterprise_info_index());
           	 	System.out.println(workList.size());
                modeling.addAttribute("workList", workList.size());	
      	 		
                List<dataDTO> list = user_service.workcompleteList(userDetails.getenterprise_enterprise_info_index());
                
                modeling.addAttribute("list", list.size());
          }
     	 
     	
        
        return model;

    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error, // 로그인 실패 시 spring 시큐리티에서 설정한
																						// error 메시지 출력
			HttpSession session, // 현재 웹 브라우저에 저장되어있는 세션값 받음
			@RequestParam(value = "logout", required = false) String logout, // 로그아웃 시 spring 시큐리티에서 설정한 logout 메시지 출력
			Model model, // 페이지 이동 및 페이지 데이터 전달을 위한 Model 객체 선언
			HttpServletRequest request) { // login페이지에 전달되는 Get 데이터를 받기위한 객체

		if (error != null) {
			model.addAttribute("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addAttribute("msg", "You've been logged out successfully.");
		}

		return "login";

	}
    /* 회원가입페이지 불러오기*/
    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String joinForm() {
    	
    	return "join";
    } 
    /* 알림페이지 불러오기*/
    @RequestMapping(value = "/notification", method = RequestMethod.GET)
    public String notification(Model model, dataDTO dataDTO) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
            PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

            // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
            System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
            
            model.addAttribute("username", userDetails.getenterpirse_name());
            model.addAttribute("id", userDetails.getenterprise_id());
            model.addAttribute("pw", userDetails.getenterprise_pw());
            model.addAttribute("terminal", userDetails.getenterprise_terminal());
            model.addAttribute("companycode", userDetails.getenterprise_companycode());
            model.addAttribute("role", userDetails.getenterprise_role());
            model.addAttribute("companycode", userDetails.getenterprise_companycode());
            model.addAttribute("enterprise", userDetails.getEnterprise_index());
        
            
            
            dataDTO.setUser_enterprise_info_index(userDetails.getenterprise_enterprise_info_index());
        	List<dataDTO> urgentList = user_service.urgentload(dataDTO);
        	
        	
        	dataDTO.setUser_enterprise_info_index(userDetails.getenterprise_enterprise_info_index());
        	List<dataDTO> generalList = user_service.generalload(dataDTO);
        	List<dataDTO> CombinedList = new ArrayList<>();
        	
        	CombinedList.addAll(urgentList);
        	CombinedList.addAll(generalList);
        	
        	
        	
        	for(int i = 0; i < CombinedList.size(); i++) {
        		if(CombinedList.get(i).getUrgent_report_createtime() != null) {
        			CombinedList.get(i).setCreatetime(CombinedList.get(i).getUrgent_report_createtime());
        		}else {
        			CombinedList.get(i).setCreatetime(CombinedList.get(i).getGeneral_report_createtime());
        		}
        	}
        	
        	Collections.sort(CombinedList, Collections.reverseOrder());
        	System.out.println("실시간 보고 내림차순");
        	
        	model.addAttribute("CombinedList", CombinedList);
   	 
        	//user_edit
        	List<dataDTO> userupdatelist = user_service.updateUser();
        	
        	//user 회원가입 승인 대기 리스트
        	List<dataDTO> userapprove = user_service.userApprove();
        	
        	//유저 통합 리스트
        	List<dataDTO> userList = new ArrayList<>();
        	userList.addAll(userupdatelist);
        	userList.addAll(userapprove);
        	
        	
        	for(int i = 0; i < userList.size(); i++) {
        		if(userList.get(i).getUser_createtime() != null) {
        			userList.get(i).setCreate_user_time(userList.get(i).getUser_createtime());
        		}else {
        			userList.get(i).setCreate_user_time(userList.get(i).getUser_edit_createtime());
        		}
        	}
        	
        	Collections.sort(userList, Collections.reverseOrder());
        	System.out.println("유저 내림차순");
        	
        	
        	model.addAttribute("userapprove", userapprove);
        	model.addAttribute("userList", userList);
        	
        	if (!CombinedList.isEmpty()) {
        	       // Access elements of CombinedList here
        	       System.out.println(CombinedList.get(0).getCreatetime());
        	   } else {
        	       System.out.println("CombinedList is empty");
        	   }
        	
        	if (!userList.isEmpty()) {
        	       // Access elements of CombinedList here
        	       System.out.println(userList.get(0).getCreate_user_time());
        	   } else {
        	       System.out.println("userList is empty");
        	   }
   	 
   	 }
    	
   	 	
    	
    	
    	
    	
    	return "notification";
    } 
    
    @RequestMapping(value = "/navbar", method = RequestMethod.GET)
    public String navbarAdmin(Model model) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
             PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

             // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
             System.out.println("알림 userdetails : " + userDetails.getenterprise_terminal());
             
             model.addAttribute("username", userDetails.getenterpirse_name());
             model.addAttribute("id", userDetails.getenterprise_id());
             model.addAttribute("pw", userDetails.getenterprise_pw());
             model.addAttribute("terminal", userDetails.getenterprise_terminal());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("role", userDetails.getenterprise_role());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("enterprise", userDetails.getEnterprise_index());
         }
    	
    	return "include/navbar";
    			
    }
    
    
    /* 컨테이너 현황 페이지 불러오기*/
    @RequestMapping(value = "/containerStatus", method = RequestMethod.GET)
    public String containerStatus(@RequestParam(value = "container_name", required = false)String title, Model model) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
     	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
              PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

              // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
              System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
              
              model.addAttribute("username", userDetails.getenterpirse_name());
              model.addAttribute("id", userDetails.getenterprise_id());
              model.addAttribute("pw", userDetails.getenterprise_pw());
              model.addAttribute("terminal", userDetails.getenterprise_terminal());
              model.addAttribute("companycode", userDetails.getenterprise_companycode());
              model.addAttribute("role", userDetails.getenterprise_role());
              model.addAttribute("companycode", userDetails.getenterprise_companycode());
              model.addAttribute("enterprise", userDetails.getEnterprise_index());
   	
     	 }
     	List<dataDTO> containerList;
    	
     	System.out.println(title);
     	
     	if(title != null && !title.isEmpty()) {
     		containerList = user_service.searchContainer(title);
     	} else {
     		containerList = user_service.containerList();
     	}
    	System.out.println(containerList.size());
     	model.addAttribute("containerList", containerList);
     	
     	
    	return "containerStatus";
    } 
    
    @ResponseBody
    @RequestMapping(value = "/searchcontainer", method = RequestMethod.GET)
    public List<dataDTO> searchcontainer(@RequestParam(value = "container_name", required = false)String title, Model model) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
     	 if (auth != null && auth.getPrincipal()!= null && auth.getPrincipal() instanceof UserDetails) {
              PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

              // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
              System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
              
              model.addAttribute("username", userDetails.getenterpirse_name());
              model.addAttribute("id", userDetails.getenterprise_id());
              model.addAttribute("pw", userDetails.getenterprise_pw());
              model.addAttribute("terminal", userDetails.getenterprise_terminal());
              model.addAttribute("companycode", userDetails.getenterprise_companycode());
              model.addAttribute("role", userDetails.getenterprise_role());
              model.addAttribute("companycode", userDetails.getenterprise_companycode());
              model.addAttribute("enterprise", userDetails.getEnterprise_index());
   	
     	 }
     	
    	List<dataDTO> containerList = user_service.searchContainer(title);
     		System.out.println(containerList.get(0).getContainer_name());
     	
    	return containerList;
    } 
    
    
    /* 컨테이너 등록하기 페이지 불러오기*/
    @RequestMapping(value = "/containerRegist", method = RequestMethod.GET)
    public String containerRegist(Model model) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
               PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

               // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
               System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
               
               model.addAttribute("username", userDetails.getenterpirse_name());
               model.addAttribute("id", userDetails.getenterprise_id());
               model.addAttribute("pw", userDetails.getenterprise_pw());
               model.addAttribute("terminal", userDetails.getenterprise_terminal());
               model.addAttribute("companycode", userDetails.getenterprise_companycode());
               model.addAttribute("role", userDetails.getenterprise_role());
               model.addAttribute("companycode", userDetails.getenterprise_companycode());
               model.addAttribute("enterprise", userDetails.getEnterprise_index());
               model.addAttribute("enterpriseinfo", userDetails.getenterprise_enterprise_info_index());
    	
      	 }
    	return "containerRegist";
    } 
    /* 업무 현황 메인페이지 불러오기*/
    @RequestMapping(value = "/workStatus_main", method = RequestMethod.GET)
    public String workStatus_main(Model model) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
             PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

             // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
             System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
             
             model.addAttribute("username", userDetails.getenterpirse_name());
             model.addAttribute("id", userDetails.getenterprise_id());
             model.addAttribute("pw", userDetails.getenterprise_pw());
             model.addAttribute("terminal", userDetails.getenterprise_terminal());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("role", userDetails.getenterprise_role());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("enterprise", userDetails.getEnterprise_index());
             model.addAttribute("enterpriseinfo", userDetails.getenterprise_enterprise_info_index());
  	
             List<dataDTO> workList = user_service.workList(userDetails.getenterprise_enterprise_info_index());
    	 
             model.addAttribute("workList", workList);
    	 }
    	
    	 
    	 
    	return "workStatus_main";
    } 
    /* 업무 현황 완료업무페이지 불러오기*/
    @RequestMapping(value = "/workStatus_complete", method = RequestMethod.GET)
    public String workStatus_complete(Model model, HttpSession session, HttpServletRequest request) {
    	if (!sessionCheck(request)) { return "redirect:/login"; }
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
             PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

             // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
             System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
             
             model.addAttribute("username", userDetails.getenterpirse_name());
             model.addAttribute("id", userDetails.getenterprise_id());
             model.addAttribute("pw", userDetails.getenterprise_pw());
             model.addAttribute("terminal", userDetails.getenterprise_terminal());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("role", userDetails.getenterprise_role());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("enterprise", userDetails.getEnterprise_index());
             model.addAttribute("enterpriseinfo", userDetails.getenterprise_enterprise_info_index());
             
             List<dataDTO> list = user_service.workcompleteList(userDetails.getenterprise_enterprise_info_index());
             model.addAttribute("list", list);
    	 }
    	
    	return "workStatus_complete";
    } 
   
    /* 업무 현황하달페이지 불러오기*/
    @RequestMapping(value = "/workStatus_hand/{enterpriseinfo}", method = RequestMethod.GET)
    public String workStatus_hand(Model model, @PathVariable int enterpriseinfo) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
     	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
              PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

              // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
              System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
              
              model.addAttribute("username", userDetails.getenterpirse_name());
              model.addAttribute("id", userDetails.getenterprise_id());
              model.addAttribute("pw", userDetails.getenterprise_pw());
              model.addAttribute("terminal", userDetails.getenterprise_terminal());
              model.addAttribute("companycode", userDetails.getenterprise_companycode());
              model.addAttribute("role", userDetails.getenterprise_role());
              model.addAttribute("companycode", userDetails.getenterprise_companycode());
              model.addAttribute("enterprise", userDetails.getEnterprise_index());
              model.addAttribute("enterpriseinfo", userDetails.getenterprise_enterprise_info_index());
              
              
              
              System.out.println(userDetails.getenterprise_enterprise_info_index());
              List<dataDTO> list = user_service.userEnterpriseList(userDetails.getenterprise_enterprise_info_index());
              
              model.addAttribute("userList", list);
              
              
     	 }
    	
    	
    	return "workStatus_hand";
    } 
    /* 야드관리 페이지 불러오기*/
    @RequestMapping(value = "/yard", method = RequestMethod.GET)
    public String yard(Model modeling, dataDTO dataDTO) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
             PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

             // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
             System.out.println(userDetails.getenterprise_terminal());
             
             modeling.addAttribute("username", userDetails.getenterpirse_name());
             modeling.addAttribute("id", userDetails.getenterprise_id());
             modeling.addAttribute("pw", userDetails.getenterprise_pw());
             modeling.addAttribute("terminal", userDetails.getenterprise_terminal());
             modeling.addAttribute("companycode", userDetails.getenterprise_companycode());
             modeling.addAttribute("role", userDetails.getenterprise_role());
             modeling.addAttribute("companycode", userDetails.getenterprise_companycode());
             modeling.addAttribute("enterprise", userDetails.getEnterprise_index());
             
             System.out.println(userDetails.getEnterprise_index());
             
             
             

             
           List<dataDTO> worker =  user_service.userEnterpriseList(userDetails.getenterprise_enterprise_info_index());
     	 	List<dataDTO> working = user_service.working(userDetails.getenterprise_enterprise_info_index());
     	 		
     	 		modeling.addAttribute("worker", worker);
     	 		modeling.addAttribute("size", worker.size());
     	 		modeling.addAttribute("working", working.size());
     	 		
               List<dataDTO> workList = user_service.workList(userDetails.getenterprise_enterprise_info_index());
          	 	System.out.println(workList.size());
               modeling.addAttribute("workList", workList.size());	
     	 	
               dataDTO.setUser_enterprise_info_index(userDetails.getenterprise_enterprise_info_index());
               System.out.println(">>>"+userDetails.getenterprise_enterprise_info_index());
               System.out.println(">>>>>"+dataDTO.getUser_enterprise_info_index());
           	List<dataDTO> urgentList = user_service.urgentload(dataDTO);
           	modeling.addAttribute("urgentList", urgentList.size());
         }
    	
    	
    	return "yard";
    } 
    /* 근무자/장비관리페이지 불러오기*/
    @RequestMapping(value = "/workerequipmentManage", method = RequestMethod.GET)
    public String workerequipmentManage(Model model, dataDTO dataDTO) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
             PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

             // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
             System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
             
             model.addAttribute("username", userDetails.getenterpirse_name());
             model.addAttribute("id", userDetails.getenterprise_id());
             model.addAttribute("pw", userDetails.getenterprise_pw());
             model.addAttribute("terminal", userDetails.getenterprise_terminal());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("role", userDetails.getenterprise_role());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("enterprise", userDetails.getEnterprise_index());
             model.addAttribute("enterpriseinfo", userDetails.getenterprise_enterprise_info_index());
             
             System.out.println(userDetails.getenterprise_enterprise_info_index());

             
             List<dataDTO> worker =  user_service.userEnterpriseList(userDetails.getenterprise_enterprise_info_index());
     	 		System.out.println(worker.size());
     	 	List<dataDTO> working = user_service.working(userDetails.getenterprise_enterprise_info_index());
     	 		System.out.println(working.size());
 	 		model.addAttribute("worker", worker);
 	 		model.addAttribute("size", worker.size());
 	 		model.addAttribute("working", working.size());
 	 		
 	 		
 	 		dataDTO.setVehicle_enterprise_info_index(userDetails.getenterprise_enterprise_info_index());
 	 		List<dataDTO> vehicle = user_service.vehiclelist(dataDTO);
 	 		
 	 		model.addAttribute("vehicle", vehicle);
    	 }
    	 
    	 	
    	 	
    	
    	return "workerequipmentManage";
    } 
    /* 장비/차량관리 상세보기 페이지 불러오기*/
    @RequestMapping(value = "/management_detail/{vehicle_index}", method = RequestMethod.GET)
    public String management_detail(Model model, HttpServletRequest req, HttpSession session, @PathVariable int vehicle_index) {
    	if (!sessionCheck(req)) { return "redirect:/login"; }
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
            PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

            // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
            System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
            
            model.addAttribute("username", userDetails.getenterpirse_name());
            model.addAttribute("id", userDetails.getenterprise_id());
            model.addAttribute("pw", userDetails.getenterprise_pw());
            model.addAttribute("terminal", userDetails.getenterprise_terminal());
            model.addAttribute("companycode", userDetails.getenterprise_companycode());
            model.addAttribute("role", userDetails.getenterprise_role());
            model.addAttribute("enterprise", userDetails.getEnterprise_index());
            model.addAttribute("enterpriseinfo", userDetails.getenterprise_info());
    	
            System.out.println(vehicle_index);
            List<dataDTO> details = user_service.vehicledetail(vehicle_index);
            model.addAttribute("details", details);
   	 }
    	
    	
    	
    	
    	return "management_detail";
    } 
    /* 차량 등록 페이지 불러오기*/
    @RequestMapping(value = "/vehicleRegist", method = RequestMethod.GET)
    public String vehicleRegist(Model model, HttpServletRequest req, HttpSession session) {
    	if (!sessionCheck(req)) { return "redirect:/login"; }
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
            PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

            // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
            System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
            
            model.addAttribute("username", userDetails.getenterpirse_name());
            model.addAttribute("id", userDetails.getenterprise_id());
            model.addAttribute("pw", userDetails.getenterprise_pw());
            model.addAttribute("terminal", userDetails.getenterprise_terminal());
            model.addAttribute("companycode", userDetails.getenterprise_companycode());
            model.addAttribute("role", userDetails.getenterprise_role());
            model.addAttribute("enterprise", userDetails.getEnterprise_index());
            model.addAttribute("enterpriseinfo", userDetails.getenterprise_info());
    	
   	 }
    	
    	
    	return "vehicleRegist";
    } 
    /* 차량 수정 페이지 불러오기*/
    @RequestMapping(value = "/vehicleEdit/{vehicle_index}", method = RequestMethod.GET)
    public String vehicleEdit(Model model, HttpServletRequest req, HttpSession session, @PathVariable int vehicle_index) {
if (!sessionCheck(req)) { return "redirect:/login"; }
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
            PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

            // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
            System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
            
            model.addAttribute("username", userDetails.getenterpirse_name());
            model.addAttribute("id", userDetails.getenterprise_id());
            model.addAttribute("pw", userDetails.getenterprise_pw());
            model.addAttribute("terminal", userDetails.getenterprise_terminal());
            model.addAttribute("companycode", userDetails.getenterprise_companycode());
            model.addAttribute("role", userDetails.getenterprise_role());
            model.addAttribute("enterprise", userDetails.getEnterprise_index());
            model.addAttribute("enterpriseinfo", userDetails.getenterprise_info());
    	
            System.out.println("수정"+vehicle_index);
            List<dataDTO> details = user_service.vehicledetail(vehicle_index);
            model.addAttribute("details", details);
            System.out.println(details.get(0).getVehicle_img());
   	 }
    	
    	return "vehicleEdit";
    } 
    /* 공지사항 페이지 불러오기*/
    @RequestMapping(value = "/notice", method = RequestMethod.GET)
    public String notice(Model model, dataDTO dataDTO) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
             PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

             // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
             System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
             
             model.addAttribute("username", userDetails.getenterpirse_name());
             model.addAttribute("id", userDetails.getenterprise_id());
             model.addAttribute("pw", userDetails.getenterprise_pw());
             model.addAttribute("terminal", userDetails.getenterprise_terminal());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("role", userDetails.getenterprise_role());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("enterprise", userDetails.getEnterprise_index());
  	
             
             dataDTO.setUser_enterprise_info_index(userDetails.getEnterprise_index());
             List<dataDTO> noticeList = user_service.noticeList();
        	 
     	 	model.addAttribute("noticeList", noticeList);
    	 }
    	 
    	
    	 	
    	 	
    	return "notice";
    } 
    /* 공지사항 등록 페이지 불러오기*/
    @RequestMapping(value = "/noticeRegist", method = RequestMethod.GET)
    public String noticeRegist(Model model) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
     	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
              PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

              // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
              System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
              
              model.addAttribute("username", userDetails.getenterpirse_name());
              model.addAttribute("id", userDetails.getenterprise_id());
              model.addAttribute("pw", userDetails.getenterprise_pw());
              model.addAttribute("terminal", userDetails.getenterprise_terminal());
              model.addAttribute("companycode", userDetails.getenterprise_companycode());
              model.addAttribute("role", userDetails.getenterprise_role());
              model.addAttribute("companycode", userDetails.getenterprise_companycode());
              model.addAttribute("enterprise", userDetails.getEnterprise_index());
   	
     	 }
    	
    	return "noticeRegist";
    } 
    /* 공지사항 상세 페이지 불러오기*/
    @RequestMapping(value = "/notice_detail/{notice_index}", method = RequestMethod.GET)
    public String notice_detail(Model model, dataDTO dataDTO, @PathVariable("notice_index") int notice_index) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
             PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

             // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
             System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
             
             model.addAttribute("username", userDetails.getenterpirse_name());
             model.addAttribute("id", userDetails.getenterprise_id());
             model.addAttribute("pw", userDetails.getenterprise_pw());
             model.addAttribute("terminal", userDetails.getenterprise_terminal());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("role", userDetails.getenterprise_role());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("enterprise", userDetails.getEnterprise_index());
             
             
             dataDTO.setNotice_index(notice_index);
             List<dataDTO> data = user_service.noticedetails(dataDTO);
             model.addAttribute("data", data);
             
             List<dataDTO> noticeBef = user_service.noticeBef(dataDTO);
     		model.addAttribute("noticeBef", noticeBef);	
     		
     		List<dataDTO> noticeAft = user_service.noticeAft(dataDTO);
     		model.addAttribute("noticeAft", noticeAft);
    	 }
    	
    	
    	
    	return "notice_detail";
    } 
    /* 공지사항 수정 페이지 불러오기*/
    @RequestMapping(value = "/noticeEdit/{notice_index}", method = RequestMethod.GET)
    public String noticeEdit(Model model, dataDTO dataDTO) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
            PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

            // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
            System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
            
            model.addAttribute("username", userDetails.getenterpirse_name());
            model.addAttribute("id", userDetails.getenterprise_id());
            model.addAttribute("pw", userDetails.getenterprise_pw());
            model.addAttribute("terminal", userDetails.getenterprise_terminal());
            model.addAttribute("companycode", userDetails.getenterprise_companycode());
            model.addAttribute("role", userDetails.getenterprise_role());
            model.addAttribute("companycode", userDetails.getenterprise_companycode());
            model.addAttribute("enterprise", userDetails.getEnterprise_index());
            
            System.out.println(dataDTO.getNotice_index());
            dataDTO.setNotice_index(dataDTO.getNotice_index());
            List<dataDTO> data = user_service.noticedetails(dataDTO);
            
            model.addAttribute("data", data);
            
   	 }
    	
    	
    	
    	return "noticeEdit";
    } 
    /* 기업관리 페이지 불러오기*/
    @RequestMapping(value = "/enterpriseManage/{enterprise}", method = RequestMethod.GET)
    public String enterpriseManage(Model model, @PathVariable int enterprise) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
             PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

             // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
             System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
             
             model.addAttribute("username", userDetails.getenterpirse_name());
             model.addAttribute("id", userDetails.getenterprise_id());
             model.addAttribute("pw", userDetails.getenterprise_pw());
             model.addAttribute("terminal", userDetails.getenterprise_terminal());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("role", userDetails.getenterprise_role());
             model.addAttribute("companycode", userDetails.getenterprise_companycode());
             model.addAttribute("enterprise",userDetails.getEnterprise_index());
             model.addAttribute("enterpriseNumber",userDetails.getenterprise_enterprise_info_index());
             
             List<dataDTO> enterpriseManage = user_service.EnterpriseList(userDetails.getenterprise_enterprise_info_index());
             model.addAttribute("enterpriseManage", enterpriseManage);
             
    	 }
    	
    	
    	return "enterpriseManage";
    } 
    /* 기업관리 페이지 불러오기*/
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test() {
    	
    	return "test";
    } 
    
    //기업관리 게시글 존재 유무
    @RequestMapping(value = "/checkEnterprise", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Boolean> checkEnterprise(dataDTO dataDTO) {
    	Map<String, Boolean> response = new HashMap<>();
    	System.out.println("존재응답");
    	 boolean exists = user_service.checkData(dataDTO);
    	 System.out.println("존재응답"+ exists);
    	 response.put("exists", exists);
      
    	 return response;
    } 
    
    
	/* 
	 * 타이틀: 403 페이지(접근 권한이 없는 페이지 접속시)
	 * 파라미터 : -
	 * 리턴값 :403.jsp 페이지 이동
	 * 설명 : 사용자가 접근권한이 없는 페이지 접근시 전시되는 페이지
	 * */
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {

      ModelAndView model = new ModelAndView();
        
      //시큐리티 세션에 저장되어 있는 사용자 정보를 가져오기위한 함수
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      if (!(auth instanceof AnonymousAuthenticationToken)) { //시큐리티 로그인이 되었을 시 실행
        UserDetails userDetail = (UserDetails) auth.getPrincipal();	// 시큐리티에 저장된 UserDetails 객체에 로그인한 사용자 정보 출력
        model.addObject("username", userDetail.getUsername()); //getUsername 함수를 통해 시큐리티 사용자 정보 객체를 통해 로그인 된 아이디(ID) 값을 반환
      }
        
      model.setViewName("403");
      return model;

    }
    //회원가입(기업) RestController
    @ResponseBody
    @RequestMapping(value = "/enterpriseSignup", method = RequestMethod.POST)
    public String enterpriseSignup(dataDTO dataDTO, HttpServletRequest httpServletRequest) throws Exception {
    	
    	int result = user_service.userInsert(dataDTO);
    	
    	return "/main";
    }
    
    /*
     * 사용자 : 실시간보고 - 상세보기
     * */
    @RequestMapping(value = {"/report_detail/{urgent_no}"}, method = RequestMethod.GET)
    public String report_detail(Model model, @PathVariable int urgent_no) {
    	
    	dataDTO dataDTO = user_service.details(urgent_no);
    	
    	System.out.println("실시간 보고 디테일 : " + dataDTO.getUser_name());
    	model.addAttribute("data", dataDTO);
    	
    	return "notification";
    }
    
    //정보 수정 대기(edit)
    @ResponseBody
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public int userUpdate(HttpServletRequest request, dataDTO dataDTO) {
    	System.out.println("userUpdate");
    	System.out.println(dataDTO.toString());
     	 
    	System.out.println("회원 정보 수정 컨트롤러");
    	System.out.println("업데이트 : " + dataDTO.getUser_index());
    	int result = user_service.updateUser(dataDTO);
    	System.out.println("업데이트 : " + dataDTO.getUser_joinconfirm());
    	System.out.println("업데이트 : " + dataDTO.getUser_index());
    	System.out.println("업데이트 : " + dataDTO.getUser_team());
    	
     	 
    	return result;
    }
    
    //정보 수정 승인시 유저 회원정보 수정
    @ResponseBody
    @RequestMapping(value = "/updateUserApprove", method = RequestMethod.POST)
    public String userUpdateApprove(HttpServletRequest request, dataDTO dataDTO) {
    	
    	
    	
    	System.out.println("승인:" + dataDTO.getUser_index());
    	int result = user_service.userUpdateApprove(dataDTO);
    	System.out.println("승인:" + dataDTO.getUser_index());
    	System.out.println("승인:" + dataDTO.getUser_name());
    	System.out.println("승인:" + dataDTO.getUser_edit_name());
    	return "notification";
    }
	
    //컨테이너 등록
    @ResponseBody
    @RequestMapping(value = "/createContainer", method = RequestMethod.POST)
    public String createContainer(dataDTO dataDTO, HttpServletRequest httpServletRequest, @RequestParam("file") MultipartFile file, @RequestParam("file2") MultipartFile file2) throws Exception {
    	if (!sessionCheck(httpServletRequest)) { return "redirect:/login"; }
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
            PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

            // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
            System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
            
            dataDTO.setContainer_enterprise_info_index(userDetails.getenterprise_enterprise_info_index());
            
            System.out.println("컨테이너 등록");
        	if (!file.isEmpty()) {
    	         ftpOn();
    	        String fileoriname = "";
    			String filename = "";
    			String fileUUID = "";
    			InputStream in = null;
    			
    			try {
    				in = file.getInputStream();
    				this.chSftp.cd("/var/lib/tomcat9/webapps/media/finder/container");
    				MultipartFile mf = file;
    				fileoriname = mf.getOriginalFilename();
    				filename = FilenameUtils.getExtension(mf.getOriginalFilename());
    				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
    				String today = dateFormat.format(new Date());
    				//fileUUID = String.valueOf(today) + "_" + fileoriname;
    				fileUUID = String.valueOf(today);
    				this.chSftp.put(in, fileUUID);
    				System.out.println(" 파일이름: " + fileoriname);
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
    	         
    			dataDTO.setContainer_img(fileUUID);
    	         //data.setEvent_thumbnail_org(fileoriname);
     		}
     		this.chSftp.quit();
     		
        	if (!file2.isEmpty()) {
    	         ftpOn();
    	        String fileoriname = "";
    			String filename = "";
    			String fileUUID = "";
    			InputStream in = null;
    			
    			try {
    				in = file2.getInputStream();
    				this.chSftp.cd("/var/lib/tomcat9/webapps/media/finder/BIDO");
    				MultipartFile mf = file2;
    				fileoriname = mf.getOriginalFilename();
    				filename = FilenameUtils.getExtension(mf.getOriginalFilename());
    				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
    				String today = dateFormat.format(new Date());
    				//fileUUID = String.valueOf(today) + "_" + fileoriname;
    				fileUUID = String.valueOf(today);
    				this.chSftp.put(in, fileUUID);
    				System.out.println(" 파일이름: " + fileoriname);
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
    	         
    			dataDTO.setContainer_BIDOimg(fileUUID);
    	         //data.setEvent_thumbnail_org(fileoriname);
    		}
    		this.chSftp.quit();
     		
     		
     		
     		
     		
        	int result = user_service.createContainer(dataDTO);
        	System.out.println("컨테이너:"+ dataDTO.getContainer_name());
    	
   	 }
    	
    	return "/main";
    }
    
    @ResponseBody
    @RequestMapping(value = "/updateContainer", method = RequestMethod.POST)
    public dataDTO updateContainer(dataDTO dataDTO, HttpServletRequest httpServletRequest) throws Exception {
    	
    	System.out.println("컨테이너 출하일 등록" + dataDTO.getContainer_shippingdate());
    	int result = user_service.updatecontainer(dataDTO);
    	System.out.println("컨테이너 출하일:");
    	System.out.println("컨테이너 출하일:");
    	
    	
    	return dataDTO;
    }
    
    
    @ResponseBody
    @RequestMapping(value = "/createNotice", method = RequestMethod.POST)
    public String createNotice(dataDTO dataDTO, HttpServletRequest httpServletRequest) throws Exception {
    	
    	System.out.println("공지사항 등록");
    	int result = user_service.createNotice(dataDTO);
    	System.out.println("공지사항:"+ dataDTO.getNotice_content());
    	System.out.println("공지사항:"+ dataDTO.getNotice_title());
    	
    	return "/main";
    }
    
    @ResponseBody
    @RequestMapping(value = "/createEnterprise", method = RequestMethod.POST)
    public String createEnterprise(dataDTO dataDTO, HttpServletRequest httpServletRequest) throws Exception {
    	
    	System.out.println("기업관리 등록");
    	int result = user_service.createEnterprise(dataDTO);
    	System.out.println("공지사항:"+ dataDTO.getWorkcategory_enterprise_index());
    	System.out.println("공지사항:"+ dataDTO.getWorkcategory_content());
    	
    	
    	return "/main";
    }
    
    @ResponseBody
    @RequestMapping(value = "/createWork", method = RequestMethod.POST)
    public String createWork(dataDTO dataDTO, HttpServletRequest httpServletRequest, @RequestParam("file") MultipartFile file) {
    	
    	System.out.println("업무현황 등록");
    	 if (!file.isEmpty()) {
 	         ftpOn();
 	        String fileoriname = "";
 			String filename = "";
 			String fileUUID = "";
 			InputStream in = null;
 			
 			try {
 				in = file.getInputStream();
 				this.chSftp.cd("/var/lib/tomcat9/webapps/media/finder/work");
 				MultipartFile mf = file;
 				fileoriname = mf.getOriginalFilename();
 				filename = FilenameUtils.getExtension(mf.getOriginalFilename());
 				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
 				String today = dateFormat.format(new Date());
 				//fileUUID = String.valueOf(today) + "_" + fileoriname;
 				fileUUID = String.valueOf(today);
 				this.chSftp.put(in, fileUUID);
 				System.out.println(" 파일이름: " + fileoriname);
 			} catch (Exception e) {
 				e.printStackTrace();
 			}
 	         
 			dataDTO.setWork_nameimg(fileUUID);
 	         //data.setEvent_thumbnail_org(fileoriname);
  		}
  		this.chSftp.quit();
    	
    	System.out.println("업무현황 등록");
    	int result = user_service.createWork(dataDTO);
    	System.out.println("업무현황:"+ dataDTO.getWork_content());
    	System.out.println("업무현황:"+ dataDTO.getWork_index());
    	System.out.println("업무현황:"+ dataDTO.getWork_location());
    	
    	
    	return "/main";
    }
  
    @ResponseBody
    @RequestMapping(value = "/updatenotice", method = RequestMethod.POST)
    public String updateNotice(dataDTO dataDTO, HttpServletRequest httpServletRequest) throws Exception {
    	
    	System.out.println("공지사항 수정");
    	System.out.println("공지사항 수정" + dataDTO.getNotice_title());
    	
    	int result = user_service.updatenotice(dataDTO);
    	
    	
    	return "notice";
    }

    @ResponseBody
    @RequestMapping(value = "/updateview", method = RequestMethod.POST)
    public String viewcount(dataDTO dataDTO, HttpServletRequest httpServletRequest) throws Exception {
    	
    	System.out.println("조회수");
    	System.out.println("조회수"+ dataDTO.getNotice_view());
    	
    	System.out.println(dataDTO.getNotice_index());
    	
    	int result = user_service.updateview(dataDTO);
    	System.out.println("조회수"+ dataDTO.getNotice_view());
    	
    	return "notice";
    }
    
    @ResponseBody
    @RequestMapping(value = "/viewdelete", method = RequestMethod.POST)
    public String viewdelete(dataDTO dataDTO, HttpServletRequest httpServletRequest) throws Exception {
    	
    	System.out.println("삭제");
    	int result = user_service.viewdelete(dataDTO);
    	
    	return "notice";
    }
    
    @RequestMapping(value = "/createvehicle", method = RequestMethod.POST)
    public String createvehicle(dataDTO dataDTO, HttpServletRequest httpServletRequest, HttpSession session, @RequestParam("file") MultipartFile file){
    	if (!sessionCheck(httpServletRequest)) { return "redirect:/login"; }
    	
    	System.out.println("차량등록");
    	
    	if (!file.isEmpty()) {
	         ftpOn();
	        String fileoriname = "";
			String filename = "";
			String fileUUID = "";
			InputStream in = null;
			
			try {
				in = file.getInputStream();
				this.chSftp.cd("/var/lib/tomcat9/webapps/media/finder/vehicle");
				MultipartFile mf = file;
				fileoriname = mf.getOriginalFilename();
				filename = FilenameUtils.getExtension(mf.getOriginalFilename());
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
				String today = dateFormat.format(new Date());
				//fileUUID = String.valueOf(today) + "_" + fileoriname;
				fileUUID = String.valueOf(today);
				this.chSftp.put(in, fileUUID);
				System.out.println(" 파일이름: " + fileoriname);
			} catch (Exception e) {
				e.printStackTrace();
			}
	         
			dataDTO.setVehicle_img(fileUUID);
	         //data.setEvent_thumbnail_org(fileoriname);
  		}
  		this.chSftp.quit();
    	
  		int createvehicle = user_service.createvehicle(dataDTO);
  		
  		
    	return "notice";
    }
    
    //차량관리 삭제
    @ResponseBody
    @RequestMapping(value = "/deletevehicle", method = RequestMethod.POST)
    public String deletevehicle(HttpServletRequest httpServletRequest, @RequestParam int vehicle_index) {
    	
    	System.out.println("차량 삭제");
    	
    	int result = user_service.vehicledelete(vehicle_index);
    	
    	
    	return "notice";
    }
    
    //차량관리 수정
    @ResponseBody
    @RequestMapping(value = "/updatevehicle", method = RequestMethod.POST)
    public String updatevehicle(dataDTO dataDTO, HttpServletRequest httpServletRequest, @RequestParam("file") MultipartFile file) {
    	
    	System.out.println("차량 수정");
    	
    	int vehicle_index = dataDTO.getVehicle_index();
        List<dataDTO> details = user_service.vehicledetail(vehicle_index);
        System.out.println("details" + details.get(0).getVehicle_img());
        
        String existingImage = details.get(0).getVehicle_img();
        dataDTO.setVehicle_img(existingImage);
    	if (!file.isEmpty()) {
	         ftpOn();
	        String fileoriname = "";
			String filename = "";
			String fileUUID = "";
			InputStream in = null;
			
			try {
				in = file.getInputStream();
				this.chSftp.cd("/var/lib/tomcat9/webapps/media/finder/vehicle");
				MultipartFile mf = file;
				fileoriname = mf.getOriginalFilename();
				filename = FilenameUtils.getExtension(mf.getOriginalFilename());
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
				String today = dateFormat.format(new Date());
				//fileUUID = String.valueOf(today) + "_" + fileoriname;
				fileUUID = String.valueOf(today);
				this.chSftp.put(in, fileUUID);
				System.out.println(" 파일이름: " + fileoriname);
				dataDTO.setVehicle_img(fileUUID);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				this.chSftp.quit();
			}
	         
	         //data.setEvent_thumbnail_org(fileoriname);
 		}
 		
    	
    	
 		
 		
    	System.out.println(dataDTO.getVehicle_manager());
    	int vehicleupdate = user_service.vehicleupdate(dataDTO);
    	System.out.println(vehicleupdate);
    	

    	
    	return "notice";
    }
    //업무현황
    @ResponseBody
    @RequestMapping(value = "/searchwork", method = RequestMethod.GET)
    public List<dataDTO> searchwork(dataDTO dataDTO, Model model) {
    	
    	System.out.println("완료업무 검색");
    	List<dataDTO> worksearch = new ArrayList<>();
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
     	 if (auth != null && auth.getPrincipal() != null && auth.getPrincipal() instanceof UserDetails) {
              PrincipalDetails userDetails = (PrincipalDetails) auth.getPrincipal();

              // Access user details, e.g., userDetails.getUsername(), userDetails.getAuthorities(), etc.
              System.out.println("알림 userdetails : " + userDetails.getenterpirse_name());
              
              model.addAttribute("username", userDetails.getenterpirse_name());
              model.addAttribute("id", userDetails.getenterprise_id());
              model.addAttribute("pw", userDetails.getenterprise_pw());
              model.addAttribute("terminal", userDetails.getenterprise_terminal());
              model.addAttribute("companycode", userDetails.getenterprise_companycode());
              model.addAttribute("role", userDetails.getenterprise_role());
              model.addAttribute("companycode", userDetails.getenterprise_companycode());
              model.addAttribute("enterprise", userDetails.getEnterprise_index());
              model.addAttribute("enterpriseinfo", userDetails.getenterprise_enterprise_info_index());
              
              dataDTO.setUser_enterprise_info_index(userDetails.getenterprise_enterprise_info_index());
          	 	System.out.println(dataDTO.getWork_assigndate());
          	 	System.out.println(dataDTO.getUser_enterprise_info_index());
              worksearch = user_service.workcompletesearch(dataDTO);
     	 }
     	
    	return worksearch;
    } 
    
}
