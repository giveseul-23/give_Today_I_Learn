package com.bc.model.vo;

public class PListVO {
	private int p_no;
	private String sale_id,	purchase_id, picture01, picture02;
	private String price, p_title, p_contents, p_status;
	private String p_category, location;
	private String common_name;
	
	public PListVO() { }

	public PListVO(int p_no, String sale_id, String purchase_id, String picture01, String picture02, String price,
			String p_title, String p_contents, String p_status, String p_category, String location, String common_name) {
		super();
		this.p_no = p_no;
		this.sale_id = sale_id;
		this.purchase_id = purchase_id;
		this.picture01 = picture01;
		this.picture02 = picture02;
		this.price = price;
		this.p_title = p_title;
		this.p_contents = p_contents;
		this.p_status = p_status;
		this.p_category = p_category;
		this.location = location;
		this.common_name = common_name;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getSale_id() {
		return sale_id;
	}

	public void setSale_id(String sale_id) {
		this.sale_id = sale_id;
	}

	public String getPurchase_id() {
		return purchase_id;
	}

	public void setPurchase_id(String purchase_id) {
		this.purchase_id = purchase_id;
	}

	public String getPicture01() {
		return picture01;
	}

	public void setPicture01(String picture01) {
		this.picture01 = picture01;
	}

	public String getPicture02() {
		return picture02;
	}

	public void setPicture02(String picture02) {
		this.picture02 = picture02;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getP_contents() {
		return p_contents;
	}

	public void setP_contents(String p_contents) {
		this.p_contents = p_contents;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCommon_name() {
		return common_name;
	}

	public void setCommon_name(String common_name) {
		this.common_name = common_name;
	}

	@Override
	public String toString() {
		return "PListVO [p_no=" + p_no + ", sale_id=" + sale_id + ", purchase_id=" + purchase_id + ", picture01="
				+ picture01 + ", picture02=" + picture02 + ", price=" + price + ", p_title=" + p_title + ", p_contents="
				+ p_contents + ", p_status=" + p_status + ", p_category=" + p_category + ", location=" + location
				+ ", common_name=" + common_name + "]";
	}

	
	
	
}
