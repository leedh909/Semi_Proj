package jsp.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.board.comment.model.CommentBean;
import jsp.board.comment.model.CommentDAO;
import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class BoardDetailAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// 파라미터로 넘어온 글번호를 가져온다.
		String num = request.getParameter("num");
		int boardNum = Integer.parseInt(num);
		
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardBean board = dao.getDetail(boardNum);
		boolean result = dao.updateCount(boardNum);
		
		// 게시글 번호를 이용하여 해당 글에 있는 댓글 목록을 가져온다.
		CommentDAO commentDAO = CommentDAO.getInstance();
		ArrayList<CommentBean> commentList = commentDAO.getCommentList(boardNum);
		
		// 댓글이 1개라도 있다면 request에 commentList를 세팅한다.
		if(commentList.size() > 0)	request.setAttribute("commentList", commentList);
		
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
			
		if(result){
			forward.setRedirect(false); // 단순한 조회이므로
			forward.setNextPath("BoardDetailForm.bo");
		}
		
		return forward;
	}
}
