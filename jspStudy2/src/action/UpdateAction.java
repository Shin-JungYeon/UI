package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;
/*
 * 
 * update.me �� ���.
		1. ��� �Ķ���͸� Member ��ü�� ����.
		2. ��й�ȣ ����
			- ��ġ : db ����.
				- ���� : ���� �޼��� ��� �� main.me�� ������ �̵�.
				- ���� : ���� �޼��� ��� �� updateForm.me�� ������ �̵�.
			- ����ġ : ��й�ȣ ���� �޼��� ��� �� updateForm.me�� ������ �̵�.
 */
public class UpdateAction extends UserLoginAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setPicture(request.getParameter("picture"));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		
		MemberDao dao = new MemberDao();
		Member dbMem = dao.selectOne(mem.getId());
		String msg = null;
		String url = null;
		
		if(login.equals("admin") || mem.getPass().equals(dbMem.getPass())) {
			if(dao.update(mem) > 0) {
				msg = "���� ������ ���������� �Ϸ�Ǿ����ϴ�.";
				url = "main.me";
			} else {
				msg = "���� ������ �����Ͽ����ϴ�.";
				url = "updateForm.me?id=" + id;
			}
		} else {
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.";
			url = "updateForm.me?id=" + id;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
		
	}
}

