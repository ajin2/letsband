package board;

import java.sql.Timestamp;

public class RreplyDataBean {
	private int re_num;
	private String m_id;
	private String a_id;
	private int rr_num;
	private Timestamp reg_date;
	private String rreply;
	
	public int getRe_num() {
		return re_num;
	}
	public String getM_id() {
		return m_id;
	}
	public String getA_id() {
		return a_id;
	}
	public int getRr_num() {
		return rr_num;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public String getRreply() {
		return rreply;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public void setRr_num(int rr_num) {
		this.rr_num = rr_num;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public void setRreply(String rreply) {
		this.rreply = rreply;
	}
}
