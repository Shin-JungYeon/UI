package rjava;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

//Rserve(arg="--RS-encoding utf8") : ()���� ���� ��� ��� ����. �ѱ� ó���� ���ؼ��� ����� ��.
//Rserve() : �ڹٿ��� R������ �����ϵ��� �ϴ� ��ɾ�. R���� ���� ������ �÷���� �ڹٿ��� ���� ����.
//Rserve(����) : R <---��û--- Java(Ŭ���̾�Ʈ)
public class RserveEx1 {
	public static void main(String[] args) throws RserveException, REXPMismatchException {
		RConnection c = new RConnection();  //�ڹٿ��� R�� ����� �� �ֵ��� ����. R���� �㰡����� ��. -> Rserve ��Ű��.
		REXP x = c.eval("1 + 2");  //R�� ����Ǵ� ��ü. R ����� �⺻����. String ���� ����.
		System.out.println("R ��� : " + x.asInteger());  //R���� ���� ������ ��.
		c.close();  //���� ����.
	}
}
