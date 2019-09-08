package rjava;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;

public class Test1 {
	public static void main(String[] args) throws REngineException, REXPMismatchException, IOException {
		String url = "https://www1.president.go.kr/articles/3440";
		String line = "";
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
			Elements e1 = doc.select(".text_wrap");
			for(Element ele : e1) {
				Elements e2 = ele.select("p");
				for(Element ele2 : e2) {
					String temp = ele2.html();
					line += temp + "\n";
				}
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
		System.out.println(line);
		
		RConnection c = new RConnection();
		String path = "D:/20190211/SJY/";
		c.parseAndEval("setwd('" + path + "')");
		c.parseAndEval("data = '" + line + "'");  //line이라는 문자열을 문자열로 인식시켜서 data에 넣어줘야 함.
		c.parseAndEval("write(data, 'moon.txt')");
	}
}
