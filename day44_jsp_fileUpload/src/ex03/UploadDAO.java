package ex03;

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

public class UploadDAO {
	private static UploadDAO instance = new UploadDAO();
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private UploadDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static UploadDAO getInstance() {
		return instance;
	}
	
	// select * from upload1 order by idx
	public List<UploadDTO> selectAll() {
		ArrayList<UploadDTO> list = new ArrayList<UploadDTO>();
		String sql = "select * from upload1 order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UploadDTO dto = mapping(rs);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return list;
	}
	
	// insert into upload1(title, uploadFile) values(?, ?)
	public int insert(UploadDTO dto) {
		int row = 0;
		String sql = "insert into upload1(title, uploadFile) values(?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getUploadFile());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;
	}
	
	// delete upload1 where idx=?
	public int delete(int idx) {
		int row = 0;
		String sql = "delete upload1 where idx=?";
		
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
	
	public void close() {
		try { if(rs != null)	rs.close(); } 	 catch(Exception e) {}
		try { if(pstmt != null)	pstmt.close(); } catch(Exception e) {}
		try { if(conn != null)	conn.close(); }  catch(Exception e) {}
	}
	
	public UploadDTO mapping(ResultSet rs) throws SQLException {
		UploadDTO dto = new UploadDTO();
		
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setUploadDate(rs.getDate("uploadDate"));
		dto.setUploadFile(rs.getString("uploadFile"));
		
		return dto;
	}
}
