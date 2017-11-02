package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.LogonDBBean;

public class LogonMemberMgmtProHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		System.out.println(id);
		
		LogonDBBean memberDao = LogonDBBean.getInstance();
		int result = memberDao.deleteMember(id);
    	request.setAttribute("result", result);
		
		return "/member/membermgmtPro.jsp";
	}

}
