package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import handler.CommandHandler;

public class BandContentDeleteProHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDBBean boardDao = BoardDBBean.getInstance();
		
		int result = boardDao.deleteArticle(num);
		request.setAttribute("result", result);
		
		return "/board/contentDeletePro.jsp";
	}
}
