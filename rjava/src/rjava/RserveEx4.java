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
		//RConnection() : localhost�� 6311 ��Ʈ(�⺻)�� ����.
		//RConnection(String host) : �ش� host�� 6311 ��Ʈ�� ����.
		//RConnection(String host, int port) : �ش� host�� �������� ��Ʈ�� ����. ������ Ŭ���̾�Ʈ�� ������� ��.
		RConnection c = new RConnection();
		String path = "D:/R/data/";
		String file = "jeju.txt";

		//parseAndEval() : R ������ �������� �����ϰ�, ����� REXP ��ü�� ����.
		c.parseAndEval("setwd('" + path + "')");
		c.parseAndEval("library(plotrix)");
		c.parseAndEval("library(KoNLP)");
		c.parseAndEval("library(stringr)");
		c.parseAndEval("useSejongDic()");
		c.parseAndEval("mergeUserDic(data.frame(readLines('���ֵ�������.txt'), 'ncn'))");
		c.parseAndEval("txt = readLines('" + file + "')");
		c.parseAndEval("place = sapply(txt, extractNoun, USE.NAMES = F)");
		c.parseAndEval("cdata = unlist(place)");
		c.parseAndEval("place = str_replace_all(cdata, '[^[:alpha:]]', '')");
		c.parseAndEval("place = gsub(' ', '', place)");
		c.parseAndEval("gsubtxt = readLines('���ֵ������ڽ�gsub.txt')");
		c.parseAndEval("cnt_gsub = length(gsubtxt)");
		c.parseAndEval("for(i in 1:cnt_gsub) {place = gsub(gsubtxt[i], '', place)}");
		c.parseAndEval("place = Filter(function(x) {nchar(x) >=2}, place)");
		c.parseAndEval("wordcnt = table(place)");
		c.parseAndEval("top10 = head(sort(wordcnt, decreasing=T), 10)");
		c.parseAndEval("lab = paste(names(top10), '\\n', top10, '��')");
		
		c.parseAndEval("pie3D(top10, " + 
					"main='���ֵ� ��õ ������ top10', " + 
					"col=rainbow(10), " + 
					"labelcex=0.7, " + 
					"labels=lab, " + 
					"explode=0.05)");
		c.parseAndEval("savePlot('jeju3Dpie.png', type='png')");  //�ڵ����� �׸��� �׸� �� �ִ� â ���� �̹��� ����.
		
		c.parseAndEval("dev.off()");  //������ ���� â ������.
		c.close();
	}
}
