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
		System.out.println("학생의 전체 레코드 조회하기.");
		List<Student> list = session.selectList(ns + "selectByCondition");
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n1학년 학생의 레코드 조회하기.");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grade", 1);
		list = session.selectList(ns + "selectByCondition", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n학번이 980111인 학생의 레코드 조회하기.");
		map.clear();
		map.put("studno", 980111);
		Student st = session.selectOne(ns + "selectByCondition", map);  //selectOne : 조회되는 레코드가 1건인게 확실할 때 사용.
		System.out.println(st);
		
		System.out.println("\n1학년 학생 중 키가 180이상인 학생들의 레코드 조회하기. <choose>태그 사용.");  //조건이 두 개 이상이 되면? where절에 and 필요.
		map.clear();
//		map.put("grade", 1);
		map.put("height", 180);
		list = session.selectList(ns + "selectByCondition2", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n1학년 학생 중 키가 180이상인 학생들의 레코드 조회하기. <trim>태그 사용.");
		list = session.selectList(ns + "selectByTrim", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n101번 학과, 201번 학과, 301번 학과 학생의 레코드 조회하기. <foreach>태그 사용.");
		List<Integer> majorlist = Arrays.asList(101, 201, 301);
		map.clear();
		map.put("column", "major1");
		map.put("majors", majorlist);
		list = session.selectList(ns + "selectByForeach", map);
		for(Student s : list) {
			System.out.println(s);
		}

		System.out.println("\n2학년, 4학년 학생의 레코드만 조회하기.");
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