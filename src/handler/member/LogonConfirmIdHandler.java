package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.LogonDBBean;
 
public class LogonConfirmIdHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		
		LogonDBBean memberDao = new LogonDBBean();
		int result = memberDao.check(id);
		
		request.setAttribute("result", result);
    	request.setAttribute("id", id);
		 
		return "/member/confirmId.jsp";
	}

}
