package member;

// 1) 싱글톤 구현
// 2) 커넥션 풀 연결
// 3) pstmt 사용하기 : SQL에서 파라미터가 많이 사용될 경우, 순서대로 값을 넣어주는 객체

/*
  stmt = conn,createStatement();
  rs = stmt.executeQuery(sql);
  
  pstmt = conn.prepareStatement(sql);	// (자료형에 따라 쿼리문을 다르게 만들어준다)
  pstmt.setString(1, dto.getName());	// 문자열은 자동으로 따옴표를 묶어준다
  pstmt.setInt(2, dto.getAge());		// 숫자는 그냥 입력한다
  rs = pstmt.executeQuery();			// 이미 쿼리문을 전달했기 때문에 인자를 추가로 전달하지 않늗다
 */

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.*;
import javax.naming.*;

public class MemberDAO {
	private	Connection conn;
	private	PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.err.println("DAO 생성자 예외 발생 : " + e);
			// e.printStackTrace();
		}
	}
	
	// 테스트
	public String test() {
		String banner = "";
		String sql = "select banner from v$version";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				banner = rs.getString("banner");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return banner;
	}
	
	// 전체 목록 불러오기
	public List<MemberDTO> selectAll() {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "select * from member1 order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = mapping(rs);
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return list;
	}
	
	// 르그인(객체 하나 검색)
	public MemberDTO login(String userId, String userPw) {
		MemberDTO dto = null;
		String sql = "select * from member1 where userId=? and userPw=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { dto = mapping(rs); }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return dto;
	}
	
	// 회원가입(insert)
	public int join(MemberDTO dto) {
		int row = 0;
		String sql = "insert into " + 
						"member1(userid, userpw, username, email, gender, birth, age) " + 
						"values (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getBirth());
			pstmt.setInt(7, dto.getAge());
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;
	}
	
	public int update(MemberDTO dto) {
		int row = 0;
		String sql = "update member1 set " + 
						"userpw=?, email=?, age=? " + 
						"where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserPw());
			pstmt.setString(2, dto.getEmail());
			pstmt.setInt(3, dto.getAge());
			pstmt.setInt(4, dto.getIdx());
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;	
	}
	
	// 삭제
	public int delete(int idx) {
		int row = 0;
		String sql = "delete member1 where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;
	}
	
	// rs를 전달받아서, MemberDTO 하나를 반환하는 함수(내부에서만 사용)
	private MemberDTO mapping(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		
			dto.setAge(rs.getInt("age"));
			dto.setBirth(rs.getString("birth"));
			dto.setEmail(rs.getString("email"));
			dto.setGender(rs.getString("gender"));
			dto.setIdx(rs.getInt("idx"));
			dto.setUserId(rs.getString("userId"));
			dto.setUserName(rs.getString("userName"));
			dto.setUserPw(rs.getString("userPw"));
		
		return dto;
	}
	
	private void close() {
		try { if(rs != null)	rs.close(); } 	catch(Exception e) {}
		try { if(pstmt != null)	pstmt.close(); }catch(Exception e) {}
		try { if(conn != null)	conn.close(); } catch(Exception e) {}
	}
	
	
}
