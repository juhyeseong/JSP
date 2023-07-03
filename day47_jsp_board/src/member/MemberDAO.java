package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
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
	
	// 가입
	public int insert(MemberDTO dto) {
		int row = 0;
		String sql = "insert into board_member(userId, userPw, userName, email) values(?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getEmail());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;
	}
	
	// 로그인
	public MemberDTO login(MemberDTO user) {
		MemberDTO login = null;
		String sql = "select * from board_member where userId=? and userPw=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				login = new MemberDTO();
				
				login.setEmail(rs.getString("email"));
				login.setIdx(rs.getInt("idx"));
				login.setUserId(rs.getString("userId"));
				login.setUserName(rs.getString("userName"));
				login.setUserPw(rs.getString("userPw"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return login;
	}
	
	public void close() {
		try { if(rs != null) 	rs.close(); } 	 catch (Exception e) {}
		try { if(pstmt != null) pstmt.close(); } catch (Exception e) {}
		try { if(conn != null) 	conn.close(); }	 catch (Exception e) {}
	}
}
