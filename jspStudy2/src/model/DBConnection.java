package model;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//�ּ�ó���� ���� mybatis ��� ���� ����.
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;

public class DBConnection {
	private static SqlSessionFactory sqlMap;
	static {
		String resource = "mapper/mybatis-config.xml";
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch(IOException e) {
			e.printStackTrace();
		}
		sqlMap = new SqlSessionFactoryBuilder().build(reader);
	}
	
	static SqlSession getConnection() {
		return sqlMap.openSession();
	}
	
	static void close(SqlSession session) {
		session.commit();
		session.close();
	}
	
//	static Connection getConnection() {  //���� ��Ű���� model ��Ű�������� ���� ����. static�̶� ��üȭ ������ ��� ����.
//		Connection conn = null;
//		try {
//			Class.forName("org.mariadb.jdbc.Driver");
//			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/model1", "model1", "1234");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return conn;
//	}
//	static void close(Connection conn, Statement stmt, ResultSet rs) {
//		try {
//			if(rs != null) rs.close();
//			if(stmt != null) stmt.close();
//			if(conn != null) {
//				conn.commit();
//				conn.close();
//			}
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//	}
	
}
