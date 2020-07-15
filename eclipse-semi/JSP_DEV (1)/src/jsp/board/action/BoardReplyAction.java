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
		
		// ��� �ۼ� �� ���� �������� ���ư��� ���� ������ ��ȣ�� �ʿ��ϴ�.
		String pageNum = request.getParameter("page");
		
		// �ĸ����� ���� �����´�.
		int num = Integer.parseInt(request.getParameter("board_num"));
		String id = request.getParameter("board_id");
		String subject = request.getParameter("board_subject");
		String content = request.getParameter("board_content");
		int ref = Integer.parseInt(request.getParameter("board_re_ref"));

		// ��� ����
		borderData.setBoard_num(dao.getSeq()); // ����� �۹�ȣ�� �������� ������ ����
		borderData.setBoard_id(id);
		borderData.setBoard_subject(subject);
		borderData.setBoard_content(content);
		borderData.setBoard_re_ref(ref);
		borderData.setBoard_parent(num);	// �θ���� �۹�ȣ�� ����
		
		boolean result = dao.boardInsert(borderData);
		
		if(result){
			forward.setRedirect(false); 
			// �����ִ� �������� ���ư��� ���� ��������ȣ�� �����Ѵ�.
			forward.setNextPath("BoardListAction.bo?page="+pageNum); 
		}
		return forward;
	}
}
