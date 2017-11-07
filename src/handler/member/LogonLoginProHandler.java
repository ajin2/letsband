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
    	if(result == 1) {
    		String m_id = id;
    		request.setAttribute("m_id", m_id);
    		request.setAttribute("id", id);
    	}
    	
    	AdminDBBean adminDao = AdminDBBean.getInstance();
    	int aresult = adminDao.check(id, passwd);
    	if(aresult == 1) {
    		String a_id = id;
    		request.setAttribute("a_id", a_id);
    		request.setAttribute("id", id);
    	}
    	
    	request.setAttribute("aresult", aresult);
    	request.setAttribute("result", result);
		
		return "/member/loginPro.jsp";
	}

}
