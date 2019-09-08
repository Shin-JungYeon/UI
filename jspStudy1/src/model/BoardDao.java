package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	public int maxnum() {
		Connection conn = DBConnection.getConnection();  //��üȭ ���� �ʰ� �ٷ� ��� ����.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select ifnull(max(num),0) from board";  //ù��° �Խù� ��� ������ ���� ���� ����.
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {  //�� �� ���� ���ָ� �ż� if ���� �ʿ� ����.
//				int maxnum = rs.getInt("ifnull(max(num),0)");  //��ȸ�� �÷��� �״�� �־���� ��. �Ǵ� �÷� ����(���⼭�� 1).
				int maxnum = rs.getInt(1);
				return maxnum;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public boolean insert(Board board) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into board (num, name, pass, subject, content, file1, regdate, readcnt, ref, reflevel, refstep)"
						+ " values (?, ?, ?, ?, ?, ?, now(), 0, ?, ?, ?)";  //��¥�� sql ��¥�Լ� now()����ϸ� ��. readcnt�� ó���� ������ 0.
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getPass());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getFile1());
			pstmt.setInt(7, board.getRef());  //���ڴ� ��� �÷��� ������ �ƴ� ?���� ����.
			pstmt.setInt(8, board.getReflevel());
			pstmt.setInt(9, board.getRefstep());
			pstmt.executeUpdate();
			return true;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}
	
	public int boardCount() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from board";  //��ü �Խù� �� ���.
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	public List<Board> list(int pageNum, int limit) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from board order by ref desc, refstep asc limit ?,?";  //limit ?,? : ��? �� °(���� �ε���) ���� ��?(����)���� ������. mariadb���� ���� �����.
		//order by ref desc : (���� ref == num) �������� ����.
		//		   refstep asc : �������� ����.
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNum - 1) * limit);  //0�̸� ù �� ° ���ڵ�.
			pstmt.setInt(2, limit);  //limit�� ������ 10. 10���� �ȵǸ� �˾Ƽ� �ִ°͸�ŭ�� ������.
			/*
			 * limit 0, 10 : 0+1(1)�� ° ���ڵ���� 10�� ��ȸ.
			 * limit 10, 10 : 10+1(11)�� ° ���ڵ� ���� 10�� ��ȸ.
			 *  
			 * pageNum = 1
			 * 	-> 0�� �ε������� 10�� ��ȸ.
			 * pageNum = 2
			 * 	-> 10�� �ε������� 10�� ��ȸ.
			 * pageNum = 3
			 * 	-> 20�� �ε������� 10�� ��ȸ.
			 */
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board b = new Board();
				b.setNum(rs.getInt("num"));
				b.setName(rs.getString("name"));
				b.setPass(rs.getString("pass"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setFile1(rs.getString("file1"));
				b.setRef(rs.getInt("ref"));
				b.setReflevel(rs.getInt("reflevel"));
				b.setRefstep(rs.getInt("refstep"));
				b.setReadcnt(rs.getInt("readcnt"));
				b.setRegdate(rs.getTimestamp("regdate"));
				list.add(b);
			}
			return list;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public Board selectOne(int num) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setPass(rs.getString("pass"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setFile1(rs.getString("file1"));
				board.setRef(rs.getInt("ref"));
				board.setReflevel(rs.getInt("reflevel"));
				board.setRefstep(rs.getInt("refstep"));
				board.setReadcnt(rs.getInt("readcnt"));
				board.setRegdate(rs.getTimestamp("regdate"));
				return board;
			} 
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public void readcntadd(int num) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set readcnt = readcnt+1 where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
	}
	
	//hw_reply.jsp ���� ���.
	public int maxreflevel() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(reflevel) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int maxreflevel = rs.getInt(1);
			return maxreflevel;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int maxrefstep() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select max(refstep) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int maxrefstep = rs.getInt(1);
			return maxrefstep;
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	//hw_reply.jsp ���� ���.
	
	public void refstepadd(int ref, int refstep) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set refstep = refstep + 1 where ref = ? and refstep > ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, refstep);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
	}
	
	public boolean update(Board board) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set name = ?, subject = ?, content = ?, file1 = ? where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getFile1());
			pstmt.setInt(5, board.getNum());
			pstmt.executeUpdate();
			return true;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}
	
	public boolean delete(int num) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from board where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			return true;
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}
	
}