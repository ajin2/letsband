package handler.member;

import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.LogonDBBean;

public class LogonMemberMgmtHandler implements CommandHandler{
 
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/member/membermgmt.jsp";
	}

}
