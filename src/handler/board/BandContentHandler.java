package handler.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;
import board.ReplyDataBean;
import handler.CommandHandler;
  
public class BandContentHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDBBean boardDao = BoardDBBean.getInstance();
		BoardDataBean boardDto = boardDao.getArticle(num);
		
		// 우리는 IP를 안받는다
		//if(!request.getRemoteAddr().equals(boardDto.getIp()))
			boardDao.addCount(num);
			
		request.setAttribute("num", num);
		request.setAttribute("boardDto", boardDto);
		request.setAttribute("pageNum", pageNum);
		
		
		///////////////////////////////////////////////////////////////////
		
		BoardDBBean replyDao = BoardDBBean.getInstance();
		
    	int result = replyDao.getReplyOX(num);	// 댓글 존재 여부
    	request.setAttribute("result", result);
    	
    	ArrayList<ReplyDataBean> replys = replyDao.getReply(num);
    	request.setAttribute("replys", replys);
    	
    	System.out.println(result);
			
		return "/board/content.jsp";
	}
}

