package com.spring.project.Dto;


public class dataDTO {	
	private int account_idx; 
	private String account_id; 
	private String account_password; 
	private String account_name; 
	private String account_phone; 
	private String account_createtime; 
	private String account_updatetime;
	private int account_enable;
	
	private int admin_idx;
	private String admin_id; 
	private String admin_pw;
	private String admin_name;
	private int admin_enable; 
	private String admin_role;
	private String admin_createtime; 
	private String admin_updatetime;
	
	private int day_of_week_idx; 
	private String day_of_week_value;
	
	private int diver_line_idx; 
	private int diver_line_driver_idx; 
	private int diver_line_line_idx; 
	private int diver_line_is_active;
	
	private int driver_idx; 
	private int driver_account_idx; 
	private String driver_cartype; 
	private String driver_carnum; 
	private String driver_bank_account_number; 
	private String driver_bank_name; 
	private String driver_licent_img_url; 
	private int driver_is_confirm;
	
	private int event_idx; 
	private String event_title; 
	private String event_createtime; 
	private String event_updatetime;
	
	private int event_img_idx; 
	private int event_img_event_idx; 
	private String event_img_url;
	
	private int line_idx; 
	private int line_account_idx; 
	private int line_capacity; 
	private String line_car_type; 
	private String line_price;
	
	private int line_location_idx; 
	private int line_location_line_idx; 
	private double line_location_latitude; 
	private double line_location_longitude; 
	private String line_location_address;
	private String line_location_destination_address;
	private String line_location_start_time; 
	private String line_location_end_time;
	
	private int line_operating_fee_idx; 
	private int line_operating_fee_line_idx; 
	private int line_operating_fee_account_idx; 
	private int line_operating_fee_month; 
	private int line_operating_fee_deposit_status; 
	private String line_operating_fee_createtime; 
	private String line_operating_fee_updatetime;
	
	private int line_operation_day_idx; 
	private int line_operation_day_line_idx; 
	private int line_operation_day_day_of_week_idx;
	
	private int line_passengers_idx; 
	private int line_passengers_line_idx; 
	private int line_passengers_account_idx; 
	private int line_location_line_location_idx; 
	private int line_passengers_is_active;
	
	private int line_stop_passengers_idx; 
	private int line_stop_passengers_line_idx; 
	private String line_stop_passengers_reason; 
	private String line_stop_passengers_createtime; 
	private String line_stop_passengers_updatetime;
	
	private int notice_idx; 
	private String notice_title; 
	private String notice_description; 
	private String notice_createtime; 
	private String notice_updatetime;
	
	private int notice_img_idx; 
	private String notice_img_notice_idx; 
	private String notice_img_url;
	
	private int question_idx; 
	private String account_account_idx;
	private String question_description; 
	private String question_createtime; 
	private String question_updatetime;
	private String question_title;
	private String question_img;
	private int question_del;
	
	private int question_answer_idx; 
	private int question_answer_question_idx; 
	private String question_answer_description; 
	private String question_answer_createtime; 
	private String question_answer_updatetime;
	private String question_answer_writer;
	private int question_asnwer_del;
	
	private String account_email;
	private int driver_maxpass;
	private int driver_line_is_active;
	private int account_division;
	
	private int notice_del;
	private int event_del;
	
	private int select_notice_idx;
	private int select_event_idx;
	
	private String event_s;
	private String event_e;
	
	private String event_description;
	
	private String start_time;
	
	private int current_people_count;
	
	private String line_destination_address;
	
	private String driver_stop_reason;
	
	private int hasDriver;
	
	private String line_operating_fee_date;
	private String driver_account_name;
	private String driver_account_id;
	private String line_operating_fee_depositor_name;
	private String line_operating_fee_deposit_amount;
	private String formatted_createtime;
	
	public dataDTO() {
	}

	
	
