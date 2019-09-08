package rjava;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

//Rserve(arg="--RS-encoding utf8") : ()안의 내용 없어도 상관 없음. 한글 처리를 위해서는 써줘야 함.
//Rserve() : 자바에서 R연결이 가능하도록 하는 명령어. R에서 먼저 서버를 올려줘야 자바에서 실행 가능.
//Rserve(서버) : R <---요청--- Java(클라이언트)
public class RserveEx1 {
	public static void main(String[] args) throws RserveException, REXPMismatchException {
		RConnection c = new RConnection();  //자바에서 R을 사용할 수 있도록 연결. R에서 허가해줘야 함. -> Rserve 패키지.
		REXP x = c.eval("1 + 2");  //R에 저장되는 객체. R 언어의 기본형태. String 등을 전달.
		System.out.println("R 결과 : " + x.asInteger());  //R에서 값을 가져올 때.
		c.close();  //연결 해제.
	}
}
