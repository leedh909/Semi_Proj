package jsp.board.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class BoardUpdateAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// ��� �ۼ� �� ���� �������� ���ư��� ���� ������ ��ȣ�� �ʿ��ϴ�.
		String pageNum = request.getParameter("page");
		
		// ���ε� ���� ������
		int fileSize= 5*1024*1024;
		// ���ε�� ���� ������
		String uploadPath = request.getServletContext().getRealPath("/UploadFolder");
		
		try {
			MultipartRequest multi = new MultipartRequest
					(request, uploadPath, fileSize, "euc-kr", new DefaultFileRenamePolicy());
			
			// �ĸ����� ���� �����´�.
			int num = Integer.parseInt(multi.getParameter("board_num")); // �� ��ȣ
			String subject = multi.getParameter("board_subject");	// �� ����
			String content = multi.getParameter("board_content");	// �� ����
			String existFile = multi.getParameter("existing_file");	// ���� ÷�� ����
			
			// �Ķ���� ���� �ڹٺ� �����Ѵ�.
			BoardBean border = new BoardBean();
			border.setBoard_num(num);
			border.setBoard_subject(subject);
			border.setBoard_content(content);
			
			// �� ���� �� ���ε�� ���� ��������
			Enumeration<String> fileNames = multi.getFileNames();
			if(fileNames.hasMoreElements())
			{
				String fileName = fileNames.nextElement();
				String updateFile = multi.getFilesystemName(fileName);
				
				if(updateFile == null)	// ������ ���ο� ������ ÷�� ���ߴٸ� ���� ���ϸ��� ����
					border.setBoard_file(existFile);
				else	// ���ο� ������ ÷������ ���
					border.setBoard_file(updateFile);
			}
			
			BoardDAO dao = BoardDAO.getInstance();
			boolean result = dao.updateBoard(border);
			
			if(result){
				forward.setRedirect(true); 
				// �����ִ� �������� ���ư��� ���� ��������ȣ�� �����Ѵ�.
				forward.setNextPath("BoardListAction.bo?page="+pageNum); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�� ���� ���� : " + e.getMessage());
		}

		return forward;
	}
}
