package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Main1 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;  //문자형 입력 스트림. 외부의 내용을 읽어옴.
		try {
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");  //mapper/mybatis-config.xml 에 있는 내용 읽어옴.
			sqlMap = new SqlSessionFactoryBuilder().build(reader);  //sql구문을 저장하고 있는 컨테이너 객체. -> 분석.
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		int x = 0;
		SqlSession session = sqlMap.openSession();  //접속 객체를 리턴. mybatis를 실행할 수 있는 실행 권한을 가지고 있음. 트랙잭션.
		x = (Integer) session.selectOne("member.count");  //selectOne : 구문을 실행해서 결과값 저장. 이 때 결과값은 한 개뿐.
		System.out.println("member 테이블의 레코드 갯수 : " + x);
		
		List<Member> list = session.selectList("member.list");  //selectList : 결과값이 여러 개인 경우 List객체로 리턴. xml 파일에서 resultType에는 List에 저장되는 객체의 타입을 적어주면 됨.
		for(Member m : list) {
			System.out.println(m);
		}
		
	}
}
