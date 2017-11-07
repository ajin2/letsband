package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import handler.CommandHandler;
  
public class BandContentModifyFormHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num;
		String pageNum;
		BoardDBBean boardDao = BoardDBBean.getInstance();
		
		num = Integer.parseInt(request.getParameter("num"));
		pageNum = request.getParameter("pageNum");
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		BoardDataBean boardDto = boardDao.getArticle(num);
		request.setAttribute("boardDto", boardDto);
		
		return "/board/contentModifyForm.jsp";
	}
}
