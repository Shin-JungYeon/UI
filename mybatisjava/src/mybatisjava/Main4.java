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
 * Mybatis를 인터페이스 방식으로 사용하기.
 */
public class Main4 {
	private final static String ns="mapper.StudentMapper3.";  //ns : interface의 이름. interface도 클래스. 모든 클래스는 패키지를 포함하고 있음.
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
		System.out.println("모든 학생 정보 조회하기.");
		List<Student> list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n홍길동 학생 추가하기.");
		Student st = new Student();
		st.setStudno(1000);
		st.setName("홍길동");
		st.setId("hongkd");
		st.setJumin("9001011234567");
//		int result = 0;
		int result = session.getMapper(StudentMapper3.class).insert(st);
		System.out.println("추가 결과 : " + result);  //추가된 건수 알 수 있음.
		session.getMapper(StudentMapper3.class).insert(st);
		list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n홍길동 학생의 id를 hongkildong으로 수정하기.");
		st = new Student();
		st.setName("홍길동");
		st.setId("hongkildong");
		result = session.getMapper(StudentMapper3.class).update(st);
		System.out.println("수정 결과 : " + result);  //수정된 건수 알 수 있음.
		list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n이름에 '진' 문자를 가진 학생의 id를 '-jin'으로 수정하기.");
		st = new Student();
		st.setName("진");
		st.setId("-jin");
		result = session.getMapper(StudentMapper3.class).update(st);
		System.out.println("수정 결과 : " + result);  //수정된 건수 알 수 있음.
		list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("\n이름이 홍길동이고 학번이 1000번인 학생 삭제하기.");
		st = new Student();
		st.setName("홍길동");
		st.setStudno(1000);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("studno", 1000);
//		map.put("name", "홍길동");
//		result = session.getMapper(StudentMapper3.class).delete(map);  //Map 객체로 만들어서 해도 가능.
		result = session.getMapper(StudentMapper3.class).delete(st);
		System.out.println("삭제 결과 : " + result);
		list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		
		session.commit();  //모든 결과를 마무리.
	}
}
