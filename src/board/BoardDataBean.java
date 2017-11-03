package board;

import java.sql.Timestamp;

public class BoardDataBean {
	private String m_id;
	private String a_id;
	private int num;
	private int value;
	private String subject;
	private Timestamp reg_date;
	private int readcount;
	private String content;
	private String location;
	
	public String getM_id() {
		return m_id;
	}
	public String getA_id() {
		return a_id;
	}
	public int getNum() {
		return num;
	}
	public int getValue() {
		return value;
	}
	public String getSubject() {
		return subject;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public String getContent() {
		return content;
	}
	public String getLocation() {
		return location;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setLocation(String location) {
		this.location = location;
	}
}
