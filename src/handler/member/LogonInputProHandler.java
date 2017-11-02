package handler.member;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.LogonDBBean;
import member.LogonDataBean;

public class LogonInputProHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		

		//<jsp:useBean id="memberDto" class="member.LogonDataBean"/>
    	//<jsp:setProperty name="memberDto" property="*"/>
    	//<!-- id passwd name postcode address detail_add -->
		
		LogonDataBean memberDto = new LogonDataBean();
		memberDto.setM_id(request.getParameter("id"));
		memberDto.setPasswd(request.getParameter("passwd"));
		memberDto.setName(request.getParameter("name"));
    	
    	// email
		String email = null;
    	String email1 = request.getParameter("email1");
    	String email2 = request.getParameter("email2");
    	
    	if(!email1.equals("")){
    		if(email2.equals("0")){
    			email = email1;
    		} else{
    			email = email1 + "@" + email2;
    		}
    	}
    	memberDto.setEmail(email);
    	
    	// reg_date
    	memberDto.setReg_date(new Timestamp(System.currentTimeMillis()));
    	
    	memberDto.setPostcode(request.getParameter("postcode"));
		memberDto.setAddress(request.getParameter("address"));
		memberDto.setDetail_add(request.getParameter("detail_add"));
    	
    	LogonDBBean memberDao = LogonDBBean.getInstance();
    	int result = memberDao.insertMember(memberDto);
    	
    	request.setAttribute("result", result);
		
		return "/member/inputPro.jsp";
	}

}
