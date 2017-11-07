package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;

public class BandHeaderHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String m_id = request.getParameter("m_id");
		request.setAttribute("m_id", m_id);
		
		String a_id = request.getParameter("a_id");
		request.setAttribute("a_id", a_id);
		
		System.out.println(m_id + "/////" + a_id);
		
		return "/board/header.jsp";
	}

}
