package rjava;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

/*
 * ���ֵ�������.txt ������ �м��Ͽ� ���ֵ� ��õ������ 10���� �����Ͽ�
 * pie �׷���(jejupie.png)�� ���� �׷���(jejubar.png)�� �̹��� ���Ϸ� �����ϱ�.
 * 
 * c.parseAndEval("");
 */
public class RserveEx3 {
	public static void main(String[] args) throws REngineException, REXPMismatchException {
		RConnection c = new RConnection();
		String path = "D:/R/data/";
		String file = "jeju.txt";
		
		c.parseAndEval("setwd('" + path + "')");
		c.parseAndEval("library(KoNLP)");
		c.parseAndEval("useSejongDic()");
		c.parseAndEval("mergeUserDic(data.frame(readLines('���ֵ�������.txt'), 'ncn'))");
		c.parseAndEval("txt = readLines('" + file + "')");
		c.parseAndEval("place = sapply(txt, extractNoun, USE.NAMES = F)");
		c.parseAndEval("cdata = unlist(place)");
//		c.parseAndEval("install.packages('stringr')");
		c.parseAndEval("library(stringr)");
		c.parseAndEval("place = str_replace_all(cdata, '[^[:alpha:]]', '')");
		c.parseAndEval("place = gsub(' ', '', place)");
		c.parseAndEval("gsubtxt = readLines('���ֵ������ڽ�gsub.txt')");
		c.parseAndEval("cnt_gsub = length(gsubtxt)");
		c.parseAndEval("for(i in 1:cnt_gsub) {place = gsub(gsubtxt[i], '', place)}");
		c.parseAndEval("place = Filter(function(x) {nchar(x) >=2}, place)");
		c.parseAndEval("wordcnt = table(place)");
		c.parseAndEval("head(sort(wordcnt, decreasing=T), 30)");
		c.parseAndEval("top10 = head(sort(wordcnt, decreasing=T), 10)");
		c.parseAndEval("pie(top10, main='���ֵ� ��õ ���� �ڽ� top10')");
		c.parseAndEval("pct = round(top10/sum(top10)*100, 1)");
		c.parseAndEval("lab = paste(names(top10), '\\n', pct, '%')");
		
		c.parseAndEval("pie(top10, " + 
					"main='���ֵ� ��õ ���� �ڽ� top10', " + 
					"col=rainbow(10), " + 
					"cex=0.8, " + 
					"labels=lab)");
		c.parseAndEval("savePlot('jejupie.png', type='png')");
		
		c.parseAndEval("barplot(top10, " + 
					"main='���ֵ� ��õ ���� �ڽ� top10', " + 
					"col=rainbow(10), " + 
					"cex.names=0.7, " + 
					"las=2, " + 
					"ylim=c(0,25))");
		c.parseAndEval("savePlot('jejubar.png', type='png')");
		
		c.parseAndEval("dev.off()");  //â�� �߸� �װ� ������.....
		c.close();
	}
}
