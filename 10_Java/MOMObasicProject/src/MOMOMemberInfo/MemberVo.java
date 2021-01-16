package MOMOMemberInfo;

import java.util.ArrayList;

public class MemberVo {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String grade;
	
	public MemberVo() {
		
	}
	
	public MemberVo(String id, String pw, String name, String phone, String email, String grade) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.grade = grade;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getGrade() {
		return grade;
	}
	
	
	
	
}
