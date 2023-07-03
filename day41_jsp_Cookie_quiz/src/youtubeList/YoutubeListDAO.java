package youtubeList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class YoutubeListDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static YoutubeListDAO instance = new YoutubeListDAO();
	
	public static YoutubeListDAO getInstance() {
		return instance;
	}
	
	private YoutubeListDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("DAO 생성자 예외 발생 : " + e);
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
	
	public ArrayList<YoutubeListDTO> selectAll() {
		ArrayList<YoutubeListDTO> list = new ArrayList<YoutubeListDTO>();
		String sql = "select * from youtube_list order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				YoutubeListDTO dto = mapping(rs);
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return list;
	}
	
	public YoutubeListDTO selectOne(int idx) {
		YoutubeListDTO dto = null;
		String sql = "select * from youtube_list where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = mapping(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return dto;
	}
	
	public int insert(YoutubeListDTO dto) {
		String title = dto.getIframe().substring(dto.getIframe().indexOf("title=\""));
		title = title.replace("title=\"", "");
		title = title.substring(0, title.indexOf("\""));
		
		int row = 0;
		String sql = "insert into youtube_list(title, channel, thumbnail, iframe) " + 
						"values(?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, dto.getChannel());
			pstmt.setString(3, dto.getThumbnail());
			pstmt.setString(4, dto.getIframe());
			
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;
	}
	
	public void close() {
		try { if(rs != null) 	rs.close(); } 	 catch(Exception e) {}
		try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
		try { if(conn != null) 	conn.close(); }  catch(Exception e) {}
	}
	
	public YoutubeListDTO mapping(ResultSet rs) throws SQLException {
		YoutubeListDTO dto = new YoutubeListDTO();
		
		dto.setChannel(rs.getString("channel"));
		dto.setIdx(rs.getInt("idx"));
		dto.setIframe(rs.getString("iframe"));
		dto.setThumbnail(rs.getString("thumbnail"));
		dto.setTitle(rs.getString("title"));
		
		return dto;
	}
}
