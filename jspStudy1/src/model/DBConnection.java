package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	static Connection getConnection() {  //같은 패키지인 model 패키지에서만 접근 가능. static이라서 객체화 이전에 사용 가능.
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/model1", "model1", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) {
				conn.commit();
				conn.close();
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
