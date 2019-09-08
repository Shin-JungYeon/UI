package rjava;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

/*
 * c.parseAndEval("");
 */
public class RserveEx4 {
	public static void main(String[] args) throws REngineException, REXPMismatchException {
		//RConnection() : localhost의 6311 포트(기본)로 연결.
		//RConnection(String host) : 해당 host의 6311 포트로 연결.
		//RConnection(String host, int port) : 해당 host의 지정해준 포트로 연결. 서버와 클라이언트가 맞춰줘야 함.
		RConnection c = new RConnection();
		String path = "D:/R/data/";
		String file = "jeju.txt";

		//parseAndEval() : R 서버에 변수들을 저장하고, 결과를 REXP 객체로 리턴.
		c.parseAndEval("setwd('" + path + "')");
		c.parseAndEval("library(plotrix)");
		c.parseAndEval("library(KoNLP)");
		c.parseAndEval("library(stringr)");
		c.parseAndEval("useSejongDic()");
		c.parseAndEval("mergeUserDic(data.frame(readLines('제주도여행지.txt'), 'ncn'))");
		c.parseAndEval("txt = readLines('" + file + "')");
		c.parseAndEval("place = sapply(txt, extractNoun, USE.NAMES = F)");
		c.parseAndEval("cdata = unlist(place)");
		c.parseAndEval("place = str_replace_all(cdata, '[^[:alpha:]]', '')");
		c.parseAndEval("place = gsub(' ', '', place)");
		c.parseAndEval("gsubtxt = readLines('제주도여행코스gsub.txt')");
		c.parseAndEval("cnt_gsub = length(gsubtxt)");
		c.parseAndEval("for(i in 1:cnt_gsub) {place = gsub(gsubtxt[i], '', place)}");
		c.parseAndEval("place = Filter(function(x) {nchar(x) >=2}, place)");
		c.parseAndEval("wordcnt = table(place)");
		c.parseAndEval("top10 = head(sort(wordcnt, decreasing=T), 10)");
		c.parseAndEval("lab = paste(names(top10), '\\n', top10, '건')");
		
		c.parseAndEval("pie3D(top10, " + 
					"main='제주도 추천 여행지 top10', " + 
					"col=rainbow(10), " + 
					"labelcex=0.7, " + 
					"labels=lab, " + 
					"explode=0.05)");
		c.parseAndEval("savePlot('jeju3Dpie.png', type='png')");  //자동으로 그림을 그릴 수 있는 창 만들어서 이미지 저장.
		
		c.parseAndEval("dev.off()");  //위에서 만든 창 없애줌.
		c.close();
	}
}
