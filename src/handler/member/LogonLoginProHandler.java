package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.AdminDBBean;
import member.LogonDBBean;

public class LogonLoginProHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
    	String passwd = request.getParameter("passwd");
    	
    	LogonDBBean memberDao = LogonDBBean.getInstance();
    	int result = memberDao.check(id, passwd);
    	
    	AdminDBBean adminDao = AdminDBBean.getInstance();
    	int aresult = adminDao.check(id, passwd);
    	
    	request.setAttribute("aresult", aresult);
    	request.setAttribute("result", result);
    	request.setAttribute("id", id);
		
		return "/member/loginPro.jsp";
	}

}
