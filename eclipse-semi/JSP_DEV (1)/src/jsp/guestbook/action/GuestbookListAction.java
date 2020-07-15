package jsp.guestbook.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookBean;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookListAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// ���� ������ ��ȣ �����
		int spage = 1;
		String page = request.getParameter("page");

		if(page != null && !page.equals(""))	spage = Integer.parseInt(page);
		
		GuestbookDAO dao = GuestbookDAO.getInstance();
		int listCount = dao.getGuestbookCount();
		
		// �� ȭ�鿡 5���� �Խñ��� ����������
		// ������ ��ȣ�� �� 5��, ���ķδ� [����]���� ǥ��
				
		// ��ü ������ ��
		int maxPage = (int)(listCount/5.0 + 0.9);

		// ���� ����ڰ� �ּ�â���� ������ ��ȣ�� maxPage ���� ���� ���� �Է½�
		// maxPage�� �ش��ϴ� ����� �����ش�.
		if(spage > maxPage) spage = maxPage;
		ArrayList<GuestbookBean> list = dao.getGuestbookList(spage*5-4);
		
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
		// ���� ��� ����
		request.setAttribute("list", list);
		
		// �ܼ� ��ȸ�̹Ƿ� forward()��� (= DB�� ���º�ȭ �����Ƿ�) 
		forward.setRedirect(false);
		forward.setNextPath("GuestbookForm.ge");
		
		return forward;
	}
}
