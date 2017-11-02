package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;

public class LogonLogoutHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.getSession().removeAttribute("memId");
		request.getSession().removeAttribute("adId");
		return "/board/main.jsp";
	}

}
