package member;

import java.sql.Date;
import java.sql.Timestamp;

public class LogonDataBean {
	private String m_id;
	private String passwd;
	private String name;
	private String email;
	private Timestamp reg_date;
	private String postcode;
	private String address;
	private String detail_add;
	
	public String getM_id() {
		return m_id;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public String getPostcode() {
		return postcode;
	}
	public String getAddress() {
		return address;
	}
	public String getDetail_add() {
		return detail_add;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setDetail_add(String detail_add) {
		this.detail_add = detail_add;
	}
}
