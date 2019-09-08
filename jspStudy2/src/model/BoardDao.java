package model;

//import java.sql.Connection;
//import java.sql.Date;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.BoardMapper;

public class BoardDao {
	private static final String ns = "mapper.BoardMapper.";
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public int maxnum() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).maxnum();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public boolean insert(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).insert(board);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public int boardCount(String column, String find) {
		SqlSession session = DBConnection.getConnection();
		String col1 = column;
//		String col2 = null;
		try {
//			if(column != null) {  //column에 subject,content 와 같은 식으로 입력해서 column값을 여러 개 받을 때 사용.
//				String[] cols = column.split(",");
//				col1 = cols[0];
//				if(cols.length == 2) {
//					col2 = cols[1];
//				}
//			}
			map.clear();
			map.put("column", col1);
//			map.put("col2", col2);
			map.put("find", find);
			return session.selectOne(ns + "count", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Board> list(int pageNum, int limit, String column, String find) {
		SqlSession session = DBConnection.getConnection();
		String col1 = column;
//		String col2 = null;
		try {
//			if(column != null) {  //column에 subject,content 와 같은 식으로 입력해서 column값을 여러 개 받을 때 사용.
//				String[] cols = column.split(",");
//				col1 = cols[0];
//				if(cols.length == 2) {
//					col2 = cols[1];
//				}
//			}
			map.clear();
			map.put("start", (pageNum - 1) * limit);
			map.put("limit", limit);
			map.put("column", col1);
//			map.put("col2", col2);
			map.put("find", find);
//			return session.getMapper(BoardMapper.class).list(map);
			return session.selectList(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public boolean update(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).update(board);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public Board selectOne(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
//			return session.getMapper(BoardMapper.class).selectOen(num);
			map.clear();
			map.put("num", num);
			return session.selectOne(ns + "select", map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public void readcntadd(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(BoardMapper.class).readcntadd(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
	}

	public int maxreflevel() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).maxreflevel();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int maxrefstep() {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).maxrefstep();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public void refstepadd(int ref, int refstep) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("ref", ref);
			map.put("refstep", refstep);
			session.getMapper(BoardMapper.class).refstepadd(map);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
	}

	public boolean delete(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).delete(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	
	public boolean reply(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(BoardMapper.class).reply(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}
	
	
//	public int maxnum() {
//		Connection conn = DBConnection.getConnection();  //객체화 하지 않고 바로 사용 가능.
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "select ifnull(max(num),0) from board";  //첫번째 게시물 등록 전에는 값이 없기 때문.
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {  //딱 한 번만 해주면 돼서 if 굳이 필요 없음.
////				int maxnum = rs.getInt("ifnull(max(num),0)");  //조회한 컬럼명 그대로 넣어줘야 함. 또는 컬럼 순번(여기서는 1).
//				int maxnum = rs.getInt(1);
//				return maxnum;
//			}
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return -1;
//	}
//	
//	public boolean insert(Board board) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "insert into board (num, name, pass, subject, content, file1, regdate, readcnt, ref, reflevel, refstep)"
//						+ " values (?, ?, ?, ?, ?, ?, now(), 0, ?, ?, ?)";  //날짜는 sql 날짜함수 now()사용하면 됨. readcnt는 처음엔 무조건 0.
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, board.getNum());
//			pstmt.setString(2, board.getName());
//			pstmt.setString(3, board.getPass());
//			pstmt.setString(4, board.getSubject());
//			pstmt.setString(5, board.getContent());
//			pstmt.setString(6, board.getFile1());
//			pstmt.setInt(7, board.getRef());  //숫자는 모든 컬럼의 순번이 아닌 ?만의 순번.
//			pstmt.setInt(8, board.getReflevel());
//			pstmt.setInt(9, board.getRefstep());
//			pstmt.executeUpdate();
//			return true;
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, null);
//		}
//		return false;
//	}
//	
//	public int boardCount() {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "select count(*) from board";  //전체 게시물 수 계산.
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			rs.next();
//			return rs.getInt(1);
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, rs);
//		}
//		return 0;
//	}
//	
//	public List<Board> list(int pageNum, int limit) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<Board> list = new ArrayList<Board>();
//		String sql = "select * from board order by ref desc, refstep asc limit ?,?";  //limit ?,? : 앞? 번 째(시작 인덱스) 부터 뒤?(갯수)개만 가져옴. mariadb에서 쓰는 예약어.
//		//order by ref desc : (현재 ref == num) 내림차순 정렬.
//		//		   refstep asc : 오름차순 정렬.
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, (pageNum - 1) * limit);  //0이면 첫 번 째 레코드.
//			pstmt.setInt(2, limit);  //limit은 무조건 10. 10개가 안되면 알아서 있는것만큼만 가져옴.
//			/*
//			 * limit 0, 10 : 0+1(1)번 째 레코드부터 10개 조회.
//			 * limit 10, 10 : 10+1(11)번 째 레코드 부터 10개 조회.
//			 *  
//			 * pageNum = 1
//			 * 	-> 0번 인덱스부터 10개 조회.
//			 * pageNum = 2
//			 * 	-> 10번 인덱스부터 10개 조회.
//			 * pageNum = 3
//			 * 	-> 20번 인덱스부터 10개 조회.
//			 */
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				Board b = new Board();
//				b.setNum(rs.getInt("num"));
//				b.setName(rs.getString("name"));
//				b.setPass(rs.getString("pass"));
//				b.setSubject(rs.getString("subject"));
//				b.setContent(rs.getString("content"));
//				b.setFile1(rs.getString("file1"));
//				b.setRef(rs.getInt("ref"));
//				b.setReflevel(rs.getInt("reflevel"));
//				b.setRefstep(rs.getInt("refstep"));
//				b.setReadcnt(rs.getInt("readcnt"));
//				b.setRegdate(rs.getTimestamp("regdate"));
//				list.add(b);
//			}
//			return list;
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, rs);
//		}
//		return null;
//	}
//	
//	public Board selectOne(int num) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "select * from board where num = ?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				Board board = new Board();
//				board.setNum(rs.getInt("num"));
//				board.setName(rs.getString("name"));
//				board.setPass(rs.getString("pass"));
//				board.setSubject(rs.getString("subject"));
//				board.setContent(rs.getString("content"));
//				board.setFile1(rs.getString("file1"));
//				board.setRef(rs.getInt("ref"));
//				board.setReflevel(rs.getInt("reflevel"));
//				board.setRefstep(rs.getInt("refstep"));
//				board.setReadcnt(rs.getInt("readcnt"));
//				board.setRegdate(rs.getTimestamp("regdate"));
//				return board;
//			} 
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, rs);
//		}
//		return null;
//	}
//	
//	public void readcntadd(int num) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "update board set readcnt = readcnt+1 where num = ?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			pstmt.executeUpdate();
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, null);
//		}
//	}
//	
//	//hw_reply.jsp 에서 사용.
//	public int maxreflevel() {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "select max(reflevel) from board";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			rs.next();
//			int maxreflevel = rs.getInt(1);
//			return maxreflevel;
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return -1;
//	}
//	
//	public int maxrefstep() {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "select max(refstep) from board";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			rs.next();
//			int maxrefstep = rs.getInt(1);
//			return maxrefstep;
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return -1;
//	}
//	//hw_reply.jsp 에서 사용.
//	
//	public void refstepadd(int ref, int refstep) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "update board set refstep = refstep + 1 where ref = ? and refstep > ?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, ref);
//			pstmt.setInt(2, refstep);
//			pstmt.executeUpdate();
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, null);
//		}
//	}
//	
//	public boolean update(Board board) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "update board set name = ?, subject = ?, content = ?, file1 = ? where num = ?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, board.getName());
//			pstmt.setString(2, board.getSubject());
//			pstmt.setString(3, board.getContent());
//			pstmt.setString(4, board.getFile1());
//			pstmt.setInt(5, board.getNum());
//			pstmt.executeUpdate();
//			return true;
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, null);
//		}
//		return false;
//	}
//	
//	public boolean delete(int num) {
//		Connection conn = DBConnection.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "delete from board where num = ?";
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			pstmt.executeUpdate();
//			return true;
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBConnection.close(conn, pstmt, null);
//		}
//		return false;
//	}
//	
}
