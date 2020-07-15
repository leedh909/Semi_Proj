package jsp.board.comment.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.board.comment.model.CommentBean;
import jsp.board.comment.model.CommentDAO;
import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class CommentReplyAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// 파라미터를 가져온다.
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		int comment_board = Integer.parseInt(request.getParameter("comment_board"));
		String comment_id = request.getParameter("comment_id");
		String comment_content = request.getParameter("comment_content");

		CommentDAO dao = CommentDAO.getInstance();
		
		CommentBean comment = new CommentBean();	
		comment.setComment_num(dao.getSeq());	// 시퀀스를 가져와 세팅한다
		comment.setComment_board(comment_board);
		comment.setComment_id(comment_id);
		comment.setComment_content(comment_content);
		comment.setComment_parent(comment_num);  // 부모댓글의 글번호를 세팅
		
		boolean result = dao.insertComment(comment);
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		// 정상적으로 댓글을 저장했을경우 1을 전달한다.
		if(result) out.println("1");
		else out.println("0");
		
		out.close();
		
		return null;
	}
}
