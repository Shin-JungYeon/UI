package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

@WebServlet(urlPatterns = {"*.me"}, initParams = {@WebInitParam(name="properties", value="action.properties")})
// urlPatterns = {"*.me"} : *.me 가 요청되면 이 서블릿 호출.

public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> commandMap = new HashMap<String, Action>();
	//commandMap : action.properties 파일의 정의된 클래스를 객체화하여 저장. Action은 인터페이스 형태. Action 인터페이스를 구현한 클래스들이 들어옴. 때문에 반드시 Action 구현해야해.
	
	//tomcat이 이 서블릿 호출되면 바로 객체화해서 init 메서드 호출.
	//init 메서드  : 서블릿 클래스가 객체화 시 한 번 호출되는 메서드
	//config : properties = action.properties Map 객체를 저장함.
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("properties");  //action.properties 를 가지고 있는 변수.
		Properties pr = new Properties();  //Map객체의 하위 클래스 HashMap 객체.
		FileInputStream f = null;
		try {
			f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
			//f : /WebContent/WEB-INF/action.properties
			pr.load(f);  //왼쪽은 key 오른쪽은 value로
			//pr : /model2/hello.me=action.HelloAction
		} catch(IOException e) {
			throw new ServletException(e);
		} finally {
			try {
				if(f != null) f.close();
			} catch(IOException e) {}
		}
		for(Object k :pr.keySet()) {
			String command = (String) k;  //k : "/model2/hello.me"
			String className = pr.getProperty(command);  //className : "action.HelloAction"
			try {
				Class commandClass = Class.forName(className);  //className 문자열을 클래스화 시킴. 클래스 영역에 해당 클래스를 load
																//commandClass : action.HelloAction 클래스 저장.
				Object commandObj = commandClass.newInstance();  //action.HelloAction 클래스를 객체로 생성하여 저장.
				commandMap.put(command, (Action) commandObj);  //"/model2/hello.me", action.HelloAction 클래스 객체
			} catch(Exception e) {
				throw new ServletException(e);
			}
		}
	}
	
    public ControllerServlet() {}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("euc-kr");
    	Action action = null;
    	ActionForward forward = null;
    	String command = null;
    	try {
    		command = request.getRequestURI().substring(request.getContextPath().length());
    		//command = /model2/hello.me  key 부분을 url로 부터 찾아옴.
    		
    		action = commandMap.get(command);
    		//action : HelloAction 객체 저장.
    		
    		forward = action.excute(request, response);
    		//forward : new ActionForward(false, "hello.jsp") 객체 저장.
    		
    	} catch(NullPointerException e) {
    		forward = new ActionForward(false, null);
    	} catch(Exception e) {
    		throw new ServletException(e);
    	}
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getView());
    		} else {
    			if(forward.getView() == null) {  //url에서 .me로 들어온 정보를 .jsp 로 바꿔서 보내줘.
    				forward.setView(command.replace(".me", ".jsp"));
    			}
    			RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
    			disp.forward(request, response);  //hello.jsp 페이지 호출. 같은 request 객체 공유.
    		}
    	} else {
    		response.sendRedirect("nopage.jsp");
    	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
