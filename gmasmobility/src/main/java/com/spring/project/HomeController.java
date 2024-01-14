package com.spring.project;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.spring.project.Dao.user_Dao;
import com.spring.project.Dao.user_Service;
import com.spring.project.Dto.dataDTO;

@Controller
public class HomeController {
	@Autowired
	private user_Service user_service;
	
	@Autowired
	private user_Dao userdao;
	
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
			
			/*
			 * List<userDTO> admindetail = dataDao.admindetail(userDetail.getUsername());
			 * session.setAttribute("user_idx", admindetail.get(0).getAdmin_idx());
			 * System.out.println("===================="); System.out.println("user_idx : "+
			 * session.getAttribute("user_idx"));
			 * System.out.println("====================");
			 */
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
	
	@RequestMapping(value = { "/user/{account_idx}" }, method = RequestMethod.GET)
    public String userdetail(dataDTO datadto,HttpSession session, HttpServletRequest request,Model model,@PathVariable("account_idx") int account_idx) {
		
		if (!sessionCheck(request)) { return "redirect:/login"; }
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
		datadto.setAccount_idx(account_idx);
		
		List<dataDTO> userDetail = user_service.userDetail(datadto);
		model.addAttribute("userDetail", userDetail);
		System.out.println("*** account_idx : "+account_idx);
		
		List<dataDTO> passengerRoute = user_service.passengerlist(datadto);
		System.out.println(passengerRoute.size());
		model.addAttribute("passengerRoute", passengerRoute);
        return "user/user_detail";
    }
	
	@RequestMapping(value = { "/user" }, method = RequestMethod.GET)
    public String userlist(HttpSession session, HttpServletRequest request,Model model,dataDTO datadto) {
		
		if (!sessionCheck(request)) { return "redirect:/login"; }
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
		List<dataDTO> userList = user_service.userList();
		model.addAttribute("userList", userList);
		
		 		
        return "user/user_list";
    }
	
	@RequestMapping(value = { "/drivers/{account_idx}" }, method = RequestMethod.GET)
    public String driversDetail(dataDTO datadto,HttpSession session, HttpServletRequest request,@PathVariable("account_idx") int account_idx,Model model) {
		
		if (!sessionCheck(request)) { return "redirect:/login"; }
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
		
		System.out.println("account_idx " + account_idx);
		datadto.setAccount_idx(account_idx);
		List<dataDTO> driversDetail = user_service.driversDetail(datadto);
		model.addAttribute("driversDetail", driversDetail);
		System.out.println("driversDetail : "+driversDetail.size());
		
		List<dataDTO> driversRoute = user_service.driversRoute(datadto);
		model.addAttribute("driversRoute", driversRoute);
		
        return "drivers/drivers_detail";
    }
	
	@RequestMapping(value = { "/drivers" }, method = RequestMethod.GET)
    public String driverslist(HttpSession session, HttpServletRequest request,Model model,dataDTO datadto) {
		
		if (!sessionCheck(request)) { return "redirect:/login"; }
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
		List<dataDTO> driverslist = user_service.driverslist();
		model.addAttribute("driverslist", driverslist);
		 		
        return "drivers/drivers_list";
    }
	
