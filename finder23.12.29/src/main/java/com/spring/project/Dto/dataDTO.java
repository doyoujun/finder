package com.spring.project.Dto;


public class dataDTO implements Comparable<dataDTO>{	
	private int enterprise_index;
	private String enterprise_name;
	private String enterprise_id;
	private String enterprise_pw;
	private String enterprise_terminal;
	private String enterprise_companycode;
	private String enterprise_createtime;
	private String enterprise_updatetime;
	private int enterprise_enterprise_info_index;
	private String enterprise_role;
	
	//긴급보고
	private int urgent_report_index;
	private String urgent_report_location;
	private String urgent_report_type;
	private String urgent_report_content;
	private String urgent_report_img;
	private String urgent_report_createtime;
	private String urgent_report_updatetime;
	private int urgent_report_user_index;
	private String formatted_createtime;
	
	//일반보고
	private int general_report_index;
	private String general_report_location;
	private String general_report_content;
	private String general_report_img;
	private String general_report_createtime;
	private String general_report_updatetime;
	private int general_report_user_index;
	private String general_formatted_createtime;
	
	//실시간 보고 생성시간 기준 통합정렬
	private String createtime;
	
	//유저
	private int user_index;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_team;
	private String user_position;
	private String user_duty;
	private String user_vehicle;
	private String user_birth;
	private String user_address;
	private String user_daddress;
	private String user_managerphone;
	private String user_email;
	private String user_profile;
	private int user_workstate;
	private int user_joinconfirm;
	private String user_role;
	private String user_createtime;
	private String user_updatetime;
	private int user_enterprise_info_index;
	private int user_vehicle_index;
	private int user_workcategory_index;

	//유저 수정 user_edit
	private int user_edit_index;
	private int user_edit_editconfirm;
	private String user_edit_id;
	private String user_edit_pw;
	private String user_edit_position;
	private String user_edit_name;
	private String user_edit_managerphone;
	private String user_edit_team;
	private String user_edit_duty;
	private String user_edit_vehicle;
	private String user_edit_birth;
	private String user_edit_address;
	private String user_edit_detailaddress;
	private String user_edit_email;
	private String user_edit_profile;
	private String user_edit_createtime;
	private String user_edit_updatetime;
	private String user_edit_user_index;
	private String user_edit_phone;
	
	//유저 생성시간 통합 기준
	private String create_user_time;
	
	//컨테이너
	private int container_index;
	private String container_name;
	private String container_img;
	private String container_team;
	private String container_nationality;
	private String container_type;
	private String container_IGT;
	private String container_portauthoritycode;
	private String container_inputdate;
	private String container_shippingdate;
	private String container_BIDOimg;
	private String container_createtime;
	private String container_updatetime;
	private int container_enterprise_info_index;
	
	//공지사항
	private int notice_index;
	private String notice_category;
	private String notice_writer;
	private String notice_title;
	private String notice_view;
	private String notice_content;
	private String notice_img;
	private String notice_createtime;
	private String notice_updatetime;
	
	//기업관리
	private int workcategory_index;
	private String workcategory_name;
	private String workcategory_content;
	private int workcategory_enterprise_index;
	
	//업무
	private int work_index;
	private String work_assigndate;
	private String work_location;
	private String work_name;
	private String work_nameimg;
	private String work_content;
	private String work_contentimg;
	private int work_status;
	private String work_startdate;
	private String work_completedate;
	private int work_user_index;
	private String work_startdates;
	private String work_completedates;
	private String work_completedatefull;
	
	//차량
	private int vehicle_index;
	private String vehicle_name;
	private String vehicle_num;
	private String vehicle_inputdate;
	private String vehicle_manager;
	private String vehicle_img;
	private String vehicle_createtime;
	private String vehicle_updatetime;
	private int vehicle_enterprise_index;
	private int vehicle_enterprise_info_index;
	
	public dataDTO() {
		
	}
	

