package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.LogonDBBean;

public class LogonFindPasswdViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		LogonDBBean memberDao = LogonDBBean.getInstance();
    	int result = memberDao.passwdcheck(id, name, email);
    	
    	
    	request.setAttribute("id", id);
    	request.setAttribute("name", name);
    	request.setAttribute("email", email);
    	request.setAttribute("result", result);
		
		return "/member/findPasswdView.jsp";
	}

}
