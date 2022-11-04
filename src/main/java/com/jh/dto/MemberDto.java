package com.jh.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//json->객체 변환시 객체의 필드에 선언되지 않은내용은 무시해주는 설정
@JsonIgnoreProperties(ignoreUnknown = true)
public class MemberDto {
	private int memberId;
	private String email;
	private String pw;
	private String name;
	private String birthDate;
	private String profilePic;
	private String signUpTime;
	private String lightMode;
	
	public MemberDto() {}
	public MemberDto(int memberId, String email, String pw, String name, String birthDate, String profilePic,
			String signUpTime, String lightMode) {
		super();
		this.memberId = memberId;
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.birthDate = birthDate;
		this.profilePic = profilePic;
		this.signUpTime = signUpTime;
		this.lightMode = lightMode;
	}

	
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public String getSignUpTime() {
		return signUpTime;
	}
	public void setSignUpTime(String signUpTime) {
		this.signUpTime = signUpTime;
	}
	public String getLightMode() {
		return lightMode;
	}
	public void setLightMode(String lightMode) {
		this.lightMode = lightMode;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	
}
