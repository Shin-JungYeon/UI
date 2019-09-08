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
// urlPatterns = {"*.me"} : *.me �� ��û�Ǹ� �� ���� ȣ��.

public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> commandMap = new HashMap<String, Action>();
	//commandMap : action.properties ������ ���ǵ� Ŭ������ ��üȭ�Ͽ� ����. Action�� �������̽� ����. Action �������̽��� ������ Ŭ�������� ����. ������ �ݵ�� Action �����ؾ���.
	
	//tomcat�� �� ���� ȣ��Ǹ� �ٷ� ��üȭ�ؼ� init �޼��� ȣ��.
	//init �޼���  : ���� Ŭ������ ��üȭ �� �� �� ȣ��Ǵ� �޼���
	//config : properties = action.properties Map ��ü�� ������.
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("properties");  //action.properties �� ������ �ִ� ����.
		Properties pr = new Properties();  //Map��ü�� ���� Ŭ���� HashMap ��ü.
		FileInputStream f = null;
		try {
			f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
			//f : /WebContent/WEB-INF/action.properties
			pr.load(f);  //������ key �������� value��
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
				Class commandClass = Class.forName(className);  //className ���ڿ��� Ŭ����ȭ ��Ŵ. Ŭ���� ������ �ش� Ŭ������ load
																//commandClass : action.HelloAction Ŭ���� ����.
				Object commandObj = commandClass.newInstance();  //action.HelloAction Ŭ������ ��ü�� �����Ͽ� ����.
				commandMap.put(command, (Action) commandObj);  //"/model2/hello.me", action.HelloAction Ŭ���� ��ü
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
    		//command = /model2/hello.me  key �κ��� url�� ���� ã�ƿ�.
    		
    		action = commandMap.get(command);
    		//action : HelloAction ��ü ����.
    		
    		forward = action.excute(request, response);
    		//forward : new ActionForward(false, "hello.jsp") ��ü ����.
    		
    	} catch(NullPointerException e) {
    		forward = new ActionForward(false, null);
    	} catch(Exception e) {
    		throw new ServletException(e);
    	}
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getView());
    		} else {
    			if(forward.getView() == null) {  //url���� .me�� ���� ������ .jsp �� �ٲ㼭 ������.
    				forward.setView(command.replace(".me", ".jsp"));
    			}
    			RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
    			disp.forward(request, response);  //hello.jsp ������ ȣ��. ���� request ��ü ����.
    		}
    	} else {
    		response.sendRedirect("nopage.jsp");
    	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
