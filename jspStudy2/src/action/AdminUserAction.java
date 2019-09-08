package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//관리자 권한인 업무를 처리해주는 추상클래스 만들기
public abstract class AdminUserAction implements Action {
	protected String login;

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String) request.getSession().getAttribute("login");
		if(login == null || login.trim().equals("")) {
			request.setAttribute("msg", "관리자로 로그인하세요.");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false, "../alert.jsp");
		} else if(!login.equals("admin")) {
			request.setAttribute("msg", "관리자만 조회가 가능합니다.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false, "../alert.jsp");	
		}
		return doExcute(request, response);
	}
	protected abstract ActionForward doExcute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
