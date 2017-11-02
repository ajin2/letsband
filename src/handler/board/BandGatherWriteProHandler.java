package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDataBean;
import handler.CommandHandler;

public class BandGatherWriteProHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		BoardDataBean boardDto = new BoardDataBean();
		//boardDto.setWriter(request.getParameter("writer"));
		
		
		return "/board/gatherWritePro.jsp";
	}
}
