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
 * 학생 테이블의 전체 레코드 건수와 목록을 조회하기.
 * Student 클래스 생성.
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
		System.out.println("student 테이블의 레코드 갯수 : " + x);
		studentlist(session);
		
		System.out.println("\nStudent 테이블에 레코드 추가하기.");
		Student st = new Student();
		st.setStudno(1000);
		st.setName("홍길동");
		st.setGrade(1);
		st.setId("hongkd");
		st.setJumin("123456");
		st.setMajor1(101);
		session.insert("student.insert", st);  //st : 파라미터 값. -> xml로 넘어가서 parameterType과 같은 타입의 객체여야함.
		studentlist(session);
		
		System.out.println("\nStudent 테이블에서 학번 1000번인 학생의 정보 수정하기.");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", 1000);  //넣어줄 때 이름은 상관없음. xml에서 같게만 써주면 됨.
		map.put("jumin", "9001011000000");
		session.update("student.update", map);
//		st.setJumin("123456");
//		session.update("student.update", st);  //이렇게 쓰면 xml에서 parameterType에 Student로 써줘야 함. 두 방법 모두 가능.
		studentlist(session);
		
		System.out.println("\n학번이 1000번인 학생의 정보만 조회하기.");
		st = session.selectOne("student.selectone", 1000);
		System.out.println(st);
		
		System.out.println("\n성이 김씨인 학생의 목록 조회하기.");
		List<Student> list = session.selectList("student.selectname", "김");
		for(Student s : list) {
			System.out.println(s);
		}
		
		//같은 구문을 사용해서 다른 결과 출력하기.
		System.out.println("\n1학년 학생이면서 몸무게가 70 이상인 학생의 목록 조회하기.");
		map.clear();
		map.put("col1", "grade");
		map.put("col2", "weight");
		map.put("val1", 1);
		map.put("val2", 70);
		list = session.selectList("student.selectcol", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n101 학과의 3학년 이상인 학생의 목록 조회하기.");
		map.clear();
		map.put("col1", "major1");
		map.put("col2", "grade");
		map.put("val1", 101);
		map.put("val2", 3);
		list = session.selectList("student.selectcol", map);
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n1000번 학생을 삭제하기.");
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
