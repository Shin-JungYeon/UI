package rjava;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

/*
 * seoul_new.txt ������ �о wordcloud �׷��� �����ϱ�.
 * ���� ��ġ : D:/R/data/seoul_new.txt
 * 
 * c.parseAndEval("") : R���� �����ߴ� ������ �ڹٰ� �������� ��������.
 */
public class RserveEx2 {
	public static void main(String[] args) throws REngineException, REXPMismatchException {
		RConnection c = new RConnection();
		String path = "D:/R/data/";
		String file = "seoul_new.txt";
		c.parseAndEval("setwd('" + path + "')");
		c.parseAndEval("library(KoNLP)");
		c.parseAndEval("library(wordcloud)");
		c.parseAndEval("library(RColorBrewer)");
		c.parseAndEval("useSejongDic()");
		c.parseAndEval("data1 = readLines('" + file + "')");
		c.parseAndEval("data2 = sapply(data1, extractNoun, USE.NAMES=F)");
		c.parseAndEval("data3 = unlist(data2)");
		c.parseAndEval("data3 = gsub('\\\\d+', '', data3)");  // \" == '
		c.parseAndEval("data3 = gsub('-', '', data3)");
		c.parseAndEval("data3 = gsub('�����', '', data3)");
		c.parseAndEval("data3 = gsub('����', '', data3)");
		c.parseAndEval("data3 = gsub(' ', '', data3)");
		c.parseAndEval("data3 = gsub('OO', '', data3)");
		c.parseAndEval("write(unlist(data3), 'seoul_1.txt')");
		c.parseAndEval("data4 = readLines('seoul_1.txt')");
		c.parseAndEval("data4 = Filter(function(x) {nchar(x) >= 1}, data4)");
		c.parseAndEval("wordcount = table(data4)");
		c.parseAndEval("palete = brewer.pal(9, 'Set3')");
		c.parseAndEval("wordcloud(names(wordcount), " + 
						"freq=wordcount, " + 
						"scale=c(5, 1), " + 
						"rot.per=0.25, " + 
						"min.freq=1, " + 
						"random.order=F, " + 
						"random.color=T, " + 
						"colors=palete)");
		c.parseAndEval("legend(0.3, 1, " + 
						"'����� ����� ��û���� �м�', " + 
						"cex=0.8, " + 
						"fill=NA, " + 
						"border=NA, " + 
						"bg='white', " + 
						"text.col='red', " + 
						"text.font=2, " + 
						"box.col='red')");
		c.parseAndEval("wordcount = sort(wordcount, decreasing = T)");
		c.parseAndEval("savePlot('wordcloud1.png', type='png')");
		c.parseAndEval("dev.off()");
		c.close();
	}
}