	@RequestMapping(value = { "/driversroute/{route_idx}" }, method = RequestMethod.GET)
    public String driversrouteDetail(HttpSession session, HttpServletRequest request,@PathVariable("route_idx") int route_idx,dataDTO datadto, Model model) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
        return "route/driversRoute_detail";
    }
	@RequestMapping(value = { "/driversroute" }, method = RequestMethod.GET)
    public String driversroutelist(HttpSession session, HttpServletRequest request, Model model, dataDTO datadto) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */	
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		List<dataDTO> driversroute = user_service.alldriverlist();
		
		model.addAttribute("driversroute", driversroute);
		
        return "route/driversRoute_list";
    }
	
	@RequestMapping(value = { "/userroute/{route_idx}" }, method = RequestMethod.GET)
    public String userrouteDetail(HttpSession session, HttpServletRequest request,@PathVariable("route_idx") int route_idx, Model model) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
		List<dataDTO> passengerroutedetails = user_service.passengerroutedetails(route_idx);
		
		dataDTO data = user_service.passengerdetailup(route_idx);
		
		
		model.addAttribute("passengerroutedetails", passengerroutedetails);
		model.addAttribute("lineidx", data.getLine_idx());
		model.addAttribute("current_people", data.getCurrent_people_count());
		model.addAttribute("hasDrvier", data.getHasDriver());
		model.addAttribute("line_location_address", data.getLine_location_address());
		model.addAttribute("line_destination_address", data.getLine_destination_address());
		
		
        return "route/userRoute_detail";
    }
	@RequestMapping(value = { "/userroute" }, method = RequestMethod.GET)
    public String userroutelist(HttpSession session, HttpServletRequest request, Model model) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
		
		List<dataDTO> passengerroutelist = user_service.passengerroutelist();
		
		model.addAttribute("passengerroutelist", passengerroutelist);
        return "route/userRoute_list";
    }
	@RequestMapping(value = { "/stop_driversRoute_list" }, method = RequestMethod.GET)
    public String stop_driversRoute_list(HttpSession session, HttpServletRequest request, Model model) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
		List<dataDTO> stopdriverlist = user_service.stopdriverlist();
		
		model.addAttribute("stopdriverlist", stopdriverlist);
        return "route/stop_driversRoute_list";
    }
	
	@RequestMapping(value = { "/transfer" }, method = RequestMethod.GET)
    public String transferlist(HttpSession session, HttpServletRequest request, Model model, dataDTO datadto) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
		
		List<dataDTO> accounttransfer = user_service.accounttransfer();
		
		System.out.println(accounttransfer.get(0).getLine_operating_fee_idx());
		
		model.addAttribute("accounttransfer", accounttransfer);	
        return "transfer/transfer_list";
    }
	
	@RequestMapping(value = { "/transferAdd" }, method = RequestMethod.GET)
    public String transferAdd(HttpSession session, HttpServletRequest request,dataDTO datadto, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
        return "transfer/transfer_add";
    }
	@ResponseBody
   	@RequestMapping(value = "/noticeDelete", method = RequestMethod.GET)
   	public int noticeDelete(dataDTO datadto, Model model,HttpSession session, HttpServletRequest request) {
		int temp_idx = Integer.parseInt(request.getParameter("notice_idx"));
		datadto.setNotice_idx(temp_idx);
		int noticeDelete = user_service.noticeDelete(datadto);
		model.addAttribute("noticeDelete", noticeDelete);
//   		System.out.println("select_goal = " + result.getPage_goal_idx());
   		return noticeDelete;
   	}
	@RequestMapping(value = { "/notice/{notice_idx}" }, method = RequestMethod.GET)
    public String noticeDetail(dataDTO datadto, Model model,HttpSession session, HttpServletRequest request,@PathVariable("notice_idx") int notice_idx) {
		
		if (!sessionCheck(request)) {
			return "redirect:/login";
		}
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		datadto.setNotice_idx(notice_idx);
		
		List<dataDTO> noticeDetail = user_service.noticeDetail(datadto);
		model.addAttribute("noticeDetail", noticeDetail);
		
		List<dataDTO> noticeBef = user_service.noticeBef(datadto);
		model.addAttribute("noticeBef", noticeBef);	
		
		List<dataDTO> noticeAft = user_service.noticeAft(datadto);
		model.addAttribute("noticeAft", noticeAft);	
		
        
		return "notice/notice_detail";
    }
	
	 @RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	 public String noticeInsert(HttpSession session,dataDTO datadto, Model model,@RequestParam("file") MultipartFile file,HttpServletRequest req) {
		if (!sessionCheck(req)) {
			return "redirect:/login";
		}
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
    	if (!file.isEmpty()) {
	         ftpOn();
	        String fileoriname = "";
			String filename = "";
			String fileUUID = "";
			InputStream in = null;
			
			try {
				in = file.getInputStream();
				this.chSftp.cd("/var/lib/tomcat9/webapps/media/shuttleking/notice");
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
	         
			datadto.setNotice_img_url(fileUUID);
	         //data.setEvent_thumbnail_org(fileoriname);
    		}
    		this.chSftp.quit(); 
    		user_service.nocticeInsert(datadto);
    		user_service.nocticeImgInsert(datadto);
    	
    		
      return "redirect:/notice";
    } 
	
	@RequestMapping(value = { "/noticeAdd" }, method = RequestMethod.GET)
    public String noticeAdd(HttpSession session, HttpServletRequest request,Model model,dataDTO datadto) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */	
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
        return "notice/notice_add";
    }
	
	@RequestMapping(value = { "/noticeEdit/{notice_idx}" }, method = RequestMethod.GET)
    public String noticeEdit(dataDTO datadto, Model model,HttpSession session, HttpServletRequest request,@PathVariable("notice_idx") int notice_idx) {
			
		if (!sessionCheck(request)) { return "redirect:/login"; }

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		List<dataDTO> noticeDetail = user_service.noticeDetail(datadto);
		model.addAttribute("noticeDetail", noticeDetail);
		
        return "notice/notice_update";
    }
	
	@RequestMapping(value = { "/notice" }, method = RequestMethod.GET)
    public String noticelist(HttpSession session, HttpServletRequest request,Model model, dataDTO datadto) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
		if (!sessionCheck(request)) { return "redirect:/login"; }
		
		List<dataDTO> noticelist = user_service.noticelist();
		model.addAttribute("noticelist", noticelist);
		
        return "notice/notice_list";
    }
	
	@RequestMapping(value = { "/event/{event_idx}" }, method = RequestMethod.GET)
    public String eventDetail(dataDTO datadto,HttpSession session,Model model, HttpServletRequest request,@PathVariable("event_idx") int event_idx) {
		if (!sessionCheck(request)) { return "redirect:/login"; }
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
		datadto.setEvent_idx(event_idx);
		List<dataDTO> eventDetail = user_service.eventDetail(datadto);
		model.addAttribute("eventDetail", eventDetail);		
		
		List<dataDTO> eventBef = user_service.eventBef(datadto);
		model.addAttribute("eventBef", eventBef);	
		
		List<dataDTO> eventAft = user_service.eventAft(datadto);
		model.addAttribute("eventAft", eventAft);
		
        return "event/event_detail";
    }
	
	@RequestMapping(value = { "/eventInsert" }, method = RequestMethod.POST)
    public String eventInsert(HttpSession session,dataDTO datadto, Model model,@RequestParam("file") MultipartFile file,HttpServletRequest req) {
		
		if (!sessionCheck(req)) { return "redirect:/login"; }
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		if (!file.isEmpty()) {
	         ftpOn();
	        String fileoriname = "";
			String filename = "";
			String fileUUID = "";
			InputStream in = null;
			
			try {
				in = file.getInputStream();
				this.chSftp.cd("/var/lib/tomcat9/webapps/media/shuttleking/event");
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
	         
			datadto.setEvent_img_url(fileUUID);
	         //data.setEvent_thumbnail_org(fileoriname);
   		}
   		this.chSftp.quit(); 
   		user_service.eventInsert(datadto);
   		user_service.eventImgInsert(datadto);
				
        return "redirect:/event";
    }
	
	@RequestMapping(value = { "/eventAdd" }, method = RequestMethod.GET)
    public String eventAdd(HttpSession session, HttpServletRequest request,dataDTO datadto, Model model) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
        return "event/event_add";
    }
	
	@RequestMapping(value = { "/eventUpdate" }, method = RequestMethod.POST)
    public String eventUpdate(HttpSession session,dataDTO datadto, Model model,@RequestParam("file") MultipartFile file,HttpServletRequest req) {
		
		if (!sessionCheck(req)) { return "redirect:/login"; }
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		if (!file.isEmpty()) {
	         ftpOn();
	        String fileoriname = "";
			String filename = "";
			String fileUUID = "";
			InputStream in = null;
			
			try {
				in = file.getInputStream();
				this.chSftp.cd("/var/lib/tomcat9/webapps/media/shuttleking/event");
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
	         
			datadto.setEvent_img_url(fileUUID);
			this.chSftp.quit(); 
	         //data.setEvent_thumbnail_org(fileoriname);
   		}
   		
   		user_service.eventUpdate(datadto);
   		user_service.eventImgUpdate(datadto);
				
        return "redirect:/event";
    }
	
	@RequestMapping(value = { "/eventEdit/{event_idx}" }, method = RequestMethod.GET)
    public String eventEdit(dataDTO datadto,HttpSession session,Model model, HttpServletRequest request,@PathVariable("event_idx") int event_idx) {
		
		if (!sessionCheck(request)) { return "redirect:/login"; }
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
		datadto.setEvent_idx(event_idx);
		List<dataDTO> eventDetail = user_service.eventDetail(datadto);
		model.addAttribute("eventDetail", eventDetail);	
		
        return "event/event_update";
    }
	
	@RequestMapping(value = { "/event" }, method = RequestMethod.GET)
    public String eventlist(HttpSession session, HttpServletRequest request,Model model,dataDTO datadto) {

		if (!sessionCheck(request)) { return "redirect:/login"; }
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		
		List<dataDTO> eventlist = user_service.eventlist();
		model.addAttribute("eventlist", eventlist);	
		
		System.out.println("eventlist : "+eventlist.size());
        return "event/event_list";
    }
	
	@RequestMapping(value = { "/contact/{contact_idx}" }, method = RequestMethod.GET)
    public String contactDetail(HttpSession session, HttpServletRequest request,@PathVariable("contact_idx") int contact_idx, Model model, dataDTO datadto) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		datadto.setQuestion_idx(contact_idx);
		List<dataDTO> contactDetail = user_service.questiondetails(datadto);
		model.addAttribute("contactDetail", contactDetail);
	    if (!contactDetail.isEmpty()) {
	        System.out.println(contactDetail.get(0).getQuestion_title());
	    } else {
	        System.out.println("eventDetail is empty");
	    }
		
	    System.out.println(datadto.getQuestion_idx());
	    
		List<dataDTO> contactBef = user_service.questionBef(datadto);
		model.addAttribute("contactBef", contactBef);	
	    if (!contactBef.isEmpty()) {
	        System.out.println(contactBef.get(0).getQuestion_title());
	    } else {
	        System.out.println("eventDetail is empty");
	    }
		List<dataDTO> contactAft = user_service.questionAft(datadto);
		model.addAttribute("contactAft", contactAft);
	    if (!contactAft.isEmpty()) {
	        System.out.println(contactAft.get(0).getQuestion_title());
	    } else {
	        System.out.println("eventDetail is empty");
	    }
	    
	    List<dataDTO> questionanswerlist = user_service.questionanswerlist(datadto);
	    model.addAttribute("questionanswerlist", questionanswerlist);
	    System.out.println("사이즈:"+questionanswerlist.size());
	    if (!questionanswerlist.isEmpty()) {
	        System.out.println(questionanswerlist.get(0).getQuestion_answer_description());
	    } else {
	        System.out.println("eventDetail is empty");
	    }
	    /*
		 * model.addAttribute("description", contactDetail.getQuestion_description());
		 * model.addAttribute("title", contactDetail.getQuestion_title());
		 * model.addAttribute("img", contactDetail.getQuestion_img());
		 * model.addAttribute("username", contactDetail.getAccount_name());
		 * model.addAttribute("time", contactDetail.getFormatted_createtime());
		 */
        return "contact/contact_detail";
    }
	
	@RequestMapping(value = { "/contactAdd" }, method = RequestMethod.GET)
    public String contactAdd(HttpSession session, HttpServletRequest request) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
        return "contact/contact_add";
    }
	
	@RequestMapping(value = { "/contactEdit/{contact_idx}" }, method = RequestMethod.GET)
    public String contactEdit(HttpSession session, HttpServletRequest request,@PathVariable("contact_idx") int contact_idx) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
        return "contact/contact_update";
    }
	
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
    public String contactlist(HttpSession session, HttpServletRequest request, Model model, dataDTO datadto) {
		/*
		 * if (!sessionCheck(request)) { return "redirect:/login"; }
		 */		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			session.setAttribute("login_check", "ok");
			session.setAttribute("user_id", userDetail.getUsername());
			
			String userName = auth.getName();
			
			datadto.setAdmin_id(userName);
			dataDTO data =  user_service.adminload(datadto);
			
			model.addAttribute("adminname", data.getAdmin_name());
		}
		
		
		List<dataDTO> data = user_service.questionlist();
		

		
		Map<String, Object> orderedData = new LinkedHashMap<String, Object>();
		orderedData.put("data", data);

		System.out.println("Ordered Data: ");
		
		List<dataDTO> dataList = (List<dataDTO>) orderedData.get("data");
		for (dataDTO dto : dataList) {
		    System.out.println("Question Title: " + dto.getQuestion_title());
		    System.out.println("Account Name: " + dto.getAccount_name());
		    System.out.println("Formatted Create Time: " + dto.getFormatted_createtime());
		    System.out.println("-------------------------");
		}
		
		
		model.addAttribute("data", orderedData);
		
        return "contact/contact_list";
    }
	
    @RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
    public String welcomePage(HttpSession session, HttpServletRequest request) {
    	if (!sessionCheck(request)) { return "redirect:/login"; }
        return "redirect:/drivers";

    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error, // 로그인 실패 시 spring 시큐리티에서 설정한
																						// error 메시지 출력
			HttpSession session, // 현재 웹 브라우저에 저장되어있는 세션값 받음
			@RequestParam(value = "logout", required = false) String logout, // 로그아웃 시 spring 시큐리티에서 설정한 logout 메시지 출력
			Model model, // 페이지 이동 및 페이지 데이터 전달을 위한 Model 객체 선언
			HttpServletRequest request) { // login페이지에 전달되는 Get 데이터를 받기위한 객체

		if (error != null) {
			model.addAttribute("error", "계정정보가 일치하지 않습니다.");
		}

		if (logout != null) {
			model.addAttribute("msg", "You've been logged out successfully.");
		}

		return "login";

	}
    
    @RequestMapping(value = { "/logout", }, method = RequestMethod.GET)
	public String logout(HttpServletRequest request, dataDTO data, Model model, HttpSession session) {

		if (!sessionCheck(request)) {
			return "redirect:/login";
		}
		session.invalidate();
			
		return "redirect:/login";
	}	
    
    
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
    
    @RequestMapping(value = { "/createtransfer" }, method = RequestMethod.POST)
    public String createtransfer(HttpSession session,dataDTO datadto, Model model, HttpServletRequest req) {
    	if (!sessionCheck(req)) { return "redirect:/login"; }
    	
    	System.out.println("createtransfer컨트롤러" + datadto.getLine_operating_fee_account_idx());
    	int createTransfer = user_service.createtransfer(datadto);
    	System.out.println("컨트롤러 실행완료");
    	
    	
    	return "transfer/transfer_list";
    }
	//정보가져오기
    @ResponseBody
	@RequestMapping(value = { "/transfercreate" }, method = RequestMethod.GET)
    public List<dataDTO> transfercreate(HttpSession session, HttpServletRequest request, @RequestParam int linenumber, @RequestParam String userid, Model model) {
			
		dataDTO dto = user_service.driverinfo(linenumber);
		System.out.println(dto.getLine_idx());
		System.out.println(dto.getLine_price());
		
		dataDTO userdto = user_service.searchuser(userid);
		System.out.println(userdto.getAccount_idx());
		System.out.println(userdto.getAccount_name());
		
		model.addAttribute("line_idx", dto.getLine_idx());
		model.addAttribute("price", dto.getLine_price());
		
		List<dataDTO> response = new ArrayList<dataDTO>();
		response.add(dto);
		response.add(userdto);
		
		
		
        return response;
    }
    
    @RequestMapping(value = { "/createquestion" }, method = RequestMethod.POST)
    public String createquestion(HttpSession session,dataDTO datadto, Model model, HttpServletRequest req, @RequestParam("file") MultipartFile file) {
    	if (!sessionCheck(req)) { return "redirect:/login"; }
    	
    	System.out.println("createnotice컨트롤러");
    	
    	if (!file.isEmpty()) {
	         ftpOn();
	        String fileoriname = "";
			String filename = "";
			String fileUUID = "";
			InputStream in = null;
			
			try {
				in = file.getInputStream();
				this.chSftp.cd("/var/lib/tomcat9/webapps/media/shuttleking/question");
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
	         
			datadto.setQuestion_img(fileUUID);
	         //data.setEvent_thumbnail_org(fileoriname);
   		}
   		this.chSftp.quit();
    	
    	
    	
    	int createquestion = user_service.createquestion(datadto);
    	System.out.println("컨트롤러 실행완료");
    	
    	
    	return "contact/contact_list";
    }
    
    @RequestMapping(value = { "/createanswer" }, method = RequestMethod.POST)
    public String createQuestionAnswer(HttpSession session,dataDTO datadto, Model model, HttpServletRequest req) {
    	if (!sessionCheck(req)) { return "redirect:/login"; }
    	
    	int createquestion = user_service.createQuestionAnswer(datadto);
    	
    	
    	return "contact/contact_list";
    }
    
   	@RequestMapping(value = "/answerdelete", method = RequestMethod.GET)
   	public String answerDelete(dataDTO datadto, Model model,HttpSession session, HttpServletRequest request) {
		
   		System.out.println("delete"+datadto.getQuestion_answer_idx());
   		datadto.setQuestion_answer_idx(datadto.getQuestion_answer_idx());
		
		
		int answerDelete = user_service.questiondelete(datadto);
		
   		return "/contact/contact_list";
   	}
   	
   	@RequestMapping(value = "/questiondetailsdelete", method = RequestMethod.GET)
   	public String questiondetailsdelete(dataDTO datadto, Model model,HttpSession session, HttpServletRequest request) {
		
   		System.out.println("questiondetailsdelete"+datadto.getQuestion_idx());
   		datadto.setQuestion_answer_idx(datadto.getQuestion_idx());
		
		
		int questiondetailsdelete = user_service.questiondetailsdelete(datadto);
		
   		return "/contact/contact_list";
   	}
   	
   	@RequestMapping(value = "/answerupdate", method = RequestMethod.POST)
   	public String answerupdate(dataDTO datadto, Model model,HttpSession session, HttpServletRequest request) {
		
   		System.out.println("answerupdate"+datadto.getQuestion_answer_description());
   		System.out.println("answerupdate"+datadto.getQuestion_answer_idx());
   		datadto.setQuestion_answer_idx(datadto.getQuestion_answer_idx());
		
		
		int answerupdate = user_service.answerupdate(datadto);
		
   		return "/contact/contact_list";
   	}
    
}
