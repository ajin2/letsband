package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.LogonDBBean;
import member.LogonDataBean;

public class LogonModifyViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = (String) request.getSession().getAttribute("memId");
		String passwd = request.getParameter("passwd");
		
		LogonDBBean memberDao = LogonDBBean.getInstance();
		int result = memberDao.check(id,passwd);
		request.setAttribute("id", id);
		request.setAttribute("passwd", passwd);
		request.setAttribute("result", result);
		
		if(result == 1) {
			LogonDataBean memberDto = memberDao.getMember(id);
			request.setAttribute("memberDto", memberDto);
			
			String email = memberDto.getEmail();
			String e[] = email.split("@");
			String viewemail1 = e[0];
			String viewemail2 = e[1];
			
			request.setAttribute("viewemail1", viewemail1);
			request.setAttribute("viewemail2", viewemail2);
		}
		
		return "/member/modifyView.jsp";
	}

}