	public dataDTO(int enterprise_index, String enterprise_name, String enterprise_id, String enterprise_pw,
			String enterprise_terminal, String enterprise_companycode, String enterprise_createtime,
			String enterprise_updatetime, int enterprise_enterprise_info_index, String enterprise_role,
			int urgent_report_index, String urgent_report_location, String urgent_report_type,
			String urgent_report_content, String urgent_report_img, String urgent_report_createtime,
			String urgent_report_updatetime, int urgent_report_user_index, String formatted_createtime,
			int general_report_index, String general_report_location, String general_report_content,
			String general_report_img, String general_report_createtime, String general_report_updatetime,
			int general_report_user_index, String general_formatted_createtime, String createtime, int user_index,
			String user_id, String user_pw, String user_name, String user_phone, String user_team, String user_position,
			String user_duty, String user_vehicle, String user_birth, String user_address, String user_daddress,
			String user_managerphone, String user_email, String user_profile, int user_workstate, int user_joinconfirm,
			String user_role, String user_createtime, String user_updatetime, int user_enterprise_info_index,
			int user_vehicle_index, int user_workcategory_index, int user_edit_index, int user_edit_editconfirm,
			String user_edit_id, String user_edit_pw, String user_edit_position, String user_edit_name,
			String user_edit_managerphone, String user_edit_team, String user_edit_duty, String user_edit_vehicle,
			String user_edit_birth, String user_edit_address, String user_edit_detailaddress, String user_edit_email,
			String user_edit_profile, String user_edit_createtime, String user_edit_updatetime,
			String user_edit_user_index, String user_edit_phone, String create_user_time, int container_index,
			String container_name, String container_img, String container_team, String container_nationality,
			String container_type, String container_IGT, String container_portauthoritycode, String container_inputdate,
			String container_shippingdate, String container_BIDOimg, String container_createtime,
			String container_updatetime, int container_enterprise_info_index, int notice_index, String notice_category,
			String notice_writer, String notice_title, String notice_view, String notice_content, String notice_img,
			String notice_createtime, String notice_updatetime, int workcategory_index, String workcategory_name,
			String workcategory_content, int workcategory_enterprise_index, int work_index, String work_assigndate,
			String work_location, String work_name, String work_nameimg, String work_content, String work_contentimg,
			int work_status, String work_startdate, String work_completedate, int work_user_index,
			String work_startdates, String work_completedates, String work_completedatefull, int vehicle_index,
			String vehicle_name, String vehicle_num, String vehicle_inputdate, String vehicle_manager,
			String vehicle_img, String vehicle_createtime, String vehicle_updatetime, int vehicle_enterprise_index,
			int vehicle_enterprise_info_index) {
		super();
		this.enterprise_index = enterprise_index;
		this.enterprise_name = enterprise_name;
		this.enterprise_id = enterprise_id;
		this.enterprise_pw = enterprise_pw;
		this.enterprise_terminal = enterprise_terminal;
		this.enterprise_companycode = enterprise_companycode;
		this.enterprise_createtime = enterprise_createtime;
		this.enterprise_updatetime = enterprise_updatetime;
		this.enterprise_enterprise_info_index = enterprise_enterprise_info_index;
		this.enterprise_role = enterprise_role;
		this.urgent_report_index = urgent_report_index;
		this.urgent_report_location = urgent_report_location;
		this.urgent_report_type = urgent_report_type;
		this.urgent_report_content = urgent_report_content;
		this.urgent_report_img = urgent_report_img;
		this.urgent_report_createtime = urgent_report_createtime;
		this.urgent_report_updatetime = urgent_report_updatetime;
		this.urgent_report_user_index = urgent_report_user_index;
		this.formatted_createtime = formatted_createtime;
		this.general_report_index = general_report_index;
		this.general_report_location = general_report_location;
		this.general_report_content = general_report_content;
		this.general_report_img = general_report_img;
		this.general_report_createtime = general_report_createtime;
		this.general_report_updatetime = general_report_updatetime;
		this.general_report_user_index = general_report_user_index;
		this.general_formatted_createtime = general_formatted_createtime;
		this.createtime = createtime;
		this.user_index = user_index;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_team = user_team;
		this.user_position = user_position;
		this.user_duty = user_duty;
		this.user_vehicle = user_vehicle;
		this.user_birth = user_birth;
		this.user_address = user_address;
		this.user_daddress = user_daddress;
		this.user_managerphone = user_managerphone;
		this.user_email = user_email;
		this.user_profile = user_profile;
		this.user_workstate = user_workstate;
		this.user_joinconfirm = user_joinconfirm;
		this.user_role = user_role;
		this.user_createtime = user_createtime;
		this.user_updatetime = user_updatetime;
		this.user_enterprise_info_index = user_enterprise_info_index;
		this.user_vehicle_index = user_vehicle_index;
		this.user_workcategory_index = user_workcategory_index;
		this.user_edit_index = user_edit_index;
		this.user_edit_editconfirm = user_edit_editconfirm;
		this.user_edit_id = user_edit_id;
		this.user_edit_pw = user_edit_pw;
		this.user_edit_position = user_edit_position;
		this.user_edit_name = user_edit_name;
		this.user_edit_managerphone = user_edit_managerphone;
		this.user_edit_team = user_edit_team;
		this.user_edit_duty = user_edit_duty;
		this.user_edit_vehicle = user_edit_vehicle;
		this.user_edit_birth = user_edit_birth;
		this.user_edit_address = user_edit_address;
		this.user_edit_detailaddress = user_edit_detailaddress;
		this.user_edit_email = user_edit_email;
		this.user_edit_profile = user_edit_profile;
		this.user_edit_createtime = user_edit_createtime;
		this.user_edit_updatetime = user_edit_updatetime;
		this.user_edit_user_index = user_edit_user_index;
		this.user_edit_phone = user_edit_phone;
		this.create_user_time = create_user_time;
		this.container_index = container_index;
		this.container_name = container_name;
		this.container_img = container_img;
		this.container_team = container_team;
		this.container_nationality = container_nationality;
		this.container_type = container_type;
		this.container_IGT = container_IGT;
		this.container_portauthoritycode = container_portauthoritycode;
		this.container_inputdate = container_inputdate;
		this.container_shippingdate = container_shippingdate;
		this.container_BIDOimg = container_BIDOimg;
		this.container_createtime = container_createtime;
		this.container_updatetime = container_updatetime;
		this.container_enterprise_info_index = container_enterprise_info_index;
		this.notice_index = notice_index;
		this.notice_category = notice_category;
		this.notice_writer = notice_writer;
		this.notice_title = notice_title;
		this.notice_view = notice_view;
		this.notice_content = notice_content;
		this.notice_img = notice_img;
		this.notice_createtime = notice_createtime;
		this.notice_updatetime = notice_updatetime;
		this.workcategory_index = workcategory_index;
		this.workcategory_name = workcategory_name;
		this.workcategory_content = workcategory_content;
		this.workcategory_enterprise_index = workcategory_enterprise_index;
		this.work_index = work_index;
		this.work_assigndate = work_assigndate;
		this.work_location = work_location;
		this.work_name = work_name;
		this.work_nameimg = work_nameimg;
		this.work_content = work_content;
		this.work_contentimg = work_contentimg;
		this.work_status = work_status;
		this.work_startdate = work_startdate;
		this.work_completedate = work_completedate;
		this.work_user_index = work_user_index;
		this.work_startdates = work_startdates;
		this.work_completedates = work_completedates;
		this.work_completedatefull = work_completedatefull;
		this.vehicle_index = vehicle_index;
		this.vehicle_name = vehicle_name;
		this.vehicle_num = vehicle_num;
		this.vehicle_inputdate = vehicle_inputdate;
		this.vehicle_manager = vehicle_manager;
		this.vehicle_img = vehicle_img;
		this.vehicle_createtime = vehicle_createtime;
		this.vehicle_updatetime = vehicle_updatetime;
		this.vehicle_enterprise_index = vehicle_enterprise_index;
		this.vehicle_enterprise_info_index = vehicle_enterprise_info_index;
	}



