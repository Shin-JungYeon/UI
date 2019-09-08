package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Member;
import model.MemberDao;

public class InfoAction extends UserLoginAction {
	@Override
	protected ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new MemberDao().selectOne(id);
		request.setAttribute("mem", mem);
		return new ActionForward(false, null);  //계속 똑같이 코딩되기때문에 null 넣어주고 이 메서드 호출한 페이지로 넘겨주도록 할 수 있음.
	}
}
