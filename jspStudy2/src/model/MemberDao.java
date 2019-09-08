package model;

//�ּ�ó���� ���� mybatis ��� ���� ����.
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MemberMapper;

//model class
public class MemberDao {
	private static final String ns = "mapper.MemberMapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public int insert(Member mem) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MemberMapper.class).insert(mem);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public Member selectOne(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			return session.selectOne(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	
	public int update(Member mem) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MemberMapper.class).update(mem);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public int updatePass(String id, String pass) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("pass", pass);
			map.put("id", id);
			return session.getMapper(MemberMapper.class).updatepass(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}
	
	public List<Member> list() {
		SqlSession session = DBConnection.getConnection();
		List<Member> list = null;
		try {
			list = session.selectList(ns + "select");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return list;
	}
	
	public int delete(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(MemberMapper.class).delete(id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Member> searchlist(String column, String find) {
		SqlSession session = DBConnection.getConnection();
		if(column != null && column.equals("")) column = null;  //�������� ������ ��ü ����� �������� �ϱ� ����. ���� �� �� �������� ������ �ƹ��͵� ������ ����.
		if(find != null && find.equals("")) find = null;
		map.clear();
		map.put("column", column);
		map.put("find", find);
		try {
			return session.selectList(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	
	
	
	
	
//	//mem : ȭ�鿡 �Էµ� ������ �����ϰ� �ִ� ��ü. �����ü.
//	public int insert(Member mem) {  //�ٸ� ��Ű������ ����ϱ� ������ ���������ڷ� public ���.
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "insert into member (id, pass, name, gender, email, tel, picture) values (?, ?, ?, ?, ?, ?, ?)";  //?�� ������ �÷��� ���ƾ���.
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, mem.getId());  //�������ֱ� ���� ���� ���� �־���.
//			pstmt.setString(2, mem.getPass());
//			pstmt.setString(3, mem.getName());
//			pstmt.setInt(4, mem.getGender());  //gender�� ������.
//			pstmt.setString(5, mem.getEmail());
//			pstmt.setString(6, mem.getTel());
//			pstmt.setString(7, mem.getPicture());
//			return pstmt.executeUpdate();  //��� ���� : 1 -> executeUpdate()�� ����� ���� ����. �����ϸ� ���ܹ߻�. -> catch�� �Ѿ.
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {  //����, ���� ������� ����.	
//			DBConnection.close(conn, pstmt, null);
//		}
//		return 0;  //��� ���� : 0
//	}
//	
//	public Member selectOne(String id) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "select * from member where id = binary ?";  //��ҹ��� ���� �ʿ�. ?�� �α��� ȭ�鿡�� �Է��� id �� �Է� ��.
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				Member mem = new Member();
//				mem.setId(rs.getString("id"));
//				mem.setPass(rs.getString("pass"));
//				mem.setName(rs.getString("name"));
//				mem.setGender(rs.getInt("gender"));
//				mem.setEmail(rs.getString("email"));
//				mem.setTel(rs.getString("tel"));
//				mem.setPicture(rs.getString("picture"));
//				return mem;
//			} 
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, rs);
//		}
//		return null;
//	}
//	
//	public int update(Member mem) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "update member set name=?, gender=?, email=?, tel=?, picture=? where id=?";  //id, pass�� ���� �Ұ�. id���� �ش��ϴ� ��쿡�� ����.
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, mem.getName());
//			pstmt.setInt(2, mem.getGender());
//			pstmt.setString(3, mem.getEmail());
//			pstmt.setString(4, mem.getTel());
//			pstmt.setString(5, mem.getPicture());
//			pstmt.setString(6, mem.getId());
//			return pstmt.executeUpdate();  //��� ���� : 1 -> executeUpdate()�� ����� ���� ����. �����ϸ� ���ܹ߻�. -> catch�� �Ѿ.
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {  //����, ���� ������� ����.
//			DBConnection.close(conn, pstmt, null);
//		}
//		return 0;  //��� ���� : 0
//	}
//	
//	public int updatePass(String id, String pass) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "update member set pass=? where id=?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, pass);
//			pstmt.setString(2, id);
//			return pstmt.executeUpdate();  //��� ���� : 1 -> executeUpdate()�� ����� ���� ����. �����ϸ� ���ܹ߻�. -> catch�� �Ѿ.
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {  //����, ���� ������� ����.
//			DBConnection.close(conn, pstmt, null);
//		}
//		return 0;  //��� ���� : 0
//	}
//	
//	public List<Member> list() {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<Member> list = new ArrayList<Member>();
//		try {
//			pstmt = conn.prepareStatement("select * from member");
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				Member m = new Member();
//				m.setId(rs.getString("id"));
//				m.setPass(rs.getString("pass"));
//				m.setName(rs.getString("name"));
//				m.setGender(rs.getInt("gender"));
//				m.setTel(rs.getString("tel"));
//				m.setEmail(rs.getString("email"));
//				m.setPicture(rs.getString("picture"));
//				list.add(m);
//			}
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, rs);
//		}
//		return list;
//	}
//	
//	public int delete(String id) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "delete from member where id=?";  //id, pass�� ���� �Ұ�. id���� �ش��ϴ� ��쿡�� ����.
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			return pstmt.executeUpdate();  //��� ���� : 1 -> executeUpdate()�� ����� ���� ����. �����ϸ� ���ܹ߻�. -> catch�� �Ѿ.
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {  //����, ���� ������� ����.
//			DBConnection.close(conn, pstmt, null);
//		}
//		return 0;
//	}
	
}
