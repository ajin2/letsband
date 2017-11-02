package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.LogonDBBean;
import member.LogonDataBean;

public class LogonFindIdProHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
    	String email = request.getParameter("email");
    	
    	LogonDBBean memberDao = LogonDBBean.getInstance();
    	int result = memberDao.idcheck(name, email);
    	
    	request.setAttribute("name", name);
    	request.setAttribute("email", email);
    	request.setAttribute("result", result);
    	
    	if(result == 1) {
    		LogonDataBean memberDto = memberDao.idgetMember(name, email);
			request.setAttribute("memberDto", memberDto);
    	}
    	
		return "/member/findIdPro.jsp";
	}

}
