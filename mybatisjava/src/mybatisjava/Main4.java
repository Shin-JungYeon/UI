package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.StudentMapper3;

/*
 * Mybatis�� �������̽� ������� ����ϱ�.
 */
public class Main4 {
	private final static String ns="mapper.StudentMapper3.";  //ns : interface�� �̸�. interface�� Ŭ����. ��� Ŭ������ ��Ű���� �����ϰ� ����.
	private static SqlSessionFactory sqlMap;
	static {
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		} catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		System.out.println("��� �л� ���� ��ȸ�ϱ�.");
		List<Student> list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\nȫ�浿 �л� �߰��ϱ�.");
		Student st = new Student();
		st.setStudno(1000);
		st.setName("ȫ�浿");
		st.setId("hongkd");
		st.setJumin("9001011234567");
//		int result = 0;
		int result = session.getMapper(StudentMapper3.class).insert(st);
		System.out.println("�߰� ��� : " + result);  //�߰��� �Ǽ� �� �� ����.
		session.getMapper(StudentMapper3.class).insert(st);
		list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\nȫ�浿 �л��� id�� hongkildong���� �����ϱ�.");
		st = new Student();
		st.setName("ȫ�浿");
		st.setId("hongkildong");
		result = session.getMapper(StudentMapper3.class).update(st);
		System.out.println("���� ��� : " + result);  //������ �Ǽ� �� �� ����.
		list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n�̸��� '��' ���ڸ� ���� �л��� id�� '-jin'���� �����ϱ�.");
		st = new Student();
		st.setName("��");
		st.setId("-jin");
		result = session.getMapper(StudentMapper3.class).update(st);
		System.out.println("���� ��� : " + result);  //������ �Ǽ� �� �� ����.
		list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n�̸��� ȫ�浿�̰� �й��� 1000���� �л� �����ϱ�.");
		st = new Student();
		st.setName("ȫ�浿");
		st.setStudno(1000);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("studno", 1000);
//		map.put("name", "ȫ�浿");
//		result = session.getMapper(StudentMapper3.class).delete(map);  //Map ��ü�� ���� �ص� ����.
		result = session.getMapper(StudentMapper3.class).delete(st);
		System.out.println("���� ��� : " + result);
		list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		
		session.commit();  //��� ����� ������.
	}
}
