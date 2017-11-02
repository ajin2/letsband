package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import member.EmailConfirm;

public class LogonEmailCheckHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String email=null;
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		if(!email1.equals("")){
			if(email2.equals("0")){
				// 직접입력
				email=email1;
			}else{
				email=email1+"@"+email2;
			}
		}
		
		request.setAttribute("email", email);
		
		// 위에서 작성한 java파일 객체 생성
		String emailvalue = request.getParameter("emailvalue");
		EmailConfirm emailconfirm = new EmailConfirm();
		String authNum = emailconfirm.connectEmail(email);
		
		request.setAttribute("emailvalue", emailvalue);
		request.setAttribute("emailconfirm", emailconfirm);
		request.setAttribute("authNum", authNum);
		
		return "/member/emailcheck.jsp";
	}

}
