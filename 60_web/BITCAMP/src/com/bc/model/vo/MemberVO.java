package com.bc.model.vo;

public class MemberVO {
	private String id, password, name, birth, phonnum;
	private String location, email, joindate, profile_img;
	
	public MemberVO() { }

	public MemberVO(String id, String password, String name, String birth, String phonnum, String location,
			String email, String joindate, String profile_img) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.phonnum = phonnum;
		this.location = location;
		this.email = email;
		this.joindate = joindate;
		this.profile_img = profile_img;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhonnum() {
		return phonnum;
	}

	public void setPhonnum(String phonnum) {
		this.phonnum = phonnum;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	
	
}
