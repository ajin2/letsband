package handler.board;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;

public class BandGatherWriteProHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		BoardDataBean boardDto = new BoardDataBean();
		boardDto.setM_id(request.getParameter("m_id"));
		boardDto.setA_id(request.getParameter("a_id"));
		boardDto.setNum(Integer.parseInt(request.getParameter("num")));
		boardDto.setValue(Integer.parseInt(request.getParameter("value")));
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setReg_date(new Timestamp(System.currentTimeMillis()));
		boardDto.setReadcount(Integer.parseInt(request.getParameter("readcount")));
		boardDto.setLocation(request.getParameter("location"));
		
		BoardDBBean boardDao = BoardDBBean.getInstance();
		int result = boardDao.insertArticle(boardDto);
		
		request.setAttribute("result", result);
		
		return "/board/gatherWritePro.jsp";
	}
}
