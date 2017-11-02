package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

import handler.CommandHandler;
import member.LogonDBBean;

public class LogonFindPasswdProHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		LogonDBBean memberDao = LogonDBBean.getInstance();
    	int result = memberDao.updatePasswd(id, passwd);
    	request.setAttribute("result", result);
    	
		return "/member/findPasswdPro.jsp";
	}
}
