package com.semi.member.dto;

public class memberdto {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String member_gender;
	private String member_birth;
	private String member_level;
	private String member_enabled;
	private String member_style;
	
	public memberdto() {
		
	}

	public memberdto(String member_id, String member_pw, String member_name, String member_phone, String member_email,
			String member_gender, String member_birth, String member_style) {
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_gender = member_gender;
		this.member_birth = member_birth;
		this.member_style = member_style;
	}


	public memberdto(String member_id, String member_pw, String member_name, String member_phone, String member_email,
			String member_gender, String member_birth, String member_level, String member_enabled,
			String member_style) {
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_gender = member_gender;
		this.member_birth = member_birth;
		this.member_level = member_level;
		this.member_enabled = member_enabled;
		this.member_style = member_style;
	}


	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_level() {
		return member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}
	public String getMember_enabled() {
		return member_enabled;
	}
	public void setMember_enabled(String member_enabled) {
		this.member_enabled = member_enabled;
	}
	public String getMember_style() {
		return member_style;
	}
	public void setMember_style(String member_style) {
		this.member_style = member_style;
	}
}
