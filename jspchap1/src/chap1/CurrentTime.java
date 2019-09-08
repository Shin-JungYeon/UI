package chap1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CurrentTime")
/* 
 * 어노테이션으로 요청 URL 정의하기.
 * http://localhost:8080/chap1/CurrentTime 으로 요청된 경우 현재 서블릿 호출.
 * CurrentTime : CurrentTime이라는 URL 정보를 받아 서블릿 호출.
 *				-> doGet(request(요청정보), response(응답정보))
 */
public class CurrentTime extends HttpServlet {  //서블릿을 상속받아 서블릿이 되도록 만들어 줌.
	private static final long serialVersionUID = 1L;
    public CurrentTime() {  //생성자. 없어도 됨.
        super();
    }
    
    //doGet : 요청방식이 Get 방식인 경우 호출 되는 메서드. 웹 어플리케이션 서버가 알아서 호출해줌. 기본 방식.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request  : 요청객체. 클라이언트의 요청 정보를 저장하고 있는 객체.
		//response : 응답객체. 클라이언트에 전달할 정보를 저장하고 있는 객체. 브라우저로 명령을 전달 하는 객체.
		
		response.setContentType("text/html; charset=euc-kr");  //응답의 정보를 알려줌. 여기서는 html, 한글.
		//text/html : 문서의 종류를 설정하는 방식. MIME 타입이라고 함(약속임). html, xml, ...
		
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int min = c.get(Calendar.MINUTE);
		int sec = c.get(Calendar.SECOND);
		PrintWriter out = response.getWriter();  //출력스트림. -> response 객체로부터 outputstream(response가 가지고 있음.)을 가져와서 브라우저(목적지)로 보냄.
		out.println("<html><head><title>현재시간</title></head>");
		out.println("<body>");
		out.println("<h1>현재시각은 " + hour + "시 " + min + "분 " + sec + "초 입니다.</h1></body></html>");
		//실행 후 페이지 소스보기 하면 out.println()에 작성한 내용만 보여줌.
	}
	
	//doPost : 요청방식이 Post 방식인 경우 호출 되는 메서드. 웹 어플리케이션 서버가 알아서 호출해줌.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	//main이 두 개(Get, Post)라고 보면 됨.
}
