package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * �л� ���̺��� ��ü ���ڵ� �Ǽ��� ����� ��ȸ�ϱ�.
 * Student Ŭ���� ����.
 */
public class Main2 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		int x = 0;
		SqlSession session = sqlMap.openSession();
		x = (Integer) session.selectOne("student.count");
		System.out.println("student ���̺��� ���ڵ� ���� : " + x);
		studentlist(session);
		
		System.out.println("\nStudent ���̺� ���ڵ� �߰��ϱ�.");
		Student st = new Student();
		st.setStudno(1000);
		st.setName("ȫ�浿");
		st.setGrade(1);
		st.setId("hongkd");
		st.setJumin("123456");
		st.setMajor1(101);
		session.insert("student.insert", st);  //st : �Ķ���� ��. -> xml�� �Ѿ�� parameterType�� ���� Ÿ���� ��ü������.
		studentlist(session);
		
		System.out.println("\nStudent ���̺��� �й� 1000���� �л��� ���� �����ϱ�.");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", 1000);  //�־��� �� �̸��� �������. xml���� ���Ը� ���ָ� ��.
		map.put("jumin", "9001011000000");
		session.update("student.update", map);
//		st.setJumin("123456");
//		session.update("student.update", st);  //�̷��� ���� xml���� parameterType�� Student�� ����� ��. �� ��� ��� ����.
		studentlist(session);
		
		System.out.println("\n�й��� 1000���� �л��� ������ ��ȸ�ϱ�.");
		st = session.selectOne("student.selectone", 1000);
		System.out.println(st);
		
		System.out.println("\n���� �达�� �л��� ��� ��ȸ�ϱ�.");
		List<Student> list = session.selectList("student.selectname", "��");
		for(Student s : list) {
			System.out.println(s);
		}
		
		//���� ������ ����ؼ� �ٸ� ��� ����ϱ�.
		System.out.println("\n1�г� �л��̸鼭 �����԰� 70 �̻��� �л��� ��� ��ȸ�ϱ�.");
		map.clear();
		map.put("col1", "grade");
		map.put("col2", "weight");
		map.put("val1", 1);
		map.put("val2", 70);
		list = session.selectList("student.selectcol", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n101 �а��� 3�г� �̻��� �л��� ��� ��ȸ�ϱ�.");
		map.clear();
		map.put("col1", "major1");
		map.put("col2", "grade");
		map.put("val1", 101);
		map.put("val2", 3);
		list = session.selectList("student.selectcol", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n1000�� �л��� �����ϱ�.");
		session.delete("student.delete", 1000);
		studentlist(session);
		
	}
	
	private static void studentlist(SqlSession session) {
		List<Student> list = session.selectList("student.list");
		for(Student s : list) {
			System.out.println(s);
		}
	}
}