	public int getEnterprise_index() {
		return enterprise_index;
	}



	public void setEnterprise_index(int enterprise_index) {
		this.enterprise_index = enterprise_index;
	}



	public String getEnterprise_name() {
		return enterprise_name;
	}



	public void setEnterprise_name(String enterprise_name) {
		this.enterprise_name = enterprise_name;
	}



	public String getEnterprise_id() {
		return enterprise_id;
	}



	public void setEnterprise_id(String enterprise_id) {
		this.enterprise_id = enterprise_id;
	}



	public String getEnterprise_pw() {
		return enterprise_pw;
	}



	public void setEnterprise_pw(String enterprise_pw) {
		this.enterprise_pw = enterprise_pw;
	}



	public String getEnterprise_terminal() {
		return enterprise_terminal;
	}



	public void setEnterprise_terminal(String enterprise_terminal) {
		this.enterprise_terminal = enterprise_terminal;
	}



	public String getEnterprise_companycode() {
		return enterprise_companycode;
	}



	public void setEnterprise_companycode(String enterprise_companycode) {
		this.enterprise_companycode = enterprise_companycode;
	}



	public String getEnterprise_createtime() {
		return enterprise_createtime;
	}



	public void setEnterprise_createtime(String enterprise_createtime) {
		this.enterprise_createtime = enterprise_createtime;
	}



