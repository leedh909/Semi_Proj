package jsp.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class BoardReplyAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("euc-kr");
		ActionForward forward = new ActionForward();
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardBean borderData = new BoardBean();
		
		// 답글 작성 후 원래 페이지로 돌아가기 위해 페이지 번호가 필요하다.
		String pageNum = request.getParameter("page");
		
		// 파리미터 값을 가져온다.
		int num = Integer.parseInt(request.getParameter("board_num"));
		String id = request.getParameter("board_id");
		String subject = request.getParameter("board_subject");
		String content = request.getParameter("board_content");
		int ref = Integer.parseInt(request.getParameter("board_re_ref"));

		// 답글 저장
		borderData.setBoard_num(dao.getSeq()); // 답글의 글번호는 시퀀스값 가져와 세팅
		borderData.setBoard_id(id);
		borderData.setBoard_subject(subject);
		borderData.setBoard_content(content);
		borderData.setBoard_re_ref(ref);
		borderData.setBoard_parent(num);	// 부모글의 글번호를 저장
		
		boolean result = dao.boardInsert(borderData);
		
		if(result){
			forward.setRedirect(false); 
			// 원래있던 페이지로 돌아가기 위해 페이지번호를 전달한다.
			forward.setNextPath("BoardListAction.bo?page="+pageNum); 
		}
		return forward;
	}
}
