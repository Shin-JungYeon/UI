package rjava;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;

public class Test2 {
	public static void main(String[] args) throws REngineException, REXPMismatchException {
		RConnection c = new RConnection();
		String path = "D:/20190211/SJY/";
		String subfile = "moonsub.txt";
		String file = "moon.txt";
		
		c.parseAndEval("setwd('" + path + "')");
		c.parseAndEval("library(KoNLP)");
		c.parseAndEval("useSejongDic()");
		c.parseAndEval("txt = readLines('" + file + "')");
		c.parseAndEval("moonword = sapply(txt, extractNoun, USE.NAMES = F)");
		c.parseAndEval("cdata = unlist(moonword)");
		c.parseAndEval("library(stringr)");
		c.parseAndEval("moonword = str_replace_all(cdata, '[^[:alpha:]]', '')");
		c.parseAndEval("moonword = gsub(' ', '', moonword)");
		c.parseAndEval("gsubtxt = readLines('" + subfile + "')");
		c.parseAndEval("cnt_gsub = length(gsubtxt)");
		c.parseAndEval("for(i in 1:cnt_gsub) {moonword = gsub(gsubtxt[i], '', moonword)}");
		c.parseAndEval("moonword = Filter(function(x) {nchar(x) >=2}, moonword)");
		c.parseAndEval("wordcnt = table(moonword)");
		c.parseAndEval("top20 = head(sort(wordcnt, decreasing=T), 20)");
		c.parseAndEval("write.csv(top20, 'top20')");
	}
}
