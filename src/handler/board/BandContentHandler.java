package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;

public class BandContentHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDBBean boardDao = BoardDBBean.getInstance();
		BoardDataBean boardDto = boardDao.getArticle(num);
		
		boardDao.addCount(num);
		
		request.setAttribute("boardDto", boardDto);
		request.setAttribute("pageNum", pageNum);
			
		return "/board/content.jsp";
	}
}
