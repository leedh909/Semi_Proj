package jsp.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;

/** 
 * ���� �α����� ������� ȸ�������� �����ִ� Action Ŭ����
 */
public class MemberInfoAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		// ������ �������ִ� �α����� ID ������ �����´�
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
		
		// �� ���̵� �ش��ϴ� ȸ�������� �����´�.
		MemberDAO dao = MemberDAO.getInstance();
		MemberBean member = dao.getUserInfo(id);
		
		// UserInfoForm.jsp�� ȸ�������� �����ϱ� ���� request�� MemberBean�� �����Ѵ�.
		request.setAttribute("memberInfo", member);
		
		forward.setRedirect(false);
		forward.setNextPath("UserInfoForm.do");
		// MainForm.jsp?contentPage=member/view/UserInfoForm.jsp
		
		return forward;
	}

}
