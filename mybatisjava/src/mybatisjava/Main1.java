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
		Reader reader = null;  //������ �Է� ��Ʈ��. �ܺ��� ������ �о��.
		try {
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");  //mapper/mybatis-config.xml �� �ִ� ���� �о��.
			sqlMap = new SqlSessionFactoryBuilder().build(reader);  //sql������ �����ϰ� �ִ� �����̳� ��ü. -> �м�.
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		int x = 0;
		SqlSession session = sqlMap.openSession();  //���� ��ü�� ����. mybatis�� ������ �� �ִ� ���� ������ ������ ����. Ʈ�����.
		x = (Integer) session.selectOne("member.count");  //selectOne : ������ �����ؼ� ����� ����. �� �� ������� �� ����.
		System.out.println("member ���̺��� ���ڵ� ���� : " + x);
		
		List<Member> list = session.selectList("member.list");  //selectList : ������� ���� ���� ��� List��ü�� ����. xml ���Ͽ��� resultType���� List�� ����Ǵ� ��ü�� Ÿ���� �����ָ� ��.
		for(Member m : list) {
			System.out.println(m);
		}
		
	}
}