	public dataDTO(int account_idx, String account_id, String account_password, String account_name,
			String account_phone, String account_createtime, String account_updatetime, int account_enable,
			int admin_idx, String admin_id, String admin_pw, String admin_name, int admin_enable, String admin_role,
			String admin_createtime, String admin_updatetime, int day_of_week_idx, String day_of_week_value,
			int diver_line_idx, int diver_line_driver_idx, int diver_line_line_idx, int diver_line_is_active,
			int driver_idx, int driver_account_idx, String driver_cartype, String driver_carnum,
			String driver_bank_account_number, String driver_bank_name, String driver_licent_img_url,
			int driver_is_confirm, int event_idx, String event_title, String event_createtime, String event_updatetime,
			int event_img_idx, int event_img_event_idx, String event_img_url, int line_idx, int line_account_idx,
			int line_capacity, String line_car_type, String line_price, int line_location_idx,
			int line_location_line_idx, double line_location_latitude, double line_location_longitude,
			String line_location_address, String line_location_destination_address, String line_location_start_time,
			String line_location_end_time, int line_operating_fee_idx, int line_operating_fee_line_idx,
			int line_operating_fee_account_idx, int line_operating_fee_month, int line_operating_fee_deposit_status,
			String line_operating_fee_createtime, String line_operating_fee_updatetime, int line_operation_day_idx,
			int line_operation_day_line_idx, int line_operation_day_day_of_week_idx, int line_passengers_idx,
			int line_passengers_line_idx, int line_passengers_account_idx, int line_location_line_location_idx,
			int line_passengers_is_active, int line_stop_passengers_idx, int line_stop_passengers_line_idx,
			String line_stop_passengers_reason, String line_stop_passengers_createtime,
			String line_stop_passengers_updatetime, int notice_idx, String notice_title, String notice_description,
			String notice_createtime, String notice_updatetime, int notice_img_idx, String notice_img_notice_idx,
			String notice_img_url, int question_idx, String account_account_idx, String question_description,
			String question_createtime, String question_updatetime, String question_title, String question_img,
			int question_del, int question_answer_idx, int question_answer_question_idx,
			String question_answer_description, String question_answer_createtime, String question_answer_updatetime,
			String question_answer_writer, int question_asnwer_del, String account_email, int driver_maxpass,
			int driver_line_is_active, int account_division, int notice_del, int event_del, int select_notice_idx,
			int select_event_idx, String event_s, String event_e, String event_description, String start_time,
			int current_people_count, String line_destination_address, String driver_stop_reason, int hasDriver,
			String line_operating_fee_date, String driver_account_name, String driver_account_id,
			String line_operating_fee_depositor_name, String line_operating_fee_deposit_amount,
			String formatted_createtime) {
		super();
		this.account_idx = account_idx;
		this.account_id = account_id;
		this.account_password = account_password;
		this.account_name = account_name;
		this.account_phone = account_phone;
		this.account_createtime = account_createtime;
		this.account_updatetime = account_updatetime;
		this.account_enable = account_enable;
		this.admin_idx = admin_idx;
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
		this.admin_name = admin_name;
		this.admin_enable = admin_enable;
		this.admin_role = admin_role;
		this.admin_createtime = admin_createtime;
		this.admin_updatetime = admin_updatetime;
		this.day_of_week_idx = day_of_week_idx;
		this.day_of_week_value = day_of_week_value;
		this.diver_line_idx = diver_line_idx;
		this.diver_line_driver_idx = diver_line_driver_idx;
		this.diver_line_line_idx = diver_line_line_idx;
		this.diver_line_is_active = diver_line_is_active;
		this.driver_idx = driver_idx;
		this.driver_account_idx = driver_account_idx;
		this.driver_cartype = driver_cartype;
		this.driver_carnum = driver_carnum;
		this.driver_bank_account_number = driver_bank_account_number;
		this.driver_bank_name = driver_bank_name;
		this.driver_licent_img_url = driver_licent_img_url;
		this.driver_is_confirm = driver_is_confirm;
		this.event_idx = event_idx;
		this.event_title = event_title;
		this.event_createtime = event_createtime;
		this.event_updatetime = event_updatetime;
		this.event_img_idx = event_img_idx;
		this.event_img_event_idx = event_img_event_idx;
		this.event_img_url = event_img_url;
		this.line_idx = line_idx;
		this.line_account_idx = line_account_idx;
		this.line_capacity = line_capacity;
		this.line_car_type = line_car_type;
		this.line_price = line_price;
		this.line_location_idx = line_location_idx;
		this.line_location_line_idx = line_location_line_idx;
		this.line_location_latitude = line_location_latitude;
		this.line_location_longitude = line_location_longitude;
		this.line_location_address = line_location_address;
		this.line_location_destination_address = line_location_destination_address;
		this.line_location_start_time = line_location_start_time;
		this.line_location_end_time = line_location_end_time;
		this.line_operating_fee_idx = line_operating_fee_idx;
		this.line_operating_fee_line_idx = line_operating_fee_line_idx;
		this.line_operating_fee_account_idx = line_operating_fee_account_idx;
		this.line_operating_fee_month = line_operating_fee_month;
		this.line_operating_fee_deposit_status = line_operating_fee_deposit_status;
		this.line_operating_fee_createtime = line_operating_fee_createtime;
		this.line_operating_fee_updatetime = line_operating_fee_updatetime;
		this.line_operation_day_idx = line_operation_day_idx;
		this.line_operation_day_line_idx = line_operation_day_line_idx;
		this.line_operation_day_day_of_week_idx = line_operation_day_day_of_week_idx;
		this.line_passengers_idx = line_passengers_idx;
		this.line_passengers_line_idx = line_passengers_line_idx;
		this.line_passengers_account_idx = line_passengers_account_idx;
		this.line_location_line_location_idx = line_location_line_location_idx;
		this.line_passengers_is_active = line_passengers_is_active;
		this.line_stop_passengers_idx = line_stop_passengers_idx;
		this.line_stop_passengers_line_idx = line_stop_passengers_line_idx;
		this.line_stop_passengers_reason = line_stop_passengers_reason;
		this.line_stop_passengers_createtime = line_stop_passengers_createtime;
		this.line_stop_passengers_updatetime = line_stop_passengers_updatetime;
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_description = notice_description;
		this.notice_createtime = notice_createtime;
		this.notice_updatetime = notice_updatetime;
		this.notice_img_idx = notice_img_idx;
		this.notice_img_notice_idx = notice_img_notice_idx;
		this.notice_img_url = notice_img_url;
		this.question_idx = question_idx;
		this.account_account_idx = account_account_idx;
		this.question_description = question_description;
		this.question_createtime = question_createtime;
		this.question_updatetime = question_updatetime;
		this.question_title = question_title;
		this.question_img = question_img;
		this.question_del = question_del;
		this.question_answer_idx = question_answer_idx;
		this.question_answer_question_idx = question_answer_question_idx;
		this.question_answer_description = question_answer_description;
		this.question_answer_createtime = question_answer_createtime;
		this.question_answer_updatetime = question_answer_updatetime;
		this.question_answer_writer = question_answer_writer;
		this.question_asnwer_del = question_asnwer_del;
		this.account_email = account_email;
		this.driver_maxpass = driver_maxpass;
		this.driver_line_is_active = driver_line_is_active;
		this.account_division = account_division;
		this.notice_del = notice_del;
		this.event_del = event_del;
		this.select_notice_idx = select_notice_idx;
		this.select_event_idx = select_event_idx;
		this.event_s = event_s;
		this.event_e = event_e;
		this.event_description = event_description;
		this.start_time = start_time;
		this.current_people_count = current_people_count;
		this.line_destination_address = line_destination_address;
		this.driver_stop_reason = driver_stop_reason;
		this.hasDriver = hasDriver;
		this.line_operating_fee_date = line_operating_fee_date;
		this.driver_account_name = driver_account_name;
		this.driver_account_id = driver_account_id;
		this.line_operating_fee_depositor_name = line_operating_fee_depositor_name;
		this.line_operating_fee_deposit_amount = line_operating_fee_deposit_amount;
		this.formatted_createtime = formatted_createtime;
	}



