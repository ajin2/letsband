package handler.board;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.ReplyDataBean;
import handler.CommandHandler;
import member.LogonDBBean;
import member.LogonDataBean;

public class ReplyInsertHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		BoardDBBean replyDao = BoardDBBean.getInstance();
		int re_num = replyDao.getRe_Num() + 1;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		ReplyDataBean replyDto = new ReplyDataBean();
		
		String m_id = request.getParameter("m_id");
		String a_id = request.getParameter("a_id");
		
		if(m_id == null)	m_id = "";
		if(a_id == null)	a_id = "";
		
		String reply = request.getParameter("reply");
		
		replyDto.setM_id(m_id);
		replyDto.setA_id(a_id);
		replyDto.setNum(num);
		replyDto.setRe_num(re_num);
		replyDto.setReg_date(new Timestamp(System.currentTimeMillis()));
		replyDto.setReply(reply);
		
		int result = replyDao.insertReply(replyDto);		// 댓글 등록
    	request.setAttribute("result", result);
    	
    	System.out.println(m_id + "/" + a_id + "/" + num + "/" + re_num + "/" + reply);
		
		return "/board/reply.jsp";
	}

}
