package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mybatisjava.Student;

//mapper.StudentMapper3 namespace�� sql ����.
/*
 * interface�� �̿��Ͽ� mybatis ����ϱ�.
 * 	1. xml�� mybatis-config.xml�� ����ؾ� ��. �� �� ��ϵǴ� xml�� <Mapper namespace="interface�� �̸�(��Ű���� ����)�� ���� �̸�">... -> �������̽��� �ֵ��� xml
 * 	2. �������̽��� �̸��� ���ӽ����̽���.
 * 	3. �������̽��� �޼��� �̸��� xml�� id �Ӽ����� �޶�� �Ѵ�. -> �ߺ� �Ұ�.
 */
public interface StudentMapper3 { 
	
	@Select("select * from student")  //mapper.StudentMapper3.select �̸��� sql ����.
	List<Student> select();  //����Ÿ���� List<Student> : ���� �� ���� Ÿ������ �޾���� ��.  //�޼��� �����ε� ����������.
	
	@Insert("insert into student (studno, id, name, jumin) values (#{studno}, #{id}, #{name}, #{jumin})")
	int insert(Student st);  //���ϰ��� int�̸� �߰�, ������ ���ڵ� �� ����.
	
	@Update("update student set id=concat(id,#{id}) where name like '%${name}%'")
	int update(Student st);

	@Delete("delete from student where name=#{name} and studno=#{studno}")
	int delete(Student st);
//	int delete(Map<String, Object> map);  //Map ��ü ����.

}