package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;

public class BandContentModifyProHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDataBean boardDto = new BoardDataBean();
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setContent(request.getParameter("content"));
		boardDto.setLocation(request.getParameter("location"));
		boardDto.setNum(num);
		
		String pageNum = request.getParameter("pageNum");
		BoardDBBean boardDao = BoardDBBean.getInstance();
		int result = boardDao.updateArticle(boardDto);
		request.setAttribute("num", num);
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "/board/contentModifyPro.jsp";
	}
}
