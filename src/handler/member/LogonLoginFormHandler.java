package handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
 
public class LogonLoginFormHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/member/loginForm.jsp";
		// form들은 view페이지만 잡아주면 됨.
	}
}