	public String getEnterprise_updatetime() {
		return enterprise_updatetime;
	}



	public void setEnterprise_updatetime(String enterprise_updatetime) {
		this.enterprise_updatetime = enterprise_updatetime;
	}



	public int getEnterprise_enterprise_info_index() {
		return enterprise_enterprise_info_index;
	}



	public void setEnterprise_enterprise_info_index(int enterprise_enterprise_info_index) {
		this.enterprise_enterprise_info_index = enterprise_enterprise_info_index;
	}



	public String getEnterprise_role() {
		return enterprise_role;
	}



	public void setEnterprise_role(String enterprise_role) {
		this.enterprise_role = enterprise_role;
	}



	public int getUrgent_report_index() {
		return urgent_report_index;
	}



	public void setUrgent_report_index(int urgent_report_index) {
		this.urgent_report_index = urgent_report_index;
	}



	public String getUrgent_report_location() {
		return urgent_report_location;
	}



	public void setUrgent_report_location(String urgent_report_location) {
		this.urgent_report_location = urgent_report_location;
	}



	public String getUrgent_report_type() {
		return urgent_report_type;
	}



	public void setUrgent_report_type(String urgent_report_type) {
		this.urgent_report_type = urgent_report_type;
	}



	public String getUrgent_report_content() {
		return urgent_report_content;
	}



	public void setUrgent_report_content(String urgent_report_content) {
		this.urgent_report_content = urgent_report_content;
	}



	public String getUrgent_report_img() {
		return urgent_report_img;
	}



	public void setUrgent_report_img(String urgent_report_img) {
		this.urgent_report_img = urgent_report_img;
	}



	public String getUrgent_report_createtime() {
		return urgent_report_createtime;
	}



	public void setUrgent_report_createtime(String urgent_report_createtime) {
		this.urgent_report_createtime = urgent_report_createtime;
	}



	public String getUrgent_report_updatetime() {
		return urgent_report_updatetime;
	}



	public void setUrgent_report_updatetime(String urgent_report_updatetime) {
		this.urgent_report_updatetime = urgent_report_updatetime;
	}



	public int getUrgent_report_user_index() {
		return urgent_report_user_index;
	}



	public void setUrgent_report_user_index(int urgent_report_user_index) {
		this.urgent_report_user_index = urgent_report_user_index;
	}



	public String getFormatted_createtime() {
		return formatted_createtime;
	}



	public void setFormatted_createtime(String formatted_createtime) {
		this.formatted_createtime = formatted_createtime;
	}



	public int getGeneral_report_index() {
		return general_report_index;
	}



	public void setGeneral_report_index(int general_report_index) {
		this.general_report_index = general_report_index;
	}



	public String getGeneral_report_location() {
		return general_report_location;
	}



	public void setGeneral_report_location(String general_report_location) {
		this.general_report_location = general_report_location;
	}



	public String getGeneral_report_content() {
		return general_report_content;
	}



	public void setGeneral_report_content(String general_report_content) {
		this.general_report_content = general_report_content;
	}



	public String getGeneral_report_img() {
		return general_report_img;
	}



	public void setGeneral_report_img(String general_report_img) {
		this.general_report_img = general_report_img;
	}



	public String getGeneral_report_createtime() {
		return general_report_createtime;
	}



	public void setGeneral_report_createtime(String general_report_createtime) {
		this.general_report_createtime = general_report_createtime;
	}



