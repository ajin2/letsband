package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;

public class BandShareProHandler implements CommandHandler{
 
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/board/sharePro.jsp";
	}

}
