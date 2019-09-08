package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Main3 {
	private final static String ns="student2.";
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
		System.out.println("�л��� ��ü ���ڵ� ��ȸ�ϱ�.");
		List<Student> list = session.selectList(ns + "selectByCondition");
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n1�г� �л��� ���ڵ� ��ȸ�ϱ�.");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grade", 1);
		list = session.selectList(ns + "selectByCondition", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n�й��� 980111�� �л��� ���ڵ� ��ȸ�ϱ�.");
		map.clear();
		map.put("studno", 980111);
		Student st = session.selectOne(ns + "selectByCondition", map);  //selectOne : ��ȸ�Ǵ� ���ڵ尡 1���ΰ� Ȯ���� �� ���.
		System.out.println(st);
		
		System.out.println("\n1�г� �л� �� Ű�� 180�̻��� �л����� ���ڵ� ��ȸ�ϱ�. <choose>�±� ���.");  //������ �� �� �̻��� �Ǹ�? where���� and �ʿ�.
		map.clear();
//		map.put("grade", 1);
		map.put("height", 180);
		list = session.selectList(ns + "selectByCondition2", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n1�г� �л� �� Ű�� 180�̻��� �л����� ���ڵ� ��ȸ�ϱ�. <trim>�±� ���.");
		list = session.selectList(ns + "selectByTrim", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n101�� �а�, 201�� �а�, 301�� �а� �л��� ���ڵ� ��ȸ�ϱ�. <foreach>�±� ���.");
		List<Integer> majorlist = Arrays.asList(101, 201, 301);
		map.clear();
		map.put("column", "major1");
		map.put("majors", majorlist);
		list = session.selectList(ns + "selectByForeach", map);
		for(Student s : list) {
			System.out.println(s);
		}

		System.out.println("\n2�г�, 4�г� �л��� ���ڵ常 ��ȸ�ϱ�.");
		List<Integer> gradelist = Arrays.asList(2, 4);
		map.clear();
		map.put("column", "grade");
		map.put("grades", gradelist);
		list = session.selectList(ns + "selectByForeach", map);
		for(Student s : list) {
			System.out.println(s);
		}
	}
}