package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class AllAction {
	public String student(HttpServletRequest request, HttpServletResponse response) {
		RConnection c = null;
		String wh = request.getParameter("wh");
		String gm = request.getParameter("gm");
		String gr = request.getParameter("gr");
		String col1 = null, col2 = null, str1 = null, str2 = null;
		int limit = 100;
		if(wh.equals("1")) {
			col1 = "weight";
			str1 = "몸무게";
		} else if(wh.equals("2")) {
			col1 = "height";
			str1 = "키";
			limit = 200;
		}
		if(gm.equals("1")) {
			col2 = "grade";
			str2 = "학년";
		} else if(gm.equals("2")) {
			col2 = "major1";
			str2 = "학과";
		}
		String sql = "select " + col2 + " name, avg(" + col1 + ") avg from student where " + col1 + " is not null group by " + col2;
		
		try {
			c = new RConnection();
			c.parseAndEval("library(RJDBC)");
			c.parseAndEval("drv = JDBC(driverClass='org.mariadb.jdbc.Driver',"
					+ " classPath='D:/R/data/mariadb-java-client-2.4.1.jar')");
			c.parseAndEval("conn = dbConnect(drv, 'jdbc:mariadb://localhost:3306/bigdb', 'scott', 'tiger')");
			c.parseAndEval("rst = dbGetQuery(conn, '" + sql + "')");
			if(gr.equals("1")) {  //막대 그래프
				c.parseAndEval("bp = barplot(rst$avg, " + 
							"main='" + str2 + "별 평균 " + str1 + "', " + 
							"col=rainbow(10), " + 
							"cex.names=0.8, " + 
							"ylim=c(0, " + limit + "), " + 
							"names.arg=rst$name, " + 
							"las=1, " + 
							"xlab='" + str2 + "', " + 
							"ylab='" + str1 + "')");
				c.parseAndEval("abline(h=seq(0, " + limit + ", 10), lty=2)");
			} else if(gr.equals("2")) {  //파이 그래프
				c.parseAndEval("bp = pie(rst$avg, " + 
						"main='" + str2 + "별 평균 " + str1 + "', " + 
						"col=rainbow(10), " + 
						"cex=0.8, " + 
						"ylim=c(0, " + limit + "), " + 
						"labels=rst$name)");
			}
			String path = request.getServletContext().getRealPath("/") + "img/student.png";
			path = path.replace("\\", "/");
			c.parseAndEval("savePlot('" + path + "', type='png')");
			c.parseAndEval("dev.off()");
//			c.parseAndEval("");
		} catch (RserveException e) {
			e.printStackTrace();
		} catch (REngineException e) {
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		} finally {
			c.close();
		}
		
		return null;
	}
}