	public int getAccount_idx() {
		return account_idx;
	}

	public void setAccount_idx(int account_idx) {
		this.account_idx = account_idx;
	}

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public String getAccount_password() {
		return account_password;
	}

	public void setAccount_password(String account_password) {
		this.account_password = account_password;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getAccount_phone() {
		return account_phone;
	}

	public void setAccount_phone(String account_phone) {
		this.account_phone = account_phone;
	}

	public String getAccount_createtime() {
		return account_createtime;
	}

	public void setAccount_createtime(String account_createtime) {
		this.account_createtime = account_createtime;
	}

	public String getAccount_updatetime() {
		return account_updatetime;
	}

	public void setAccount_updatetime(String account_updatetime) {
		this.account_updatetime = account_updatetime;
	}

	public int getAccount_enable() {
		return account_enable;
	}

	public void setAccount_enable(int account_enable) {
		this.account_enable = account_enable;
	}

	public int getAdmin_idx() {
		return admin_idx;
	}

	public void setAdmin_idx(int admin_idx) {
		this.admin_idx = admin_idx;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public int getAdmin_enable() {
		return admin_enable;
	}

	public void setAdmin_enable(int admin_enable) {
		this.admin_enable = admin_enable;
	}

	public String getAdmin_role() {
		return admin_role;
	}

	public void setAdmin_role(String admin_role) {
		this.admin_role = admin_role;
	}

	public String getAdmin_createtime() {
		return admin_createtime;
	}

	public void setAdmin_createtime(String admin_createtime) {
		this.admin_createtime = admin_createtime;
	}

	public String getAdmin_updatetime() {
		return admin_updatetime;
	}

	public void setAdmin_updatetime(String admin_updatetime) {
		this.admin_updatetime = admin_updatetime;
	}

	public int getDay_of_week_idx() {
		return day_of_week_idx;
	}

	public void setDay_of_week_idx(int day_of_week_idx) {
		this.day_of_week_idx = day_of_week_idx;
	}

	public String getDay_of_week_value() {
		return day_of_week_value;
	}

	public void setDay_of_week_value(String day_of_week_value) {
		this.day_of_week_value = day_of_week_value;
	}

	public int getDiver_line_idx() {
		return diver_line_idx;
	}

	public void setDiver_line_idx(int diver_line_idx) {
		this.diver_line_idx = diver_line_idx;
	}

	public int getDiver_line_driver_idx() {
		return diver_line_driver_idx;
	}

	public void setDiver_line_driver_idx(int diver_line_driver_idx) {
		this.diver_line_driver_idx = diver_line_driver_idx;
	}

	public int getDiver_line_line_idx() {
		return diver_line_line_idx;
	}

	public void setDiver_line_line_idx(int diver_line_line_idx) {
		this.diver_line_line_idx = diver_line_line_idx;
	}

	public int getDiver_line_is_active() {
		return diver_line_is_active;
	}

	public void setDiver_line_is_active(int diver_line_is_active) {
		this.diver_line_is_active = diver_line_is_active;
	}

	public int getDriver_idx() {
		return driver_idx;
	}

	public void setDriver_idx(int driver_idx) {
		this.driver_idx = driver_idx;
	}

	public int getDriver_account_idx() {
		return driver_account_idx;
	}

	public void setDriver_account_idx(int driver_account_idx) {
		this.driver_account_idx = driver_account_idx;
	}

	public String getDriver_cartype() {
		return driver_cartype;
	}

	public void setDriver_cartype(String driver_cartype) {
		this.driver_cartype = driver_cartype;
	}

	public String getDriver_carnum() {
		return driver_carnum;
	}

	public void setDriver_carnum(String driver_carnum) {
		this.driver_carnum = driver_carnum;
	}

	public String getDriver_bank_account_number() {
		return driver_bank_account_number;
	}

	public void setDriver_bank_account_number(String driver_bank_account_number) {
		this.driver_bank_account_number = driver_bank_account_number;
	}

	public String getDriver_bank_name() {
		return driver_bank_name;
	}

	public void setDriver_bank_name(String driver_bank_name) {
		this.driver_bank_name = driver_bank_name;
	}

	public String getDriver_licent_img_url() {
		return driver_licent_img_url;
	}

	public void setDriver_licent_img_url(String driver_licent_img_url) {
		this.driver_licent_img_url = driver_licent_img_url;
	}

	public int getDriver_is_confirm() {
		return driver_is_confirm;
	}

	public void setDriver_is_confirm(int driver_is_confirm) {
		this.driver_is_confirm = driver_is_confirm;
	}

	public int getEvent_idx() {
		return event_idx;
	}

	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getEvent_createtime() {
		return event_createtime;
	}

	public void setEvent_createtime(String event_createtime) {
		this.event_createtime = event_createtime;
	}

	public String getEvent_updatetime() {
		return event_updatetime;
	}

	public void setEvent_updatetime(String event_updatetime) {
		this.event_updatetime = event_updatetime;
	}

	public int getEvent_img_idx() {
		return event_img_idx;
	}

	public void setEvent_img_idx(int event_img_idx) {
		this.event_img_idx = event_img_idx;
	}

	public int getEvent_img_event_idx() {
		return event_img_event_idx;
	}

	public void setEvent_img_event_idx(int event_img_event_idx) {
		this.event_img_event_idx = event_img_event_idx;
	}

	public String getEvent_img_url() {
		return event_img_url;
	}

	public void setEvent_img_url(String event_img_url) {
		this.event_img_url = event_img_url;
	}

	public int getLine_idx() {
		return line_idx;
	}

	public void setLine_idx(int line_idx) {
		this.line_idx = line_idx;
	}

	public int getLine_account_idx() {
		return line_account_idx;
	}

	public void setLine_account_idx(int line_account_idx) {
		this.line_account_idx = line_account_idx;
	}

	public int getLine_capacity() {
		return line_capacity;
	}

	public void setLine_capacity(int line_capacity) {
		this.line_capacity = line_capacity;
	}

	public String getLine_car_type() {
		return line_car_type;
	}

	public void setLine_car_type(String line_car_type) {
		this.line_car_type = line_car_type;
	}

	public String getLine_price() {
		return line_price;
	}

	public void setLine_price(String line_price) {
		this.line_price = line_price;
	}

	public int getLine_location_idx() {
		return line_location_idx;
	}

	public void setLine_location_idx(int line_location_idx) {
		this.line_location_idx = line_location_idx;
	}

	public int getLine_location_line_idx() {
		return line_location_line_idx;
	}

	public void setLine_location_line_idx(int line_location_line_idx) {
		this.line_location_line_idx = line_location_line_idx;
	}

	public double getLine_location_latitude() {
		return line_location_latitude;
	}

	public void setLine_location_latitude(double line_location_latitude) {
		this.line_location_latitude = line_location_latitude;
	}

	public double getLine_location_longitude() {
		return line_location_longitude;
	}

	public void setLine_location_longitude(double line_location_longitude) {
		this.line_location_longitude = line_location_longitude;
	}

	public String getLine_location_address() {
		return line_location_address;
	}

	public void setLine_location_address(String line_location_address) {
		this.line_location_address = line_location_address;
	}

	public String getLine_location_destination_address() {
		return line_location_destination_address;
	}

	public void setLine_location_destination_address(String line_location_destination_address) {
		this.line_location_destination_address = line_location_destination_address;
	}

	public String getLine_location_start_time() {
		return line_location_start_time;
	}

	public void setLine_location_start_time(String line_location_start_time) {
		this.line_location_start_time = line_location_start_time;
	}

	public String getLine_location_end_time() {
		return line_location_end_time;
	}

	public void setLine_location_end_time(String line_location_end_time) {
		this.line_location_end_time = line_location_end_time;
	}

	public int getLine_operating_fee_idx() {
		return line_operating_fee_idx;
	}

	public void setLine_operating_fee_idx(int line_operating_fee_idx) {
		this.line_operating_fee_idx = line_operating_fee_idx;
	}

	public int getLine_operating_fee_line_idx() {
		return line_operating_fee_line_idx;
	}

	public void setLine_operating_fee_line_idx(int line_operating_fee_line_idx) {
		this.line_operating_fee_line_idx = line_operating_fee_line_idx;
	}

	public int getLine_operating_fee_account_idx() {
		return line_operating_fee_account_idx;
	}

	public void setLine_operating_fee_account_idx(int line_operating_fee_account_idx) {
		this.line_operating_fee_account_idx = line_operating_fee_account_idx;
	}

	public int getLine_operating_fee_month() {
		return line_operating_fee_month;
	}

	public void setLine_operating_fee_month(int line_operating_fee_month) {
		this.line_operating_fee_month = line_operating_fee_month;
	}

	public int getLine_operating_fee_deposit_status() {
		return line_operating_fee_deposit_status;
	}

	public void setLine_operating_fee_deposit_status(int line_operating_fee_deposit_status) {
		this.line_operating_fee_deposit_status = line_operating_fee_deposit_status;
	}

	public String getLine_operating_fee_createtime() {
		return line_operating_fee_createtime;
	}

	public void setLine_operating_fee_createtime(String line_operating_fee_createtime) {
		this.line_operating_fee_createtime = line_operating_fee_createtime;
	}

	public String getLine_operating_fee_updatetime() {
		return line_operating_fee_updatetime;
	}

	public void setLine_operating_fee_updatetime(String line_operating_fee_updatetime) {
		this.line_operating_fee_updatetime = line_operating_fee_updatetime;
	}

	public int getLine_operation_day_idx() {
		return line_operation_day_idx;
	}

	public void setLine_operation_day_idx(int line_operation_day_idx) {
		this.line_operation_day_idx = line_operation_day_idx;
	}

	public int getLine_operation_day_line_idx() {
		return line_operation_day_line_idx;
	}

	public void setLine_operation_day_line_idx(int line_operation_day_line_idx) {
		this.line_operation_day_line_idx = line_operation_day_line_idx;
	}

	public int getLine_operation_day_day_of_week_idx() {
		return line_operation_day_day_of_week_idx;
	}

	public void setLine_operation_day_day_of_week_idx(int line_operation_day_day_of_week_idx) {
		this.line_operation_day_day_of_week_idx = line_operation_day_day_of_week_idx;
	}

	public int getLine_passengers_idx() {
		return line_passengers_idx;
	}

	public void setLine_passengers_idx(int line_passengers_idx) {
		this.line_passengers_idx = line_passengers_idx;
	}

	public int getLine_passengers_line_idx() {
		return line_passengers_line_idx;
	}

	public void setLine_passengers_line_idx(int line_passengers_line_idx) {
		this.line_passengers_line_idx = line_passengers_line_idx;
	}

	public int getLine_passengers_account_idx() {
		return line_passengers_account_idx;
	}

	public void setLine_passengers_account_idx(int line_passengers_account_idx) {
		this.line_passengers_account_idx = line_passengers_account_idx;
	}

	public int getLine_location_line_location_idx() {
		return line_location_line_location_idx;
	}

	public void setLine_location_line_location_idx(int line_location_line_location_idx) {
		this.line_location_line_location_idx = line_location_line_location_idx;
	}

	public int getLine_passengers_is_active() {
		return line_passengers_is_active;
	}

	public void setLine_passengers_is_active(int line_passengers_is_active) {
		this.line_passengers_is_active = line_passengers_is_active;
	}

	public int getLine_stop_passengers_idx() {
		return line_stop_passengers_idx;
	}

	public void setLine_stop_passengers_idx(int line_stop_passengers_idx) {
		this.line_stop_passengers_idx = line_stop_passengers_idx;
	}

	public int getLine_stop_passengers_line_idx() {
		return line_stop_passengers_line_idx;
	}

	public void setLine_stop_passengers_line_idx(int line_stop_passengers_line_idx) {
		this.line_stop_passengers_line_idx = line_stop_passengers_line_idx;
	}

	public String getLine_stop_passengers_reason() {
		return line_stop_passengers_reason;
	}

	public void setLine_stop_passengers_reason(String line_stop_passengers_reason) {
		this.line_stop_passengers_reason = line_stop_passengers_reason;
	}

	public String getLine_stop_passengers_createtime() {
		return line_stop_passengers_createtime;
	}

	public void setLine_stop_passengers_createtime(String line_stop_passengers_createtime) {
		this.line_stop_passengers_createtime = line_stop_passengers_createtime;
	}

	public String getLine_stop_passengers_updatetime() {
		return line_stop_passengers_updatetime;
	}

	public void setLine_stop_passengers_updatetime(String line_stop_passengers_updatetime) {
		this.line_stop_passengers_updatetime = line_stop_passengers_updatetime;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_description() {
		return notice_description;
	}

	public void setNotice_description(String notice_description) {
		this.notice_description = notice_description;
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

	public int getNotice_img_idx() {
		return notice_img_idx;
	}

	public void setNotice_img_idx(int notice_img_idx) {
		this.notice_img_idx = notice_img_idx;
	}

	public String getNotice_img_notice_idx() {
		return notice_img_notice_idx;
	}

	public void setNotice_img_notice_idx(String notice_img_notice_idx) {
		this.notice_img_notice_idx = notice_img_notice_idx;
	}

	public String getNotice_img_url() {
		return notice_img_url;
	}

	public void setNotice_img_url(String notice_img_url) {
		this.notice_img_url = notice_img_url;
	}

	public int getQuestion_idx() {
		return question_idx;
	}

	public void setQuestion_idx(int question_idx) {
		this.question_idx = question_idx;
	}

	public String getAccount_account_idx() {
		return account_account_idx;
	}

	public void setAccount_account_idx(String account_account_idx) {
		this.account_account_idx = account_account_idx;
	}

	public String getQuestion_description() {
		return question_description;
	}

	public void setQuestion_description(String question_description) {
		this.question_description = question_description;
	}

	public String getQuestion_createtime() {
		return question_createtime;
	}

	public void setQuestion_createtime(String question_createtime) {
		this.question_createtime = question_createtime;
	}

	public String getQuestion_updatetime() {
		return question_updatetime;
	}

	public void setQuestion_updatetime(String question_updatetime) {
		this.question_updatetime = question_updatetime;
	}

	public String getQuestion_title() {
		return question_title;
	}

	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}

	public String getQuestion_img() {
		return question_img;
	}

	public void setQuestion_img(String question_img) {
		this.question_img = question_img;
	}

	public int getQuestion_del() {
		return question_del;
	}

	public void setQuestion_del(int question_del) {
		this.question_del = question_del;
	}

	public int getQuestion_answer_idx() {
		return question_answer_idx;
	}

	public void setQuestion_answer_idx(int question_answer_idx) {
		this.question_answer_idx = question_answer_idx;
	}

	public int getQuestion_answer_question_idx() {
		return question_answer_question_idx;
	}

	public void setQuestion_answer_question_idx(int question_answer_question_idx) {
		this.question_answer_question_idx = question_answer_question_idx;
	}

	public String getQuestion_answer_description() {
		return question_answer_description;
	}

	public void setQuestion_answer_description(String question_answer_description) {
		this.question_answer_description = question_answer_description;
	}

	public String getQuestion_answer_createtime() {
		return question_answer_createtime;
	}

	public void setQuestion_answer_createtime(String question_answer_createtime) {
		this.question_answer_createtime = question_answer_createtime;
	}

	public String getQuestion_answer_updatetime() {
		return question_answer_updatetime;
	}

	public void setQuestion_answer_updatetime(String question_answer_updatetime) {
		this.question_answer_updatetime = question_answer_updatetime;
	}

	public String getQuestion_answer_writer() {
		return question_answer_writer;
	}

	public void setQuestion_answer_writer(String question_answer_writer) {
		this.question_answer_writer = question_answer_writer;
	}

	public int getQuestion_asnwer_del() {
		return question_asnwer_del;
	}

	public void setQuestion_asnwer_del(int question_asnwer_del) {
		this.question_asnwer_del = question_asnwer_del;
	}

	public String getAccount_email() {
		return account_email;
	}

	public void setAccount_email(String account_email) {
		this.account_email = account_email;
	}

	public int getDriver_maxpass() {
		return driver_maxpass;
	}

	public void setDriver_maxpass(int driver_maxpass) {
		this.driver_maxpass = driver_maxpass;
	}

	public int getDriver_line_is_active() {
		return driver_line_is_active;
	}

	public void setDriver_line_is_active(int driver_line_is_active) {
		this.driver_line_is_active = driver_line_is_active;
	}

	public int getAccount_division() {
		return account_division;
	}

	public void setAccount_division(int account_division) {
		this.account_division = account_division;
	}

	public int getNotice_del() {
		return notice_del;
	}

	public void setNotice_del(int notice_del) {
		this.notice_del = notice_del;
	}

	public int getEvent_del() {
		return event_del;
	}

	public void setEvent_del(int event_del) {
		this.event_del = event_del;
	}

	public int getSelect_notice_idx() {
		return select_notice_idx;
	}

	public void setSelect_notice_idx(int select_notice_idx) {
		this.select_notice_idx = select_notice_idx;
	}

	public int getSelect_event_idx() {
		return select_event_idx;
	}

	public void setSelect_event_idx(int select_event_idx) {
		this.select_event_idx = select_event_idx;
	}

	public String getEvent_s() {
		return event_s;
	}

	public void setEvent_s(String event_s) {
		this.event_s = event_s;
	}

	public String getEvent_e() {
		return event_e;
	}

	public void setEvent_e(String event_e) {
		this.event_e = event_e;
	}

	public String getEvent_description() {
		return event_description;
	}

	public void setEvent_description(String event_description) {
		this.event_description = event_description;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public int getCurrent_people_count() {
		return current_people_count;
	}

	public void setCurrent_people_count(int current_people_count) {
		this.current_people_count = current_people_count;
	}

	public String getLine_destination_address() {
		return line_destination_address;
	}

	public void setLine_destination_address(String line_destination_address) {
		this.line_destination_address = line_destination_address;
	}

	public String getDriver_stop_reason() {
		return driver_stop_reason;
	}

	public void setDriver_stop_reason(String driver_stop_reason) {
		this.driver_stop_reason = driver_stop_reason;
	}

	public int getHasDriver() {
		return hasDriver;
	}

	public void setHasDriver(int hasDriver) {
		this.hasDriver = hasDriver;
	}

	public String getLine_operating_fee_date() {
		return line_operating_fee_date;
	}

	public void setLine_operating_fee_date(String line_operating_fee_date) {
		this.line_operating_fee_date = line_operating_fee_date;
	}

	public String getDriver_account_name() {
		return driver_account_name;
	}

	public void setDriver_account_name(String driver_account_name) {
		this.driver_account_name = driver_account_name;
	}

	public String getDriver_account_id() {
		return driver_account_id;
	}

	public void setDriver_account_id(String driver_account_id) {
		this.driver_account_id = driver_account_id;
	}

	public String getLine_operating_fee_depositor_name() {
		return line_operating_fee_depositor_name;
	}

	public void setLine_operating_fee_depositor_name(String line_operating_fee_depositor_name) {
		this.line_operating_fee_depositor_name = line_operating_fee_depositor_name;
	}

	public String getLine_operating_fee_deposit_amount() {
		return line_operating_fee_deposit_amount;
	}

	public void setLine_operating_fee_deposit_amount(String line_operating_fee_deposit_amount) {
		this.line_operating_fee_deposit_amount = line_operating_fee_deposit_amount;
	}

	public String getFormatted_createtime() {
		return formatted_createtime;
	}

	public void setFormatted_createtime(String formatted_createtime) {
		this.formatted_createtime = formatted_createtime;
	}

	
}
