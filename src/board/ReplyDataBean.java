package board;

import java.sql.Date;

public class ReplyDataBean {
	private int num;
	private String m_id;
	private String a_id;
	private int re_num;
	private Date reg_date;
	private String reply;
	
	public int getNum() {
		return num;
	}
	public String getM_id() {
		return m_id;
	}
	public String getA_id() {
		return a_id;
	}
	public int getRe_num() {
		return re_num;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public String getReply() {
		return reply;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
}
