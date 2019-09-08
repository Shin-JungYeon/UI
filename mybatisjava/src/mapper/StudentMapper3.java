package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mybatisjava.Student;

//mapper.StudentMapper3 namespace의 sql 구문.
/*
 * interface를 이용하여 mybatis 사용하기.
 * 	1. xml을 mybatis-config.xml에 등록해야 함. 이 때 등록되는 xml에 <Mapper namespace="interface의 이름(패키지명 포함)과 같은 이름">... -> 인터페이스의 쌍둥이 xml
 * 	2. 인터페이스의 이름이 네임스페이스다.
 * 	3. 인터페이스의 메서드 이름과 xml의 id 속성값이 달라야 한다. -> 중복 불가.
 */
public interface StudentMapper3 { 
	
	@Select("select * from student")  //mapper.StudentMapper3.select 이름의 sql 구문.
	List<Student> select();  //리턴타입이 List<Student> : 받을 때 같은 타입으로 받아줘야 함.  //메서드 오버로딩 하지마세욜.
	
	@Insert("insert into student (studno, id, name, jumin) values (#{studno}, #{id}, #{name}, #{jumin})")
	int insert(Student st);  //리턴값이 int이면 추가, 수정된 레코드 수 리턴.
	
	@Update("update student set id=concat(id,#{id}) where name like '%${name}%'")
	int update(Student st);

	@Delete("delete from student where name=#{name} and studno=#{studno}")
	int delete(Student st);
//	int delete(Map<String, Object> map);  //Map 객체 가능.

}