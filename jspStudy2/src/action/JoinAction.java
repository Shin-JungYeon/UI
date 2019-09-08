package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

/*
 * 1. �Ķ���� ���� Member Ŭ���� ��ü�� ����.
 * 2. Member ��ü�� db�� insert
 * 3. ��� ���� : loginForm.jsp ������ �̵�.
 * 	    ��� ���� : joinForm.jsp ������ �̵�.
 */
public class JoinAction implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setName(request.getParameter("name"));
		mem.setPass(request.getParameter("pass"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setEmail(request.getParameter("email"));
		mem.setTel(request.getParameter("tel"));
		mem.setPicture(request.getParameter("picture"));
		if(new MemberDao().insert(mem) > 0) {
			return new ActionForward(true, "loginForm.jsp");  //false : ��Ʈ�ѷ��� �������� �Ӽ����� ������ ����ؾ� �� ��.
		} else {
			return new ActionForward(true, "joinForm.jsp");
		}
	}
}
