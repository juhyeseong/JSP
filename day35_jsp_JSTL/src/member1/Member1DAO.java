package member1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.jdbc.driver.OracleDriver;

public class Member1DAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private	ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private	String password = "it";
	
	private String className = OracleDriver.class.getName();
	
	public Member1DAO() {
		try {
			Class.forName(className);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// 전체 목록
	public ArrayList<Member1DTO> selectAll() {
		ArrayList<Member1DTO> list = new ArrayList<Member1DTO>();
		String sql = "select * from member1 order by idx";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member1DTO dto = new Member1DTO();
				
				dto.setAge(rs.getInt("age"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setIdx(rs.getInt("idx"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserPw(rs.getString("userPw"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	// 객체 하나
	public Member1DTO login(String userId, String userPw) {
		Member1DTO dto = null;
		String sql = "select * from member1 where userid=? and userpw=?";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new Member1DTO();
				
				dto.setAge(rs.getInt("age"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setIdx(rs.getInt("idx"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserPw(rs.getString("userPw"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
	}
	
	// 검색
	public ArrayList<Member1DTO> search(String search) {
		ArrayList<Member1DTO> list = new ArrayList<Member1DTO>();
		String sql = "select * from member1 " + 
						"where username like '%%%s%%' " + 
						"order by idx";
		sql = String.format(sql, search);
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member1DTO dto = new Member1DTO();
				
				dto.setAge(rs.getInt("age"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setIdx(rs.getInt("idx"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserPw(rs.getString("userPw"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	// 추가
	public int join(Member1DTO dto) {
		int row = 0;
		String sql = "insert into " + 
						"member1(userid, userpw, username, email, gender, age) " + 
						"values (?, ?, ?, ?, ?, ?)";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getGender());
			pstmt.setInt(6, dto.getAge());
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return row;
	}
	
	// 수정
	public int update(Member1DTO dto) {
		int row = 0;
		String sql = "update member1 set " + 
						"userPw=?, email=?, age=? " + 
						"where idx=?";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserPw());
			pstmt.setString(2, dto.getEmail());
			pstmt.setInt(3, dto.getAge());
			pstmt.setInt(4, dto.getIdx());
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return row;	
	}
	
	// 삭제
	public int delete(int idx) {
		int row = 0;
		String sql = "delete member1 where idx=?";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return row;
	}
	
	public void close() {
		try { if(rs != null) 	rs.close();		}	catch(Exception e) {}
		try { if(pstmt != null) 	pstmt.close();		}	catch(Exception e) {}
		try { if(conn != null) 	conn.close();		}	catch(Exception e) {}
	}
}
