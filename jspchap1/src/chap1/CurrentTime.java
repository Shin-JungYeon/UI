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
 * ������̼����� ��û URL �����ϱ�.
 * http://localhost:8080/chap1/CurrentTime ���� ��û�� ��� ���� ���� ȣ��.
 * CurrentTime : CurrentTime�̶�� URL ������ �޾� ���� ȣ��.
 *				-> doGet(request(��û����), response(��������))
 */
public class CurrentTime extends HttpServlet {  //������ ��ӹ޾� ������ �ǵ��� ����� ��.
	private static final long serialVersionUID = 1L;
    public CurrentTime() {  //������. ��� ��.
        super();
    }
    
    //doGet : ��û����� Get ����� ��� ȣ�� �Ǵ� �޼���. �� ���ø����̼� ������ �˾Ƽ� ȣ������. �⺻ ���.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request  : ��û��ü. Ŭ���̾�Ʈ�� ��û ������ �����ϰ� �ִ� ��ü.
		//response : ���䰴ü. Ŭ���̾�Ʈ�� ������ ������ �����ϰ� �ִ� ��ü. �������� ����� ���� �ϴ� ��ü.
		
		response.setContentType("text/html; charset=euc-kr");  //������ ������ �˷���. ���⼭�� html, �ѱ�.
		//text/html : ������ ������ �����ϴ� ���. MIME Ÿ���̶�� ��(�����). html, xml, ...
		
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int min = c.get(Calendar.MINUTE);
		int sec = c.get(Calendar.SECOND);
		PrintWriter out = response.getWriter();  //��½�Ʈ��. -> response ��ü�κ��� outputstream(response�� ������ ����.)�� �����ͼ� ������(������)�� ����.
		out.println("<html><head><title>����ð�</title></head>");
		out.println("<body>");
		out.println("<h1>����ð��� " + hour + "�� " + min + "�� " + sec + "�� �Դϴ�.</h1></body></html>");
		//���� �� ������ �ҽ����� �ϸ� out.println()�� �ۼ��� ���븸 ������.
	}
	
	//doPost : ��û����� Post ����� ��� ȣ�� �Ǵ� �޼���. �� ���ø����̼� ������ �˾Ƽ� ȣ������.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	//main�� �� ��(Get, Post)��� ���� ��.
}
