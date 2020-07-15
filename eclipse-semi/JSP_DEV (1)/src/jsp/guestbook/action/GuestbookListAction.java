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
		
		// 현재 페이지 번호 만들기
		int spage = 1;
		String page = request.getParameter("page");

		if(page != null && !page.equals(""))	spage = Integer.parseInt(page);
		
		GuestbookDAO dao = GuestbookDAO.getInstance();
		int listCount = dao.getGuestbookCount();
		
		// 한 화면에 5개의 게시글을 보여지게함
		// 페이지 번호는 총 5개, 이후로는 [다음]으로 표시
				
		// 전체 페이지 수
		int maxPage = (int)(listCount/5.0 + 0.9);

		// 만약 사용자가 주소창에서 페이지 번호를 maxPage 보다 높은 값을 입력시
		// maxPage에 해당하는 목록을 보여준다.
		if(spage > maxPage) spage = maxPage;
		ArrayList<GuestbookBean> list = dao.getGuestbookList(spage*5-4);
		
		//시작 페이지 번호
		int startPage = (int)(spage/5.0 + 0.8) * 5 - 4;
		//마지막 페이지 번호
		int endPage = startPage + 4;
		if(endPage > maxPage)	endPage = maxPage;
		
		// 4개 페이지번호 저장
		request.setAttribute("spage", spage);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		// 방명록 목록 저장
		request.setAttribute("list", list);
		
		// 단순 조회이므로 forward()사용 (= DB의 상태변화 없으므로) 
		forward.setRedirect(false);
		forward.setNextPath("GuestbookForm.ge");
		
		return forward;
	}
}
