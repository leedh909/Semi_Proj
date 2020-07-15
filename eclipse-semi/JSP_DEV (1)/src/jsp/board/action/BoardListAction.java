package jsp.board.action;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class BoardListAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// ���� ������ ��ȣ �����
		int spage = 1;
		String page = request.getParameter("page");

		if(page != null && !page.equals(""))	spage = Integer.parseInt(page);
		
		// �˻����ǰ� �˻������� �����´�.
		String opt = request.getParameter("opt");
		String condition = request.getParameter("condition");
		
		// �˻����ǰ� ������ Map�� ��´�.
		HashMap<String, Object> listOpt = new HashMap<String, Object>();
		listOpt.put("opt", opt);
		listOpt.put("condition", condition);
		
		BoardDAO dao = BoardDAO.getInstance();
		int listCount = dao.getBoardListCount(listOpt);
		
		// �� ȭ�鿡 10���� �Խñ��� ����������
		// ������ ��ȣ�� �� 5��, ���ķδ� [����]���� ǥ��
		
		// ��ü ������ ��
		int maxPage = (int)(listCount/10.0 + 0.9);

		// ���� ����ڰ� �ּ�â���� ������ ��ȣ�� maxPage ���� ���� ���� �Է½�
		// maxPage�� �ش��ϴ� ����� �����ش�.
		if(spage > maxPage) spage = maxPage;
		listOpt.put("start", spage*10-9);
		
		// �۸���� �����´�.
		ArrayList<BoardBean> list =  dao.getBoardList(listOpt);
	
		//���� ������ ��ȣ
		int startPage = (int)(spage/5.0 + 0.8) * 5 - 4;
		//������ ������ ��ȣ
		int endPage = startPage + 4;
		if(endPage > maxPage)	endPage = maxPage;
		
		// 4�� ��������ȣ ����
		request.setAttribute("spage", spage);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		// ���� �� ���� �۸�� ����
		//request.setAttribute("listCount", listCount);
		request.setAttribute("list", list);
		
		// �ܼ� ��ȸ�̹Ƿ� forward()��� (= DB�� ���º�ȭ �����Ƿ�) 
		forward.setRedirect(false);
		forward.setNextPath("BoardListForm.bo");
		
		return forward;
	}

}