	public String getGeneral_report_updatetime() {
		return general_report_updatetime;
	}



	public void setGeneral_report_updatetime(String general_report_updatetime) {
		this.general_report_updatetime = general_report_updatetime;
	}



	public int getGeneral_report_user_index() {
		return general_report_user_index;
	}



	public void setGeneral_report_user_index(int general_report_user_index) {
		this.general_report_user_index = general_report_user_index;
	}



	public String getGeneral_formatted_createtime() {
		return general_formatted_createtime;
	}



	public void setGeneral_formatted_createtime(String general_formatted_createtime) {
		this.general_formatted_createtime = general_formatted_createtime;
	}



	public String getCreatetime() {
		return createtime;
	}



	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}



	public int getUser_index() {
		return user_index;
	}



	public void setUser_index(int user_index) {
		this.user_index = user_index;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getUser_pw() {
		return user_pw;
	}



	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getUser_phone() {
		return user_phone;
	}



	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}



	public String getUser_team() {
		return user_team;
	}



	public void setUser_team(String user_team) {
		this.user_team = user_team;
	}



	public String getUser_position() {
		return user_position;
	}



	public void setUser_position(String user_position) {
		this.user_position = user_position;
	}



	public String getUser_duty() {
		return user_duty;
	}



	public void setUser_duty(String user_duty) {
		this.user_duty = user_duty;
	}



	public String getUser_vehicle() {
		return user_vehicle;
	}



	public void setUser_vehicle(String user_vehicle) {
		this.user_vehicle = user_vehicle;
	}



	public String getUser_birth() {
		return user_birth;
	}



	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}



	public String getUser_address() {
		return user_address;
	}



	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}



	public String getUser_daddress() {
		return user_daddress;
	}



	public void setUser_daddress(String user_daddress) {
		this.user_daddress = user_daddress;
	}



	public String getUser_managerphone() {
		return user_managerphone;
	}



	public void setUser_managerphone(String user_managerphone) {
		this.user_managerphone = user_managerphone;
	}



	public String getUser_email() {
		return user_email;
	}



	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}



	public String getUser_profile() {
		return user_profile;
	}



	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}



	public int getUser_workstate() {
		return user_workstate;
	}



	public void setUser_workstate(int user_workstate) {
		this.user_workstate = user_workstate;
	}



	public int getUser_joinconfirm() {
		return user_joinconfirm;
	}



	public void setUser_joinconfirm(int user_joinconfirm) {
		this.user_joinconfirm = user_joinconfirm;
	}



	public String getUser_role() {
		return user_role;
	}



	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}



	public String getUser_createtime() {
		return user_createtime;
	}



	public void setUser_createtime(String user_createtime) {
		this.user_createtime = user_createtime;
	}



	public String getUser_updatetime() {
		return user_updatetime;
	}



	public void setUser_updatetime(String user_updatetime) {
		this.user_updatetime = user_updatetime;
	}



	public int getUser_enterprise_info_index() {
		return user_enterprise_info_index;
	}



	public void setUser_enterprise_info_index(int user_enterprise_info_index) {
		this.user_enterprise_info_index = user_enterprise_info_index;
	}



	public int getUser_vehicle_index() {
		return user_vehicle_index;
	}



	public void setUser_vehicle_index(int user_vehicle_index) {
		this.user_vehicle_index = user_vehicle_index;
	}



	public int getUser_workcategory_index() {
		return user_workcategory_index;
	}



	public void setUser_workcategory_index(int user_workcategory_index) {
		this.user_workcategory_index = user_workcategory_index;
	}



	public int getUser_edit_index() {
		return user_edit_index;
	}



	public void setUser_edit_index(int user_edit_index) {
		this.user_edit_index = user_edit_index;
	}



	public int getUser_edit_editconfirm() {
		return user_edit_editconfirm;
	}



	public void setUser_edit_editconfirm(int user_edit_editconfirm) {
		this.user_edit_editconfirm = user_edit_editconfirm;
	}



	public String getUser_edit_id() {
		return user_edit_id;
	}



	public void setUser_edit_id(String user_edit_id) {
		this.user_edit_id = user_edit_id;
	}



	public String getUser_edit_pw() {
		return user_edit_pw;
	}



	public void setUser_edit_pw(String user_edit_pw) {
		this.user_edit_pw = user_edit_pw;
	}



	public String getUser_edit_position() {
		return user_edit_position;
	}



	public void setUser_edit_position(String user_edit_position) {
		this.user_edit_position = user_edit_position;
	}



	public String getUser_edit_name() {
		return user_edit_name;
	}



	public void setUser_edit_name(String user_edit_name) {
		this.user_edit_name = user_edit_name;
	}



	public String getUser_edit_managerphone() {
		return user_edit_managerphone;
	}



	public void setUser_edit_managerphone(String user_edit_managerphone) {
		this.user_edit_managerphone = user_edit_managerphone;
	}



	public String getUser_edit_team() {
		return user_edit_team;
	}



	public void setUser_edit_team(String user_edit_team) {
		this.user_edit_team = user_edit_team;
	}



	public String getUser_edit_duty() {
		return user_edit_duty;
	}



	public void setUser_edit_duty(String user_edit_duty) {
		this.user_edit_duty = user_edit_duty;
	}



	public String getUser_edit_vehicle() {
		return user_edit_vehicle;
	}



	public void setUser_edit_vehicle(String user_edit_vehicle) {
		this.user_edit_vehicle = user_edit_vehicle;
	}



	public String getUser_edit_birth() {
		return user_edit_birth;
	}



	public void setUser_edit_birth(String user_edit_birth) {
		this.user_edit_birth = user_edit_birth;
	}



	public String getUser_edit_address() {
		return user_edit_address;
	}



	public void setUser_edit_address(String user_edit_address) {
		this.user_edit_address = user_edit_address;
	}



	public String getUser_edit_detailaddress() {
		return user_edit_detailaddress;
	}



	public void setUser_edit_detailaddress(String user_edit_detailaddress) {
		this.user_edit_detailaddress = user_edit_detailaddress;
	}



	public String getUser_edit_email() {
		return user_edit_email;
	}



	public void setUser_edit_email(String user_edit_email) {
		this.user_edit_email = user_edit_email;
	}



	public String getUser_edit_profile() {
		return user_edit_profile;
	}



	public void setUser_edit_profile(String user_edit_profile) {
		this.user_edit_profile = user_edit_profile;
	}



	public String getUser_edit_createtime() {
		return user_edit_createtime;
	}



	public void setUser_edit_createtime(String user_edit_createtime) {
		this.user_edit_createtime = user_edit_createtime;
	}



	public String getUser_edit_updatetime() {
		return user_edit_updatetime;
	}



	public void setUser_edit_updatetime(String user_edit_updatetime) {
		this.user_edit_updatetime = user_edit_updatetime;
	}



	public String getUser_edit_user_index() {
		return user_edit_user_index;
	}



	public void setUser_edit_user_index(String user_edit_user_index) {
		this.user_edit_user_index = user_edit_user_index;
	}



	public String getUser_edit_phone() {
		return user_edit_phone;
	}



	public void setUser_edit_phone(String user_edit_phone) {
		this.user_edit_phone = user_edit_phone;
	}



	public String getCreate_user_time() {
		return create_user_time;
	}



	public void setCreate_user_time(String create_user_time) {
		this.create_user_time = create_user_time;
	}



	public int getContainer_index() {
		return container_index;
	}



	public void setContainer_index(int container_index) {
		this.container_index = container_index;
	}



	public String getContainer_name() {
		return container_name;
	}



	public void setContainer_name(String container_name) {
		this.container_name = container_name;
	}



	public String getContainer_img() {
		return container_img;
	}



	public void setContainer_img(String container_img) {
		this.container_img = container_img;
	}



	public String getContainer_team() {
		return container_team;
	}



	public void setContainer_team(String container_team) {
		this.container_team = container_team;
	}



	public String getContainer_nationality() {
		return container_nationality;
	}



	public void setContainer_nationality(String container_nationality) {
		this.container_nationality = container_nationality;
	}



	public String getContainer_type() {
		return container_type;
	}



	public void setContainer_type(String container_type) {
		this.container_type = container_type;
	}



	public String getContainer_IGT() {
		return container_IGT;
	}



	public void setContainer_IGT(String container_IGT) {
		this.container_IGT = container_IGT;
	}



	public String getContainer_portauthoritycode() {
		return container_portauthoritycode;
	}



	public void setContainer_portauthoritycode(String container_portauthoritycode) {
		this.container_portauthoritycode = container_portauthoritycode;
	}



	public String getContainer_inputdate() {
		return container_inputdate;
	}



	public void setContainer_inputdate(String container_inputdate) {
		this.container_inputdate = container_inputdate;
	}



	public String getContainer_shippingdate() {
		return container_shippingdate;
	}



	public void setContainer_shippingdate(String container_shippingdate) {
		this.container_shippingdate = container_shippingdate;
	}



	public String getContainer_BIDOimg() {
		return container_BIDOimg;
	}



	public void setContainer_BIDOimg(String container_BIDOimg) {
		this.container_BIDOimg = container_BIDOimg;
	}



	public String getContainer_createtime() {
		return container_createtime;
	}



	public void setContainer_createtime(String container_createtime) {
		this.container_createtime = container_createtime;
	}



	public String getContainer_updatetime() {
		return container_updatetime;
	}



	public void setContainer_updatetime(String container_updatetime) {
		this.container_updatetime = container_updatetime;
	}



	public int getContainer_enterprise_info_index() {
		return container_enterprise_info_index;
	}



	public void setContainer_enterprise_info_index(int container_enterprise_info_index) {
		this.container_enterprise_info_index = container_enterprise_info_index;
	}



	public int getNotice_index() {
		return notice_index;
	}



	public void setNotice_index(int notice_index) {
		this.notice_index = notice_index;
	}



	public String getNotice_category() {
		return notice_category;
	}



	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}



	public String getNotice_writer() {
		return notice_writer;
	}



	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}



	public String getNotice_title() {
		return notice_title;
	}



	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}



	public String getNotice_view() {
		return notice_view;
	}



	public void setNotice_view(String notice_view) {
		this.notice_view = notice_view;
	}



	public String getNotice_content() {
		return notice_content;
	}



	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}



	public String getNotice_img() {
		return notice_img;
	}



	public void setNotice_img(String notice_img) {
		this.notice_img = notice_img;
	}



	public String getNotice_createtime() {
		return notice_createtime;
	}



	public void setNotice_createtime(String notice_createtime) {
		this.notice_createtime = notice_createtime;
	}



	public String getNotice_updatetime() {
		return notice_updatetime;
	}



	public void setNotice_updatetime(String notice_updatetime) {
		this.notice_updatetime = notice_updatetime;
	}



	public int getWorkcategory_index() {
		return workcategory_index;
	}



	public void setWorkcategory_index(int workcategory_index) {
		this.workcategory_index = workcategory_index;
	}



	public String getWorkcategory_name() {
		return workcategory_name;
	}



	public void setWorkcategory_name(String workcategory_name) {
		this.workcategory_name = workcategory_name;
	}



	public String getWorkcategory_content() {
		return workcategory_content;
	}



	public void setWorkcategory_content(String workcategory_content) {
		this.workcategory_content = workcategory_content;
	}



	public int getWorkcategory_enterprise_index() {
		return workcategory_enterprise_index;
	}



	public void setWorkcategory_enterprise_index(int workcategory_enterprise_index) {
		this.workcategory_enterprise_index = workcategory_enterprise_index;
	}



	public int getWork_index() {
		return work_index;
	}



	public void setWork_index(int work_index) {
		this.work_index = work_index;
	}



	public String getWork_assigndate() {
		return work_assigndate;
	}



	public void setWork_assigndate(String work_assigndate) {
		this.work_assigndate = work_assigndate;
	}



	public String getWork_location() {
		return work_location;
	}



	public void setWork_location(String work_location) {
		this.work_location = work_location;
	}



	public String getWork_name() {
		return work_name;
	}



	public void setWork_name(String work_name) {
		this.work_name = work_name;
	}



	public String getWork_nameimg() {
		return work_nameimg;
	}



	public void setWork_nameimg(String work_nameimg) {
		this.work_nameimg = work_nameimg;
	}



	public String getWork_content() {
		return work_content;
	}



	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}



	public String getWork_contentimg() {
		return work_contentimg;
	}



	public void setWork_contentimg(String work_contentimg) {
		this.work_contentimg = work_contentimg;
	}



	public int getWork_status() {
		return work_status;
	}



	public void setWork_status(int work_status) {
		this.work_status = work_status;
	}



	public String getWork_startdate() {
		return work_startdate;
	}



	public void setWork_startdate(String work_startdate) {
		this.work_startdate = work_startdate;
	}



	public String getWork_completedate() {
		return work_completedate;
	}



	public void setWork_completedate(String work_completedate) {
		this.work_completedate = work_completedate;
	}



	public int getWork_user_index() {
		return work_user_index;
	}



	public void setWork_user_index(int work_user_index) {
		this.work_user_index = work_user_index;
	}



	public String getWork_startdates() {
		return work_startdates;
	}



	public void setWork_startdates(String work_startdates) {
		this.work_startdates = work_startdates;
	}



	public String getWork_completedates() {
		return work_completedates;
	}



	public void setWork_completedates(String work_completedates) {
		this.work_completedates = work_completedates;
	}



	public String getWork_completedatefull() {
		return work_completedatefull;
	}



	public void setWork_completedatefull(String work_completedatefull) {
		this.work_completedatefull = work_completedatefull;
	}



	public int getVehicle_index() {
		return vehicle_index;
	}



	public void setVehicle_index(int vehicle_index) {
		this.vehicle_index = vehicle_index;
	}



	public String getVehicle_name() {
		return vehicle_name;
	}



	public void setVehicle_name(String vehicle_name) {
		this.vehicle_name = vehicle_name;
	}



	public String getVehicle_num() {
		return vehicle_num;
	}



	public void setVehicle_num(String vehicle_num) {
		this.vehicle_num = vehicle_num;
	}



	public String getVehicle_inputdate() {
		return vehicle_inputdate;
	}



	public void setVehicle_inputdate(String vehicle_inputdate) {
		this.vehicle_inputdate = vehicle_inputdate;
	}



	public String getVehicle_manager() {
		return vehicle_manager;
	}



	public void setVehicle_manager(String vehicle_manager) {
		this.vehicle_manager = vehicle_manager;
	}



	public String getVehicle_img() {
		return vehicle_img;
	}



	public void setVehicle_img(String vehicle_img) {
		this.vehicle_img = vehicle_img;
	}



	public String getVehicle_createtime() {
		return vehicle_createtime;
	}



	public void setVehicle_createtime(String vehicle_createtime) {
		this.vehicle_createtime = vehicle_createtime;
	}



	public String getVehicle_updatetime() {
		return vehicle_updatetime;
	}



	public void setVehicle_updatetime(String vehicle_updatetime) {
		this.vehicle_updatetime = vehicle_updatetime;
	}



	public int getVehicle_enterprise_index() {
		return vehicle_enterprise_index;
	}



	public void setVehicle_enterprise_index(int vehicle_enterprise_index) {
		this.vehicle_enterprise_index = vehicle_enterprise_index;
	}



	public int getVehicle_enterprise_info_index() {
		return vehicle_enterprise_info_index;
	}



	public void setVehicle_enterprise_info_index(int vehicle_enterprise_info_index) {
		this.vehicle_enterprise_info_index = vehicle_enterprise_info_index;
	}



	@Override
	public int compareTo(dataDTO o) {
		
		if(this.getCreatetime() != null && o.getCreatetime() != null) {
			
			 int compareByCreatetime = this.getCreatetime().compareTo(o.getCreatetime());
		
			 return (compareByCreatetime == 0) ? compareCreateUserTime(o) : compareByCreatetime;
		} else if (this.getCreatetime() == null && o.getCreatetime() == null) {
			
			return compareCreateUserTime(o);
		} else {
			return (this.getCreatetime() == null) ? -1 : 1;
		}
	        
	}
	
	private int compareCreateUserTime(dataDTO o) {
	    if (this.getCreate_user_time() != null && o.getCreate_user_time() != null) {
	        return this.getCreate_user_time().compareTo(o.getCreate_user_time());
	    } else {
	        return (this.getCreate_user_time() == null) ? -1 : 1;
	    }
	} 


}
