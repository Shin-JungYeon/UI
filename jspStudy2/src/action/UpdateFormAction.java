package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class UpdateFormAction extends UserLoginAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new MemberDao().selectOne(id);
		request.setAttribute("mem", mem);
		return new ActionForward(false, "info.jsp");
	}
}
