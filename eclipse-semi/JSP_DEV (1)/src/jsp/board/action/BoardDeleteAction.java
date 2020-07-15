package jsp.board.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.board.comment.model.CommentDAO;
import jsp.board.model.BoardDAO;
import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class BoardDeleteAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		BoardDAO dao = BoardDAO.getInstance();

		// �۹�ȣ�� �����´�.
		String num = request.getParameter("num");
		int boardNum = Integer.parseInt(num);
		
		// ������ �ۿ� �ִ� ���� ������ �����´�.
		String fileName = dao.getFileName(boardNum);
		// �� ���� - ����� ������� ��۵� ��� �����Ѵ�.
		boolean result = dao.deleteBoard(boardNum);
		
		// ���ϻ��� 
		if(fileName != null)
		{
			// ������ �ִ� ������ �����θ� �����´�.
			String folder = request.getServletContext().getRealPath("UploadFolder");
			// ������ �����θ� �����.
			String filePath = folder + "/" + fileName;

			File file = new File(filePath);
			if(file.exists()) file.delete(); // ������ 1���� ���ε� �ǹǷ� �ѹ��� �����ϸ� �ȴ�.
		}
		
		if(result){
			forward.setRedirect(true);
			forward.setNextPath("BoardListAction.bo");
		}
		else
			return null;

		return forward;
	}
}