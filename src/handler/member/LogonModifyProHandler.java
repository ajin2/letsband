package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.LogonDBBean;
import member.LogonDataBean;

public class LogonModifyProHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		LogonDataBean memberDto = new LogonDataBean();
		memberDto.setPasswd(request.getParameter("passwd"));
		
    	String id = (String) request.getSession().getAttribute("memId");
		memberDto.setM_id(id);
    	
    	// email
		String email = null;
    	String email1 = request.getParameter("email1");
    	String email2 = request.getParameter("email2");
    	
    	if(!email1.equals("") && !email2.equals("")){
    		email = email1 + "@" + email2;
    	}
    	memberDto.setEmail(email);
    	
    	memberDto.setPostcode(request.getParameter("postcode"));
		memberDto.setAddress(request.getParameter("address"));
		memberDto.setDetail_add(request.getParameter("detail_add"));
    	
    	LogonDBBean memberDao = LogonDBBean.getInstance();
    	int result = memberDao.updateMember(memberDto);
    	
    	request.setAttribute("result", result);
		
		return "/member/modifyPro.jsp";
	}

}
