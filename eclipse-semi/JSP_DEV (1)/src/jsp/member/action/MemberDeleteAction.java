package jsp.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.member.model.MemberDAO;

/**
 * ȸ������ �۾��� ó���ϴ� Action Ŭ����
 */
public class MemberDeleteAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// ������ �������ִ� �α����� ID ������ �����´�
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
		String password = request.getParameter("password");
		
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.deleteMember(id, password);
		
		if(check == 1){
			// ������ ȸ������ ����
			session.removeAttribute("sessionID");
			forward.setRedirect(true);
			forward.setNextPath("ResultForm.do");
		}
		else{
			System.out.println("ȸ�� ���� ����");
			return null;
		}
		
		return forward;
	}
}
