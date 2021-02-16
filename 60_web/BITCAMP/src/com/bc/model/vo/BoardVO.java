package com.bc.model.vo;

public class BoardVO {
	private int b_no;
	private String id, b_category;
	private String b_title,	b_contents,	b_password;
	private String b_status, b_regdate, b_answer, answer_date;
	
	public BoardVO() { }
	
	public BoardVO(int b_no, String id, String b_category, String b_title, String b_contents, String b_password,
			String b_status, String b_regdate, String b_answer, String answer_date) {
		this.b_no = b_no;
		this.id = id;
		this.b_category = b_category;
		this.b_title = b_title;
		this.b_contents = b_contents;
		this.b_password = b_password;
		this.b_status = b_status;
		this.b_regdate = b_regdate;
		this.b_answer = b_answer;
		this.answer_date = answer_date;
	}



	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_contents() {
		return b_contents;
	}

	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}

	public String getB_password() {
		return b_password;
	}

	public void setB_password(String b_password) {
		this.b_password = b_password;
	}

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}

	public String getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}

	public String getB_answer() {
		return b_answer;
	}

	public void setB_answer(String b_answer) {
		this.b_answer = b_answer;
	}

	public String getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}

	@Override
	public String toString() {
		return "BoardVO [b_no=" + b_no + ", id=" + id + ", b_category=" + b_category + ", b_title=" + b_title
				+ ", b_contents=" + b_contents + ", b_password=" + b_password + ", b_status=" + b_status
				+ ", b_regdate=" + b_regdate + ", b_answer=" + b_answer + ", answer_date=" + answer_date + "]";
	}
	
	
}
