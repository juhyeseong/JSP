package diary;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DiaryDAO {
	private Connection conn;		// DB연결 (DriverManager.getConnection(url, user, password))
	private PreparedStatement pstmt;// 연결상태가 정상이라면 쿼리문을 전달하여 실행하기 위한 객체
	private ResultSet rs;			// 쿼리가 select인 경우, 결과셋을 저장하기 위한 객체
	
	private Context init;			// context.xml 에 정의된 객체를 담고 있는 객체 컨테이너
	private DataSource ds;			// 여러 Connection 객체를 가지고 있는 DataSource
	
	private static DiaryDAO instance = new DiaryDAO();
	
	public static DiaryDAO getInstance() {
		return instance;
	}
	
	private DiaryDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
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
	
	public List<DiaryDTO> selectAll() {
		ArrayList<DiaryDTO> list = new ArrayList<DiaryDTO>();
		String sql = "select * from diary order by writedate";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DiaryDTO dto = mapping(rs);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return list;
	}
	
	public List<DiaryDTO> searchDate(int month) {
		ArrayList<DiaryDTO> list = new ArrayList<DiaryDTO>();
		String sql = "select * from diary where extract(month from writeDate) = ? order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, month);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DiaryDTO dto = mapping(rs);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return list;
	}
	
	public int insert(DiaryDTO dto) {
		int row = 0;
		String sql = "insert into diary(pic, content, ipaddr, agent) values(?, ?, ?, ?)";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPic());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getIpaddr());
			pstmt.setString(4, dto.getAgent());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;
	}
	
	public void close() {
		try { if(rs != null) 	rs.close(); } 	 catch (Exception e) {}
		try { if(pstmt != null) pstmt.close(); } catch (Exception e) {}
		try { if(conn != null) 	conn.close(); }  catch (Exception e) {}
	}
	
	public DiaryDTO mapping(ResultSet rs) throws SQLException {
		DiaryDTO dto = new DiaryDTO();
		
		dto.setContent(rs.getString("content"));
		dto.setIdx(rs.getInt("idx"));
		dto.setIpaddr(rs.getString("ipaddr"));
		dto.setPic(rs.getString("pic"));
		dto.setWritedate(rs.getDate("writedate"));
		
		return dto;
	}
}
